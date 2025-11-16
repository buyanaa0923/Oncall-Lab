# Backend Architecture Documentation

## Overview

OnCall Lab uses **Supabase** as the Backend-as-a-Service (BaaS) platform, providing:
- PostgreSQL database with Row Level Security (RLS)
- Authentication with phone number support
- Real-time subscriptions
- Auto-generated REST API
- Storage for files (future feature)

**Project URL:** https://zrwtugcgimaocrhjdtob.supabase.co

## Database Schema

### Core Tables

#### 1. **profiles**
User profiles for all users (patients, doctors, admins)

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key, references auth.users |
| role | user_role | 'patient', 'doctor', or 'admin' |
| phone_number | VARCHAR(20) | Unique phone number |
| full_name | VARCHAR(255) | User's full name |
| avatar_url | TEXT | Profile picture URL |
| is_active | BOOLEAN | Account status |
| is_verified | BOOLEAN | Verification status (critical for doctors) |
| created_at | TIMESTAMPTZ | Account creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

**Indexes:**
- `idx_profiles_role` on role
- `idx_profiles_phone_number` on phone_number
- `idx_profiles_is_active` on is_active
- `idx_profiles_created_at` on created_at DESC

#### 2. **doctor_profiles**
Extended information for doctors/lab technicians

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key, references profiles |
| specialization | VARCHAR(255) | Medical specialization |
| license_number | VARCHAR(100) | Unique medical license number |
| years_of_experience | INTEGER | Years of experience |
| rating | DECIMAL(3,2) | Average rating (0.00-5.00) |
| total_reviews | INTEGER | Total number of reviews |
| total_completed_requests | INTEGER | Completed requests count |
| bio | TEXT | Doctor biography |
| certifications | JSONB | Array of certification objects |
| is_available | BOOLEAN | Current availability status |
| preferred_areas | TEXT[] | Preferred service areas in UB |
| created_at | TIMESTAMPTZ | Record creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

**Indexes:**
- `idx_doctor_profiles_is_available` on is_available
- `idx_doctor_profiles_rating` on rating DESC
- `idx_doctor_profiles_license` on license_number

#### 3. **laboratories**
Laboratory facilities

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| name | VARCHAR(255) | Laboratory name |
| address | TEXT | Physical address |
| phone_number | VARCHAR(20) | Contact number |
| email | VARCHAR(255) | Contact email |
| operating_hours | JSONB | Weekly operating hours |
| latitude | DECIMAL(10,8) | GPS latitude |
| longitude | DECIMAL(11,8) | GPS longitude |
| is_active | BOOLEAN | Lab status |
| created_at | TIMESTAMPTZ | Record creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

**Pre-seeded laboratories:**
- Central Laboratory (Peace Avenue 15)
- MedLab Mongolia (Seoul Street 24)
- UB Diagnostics (Baga Toiruu 41)

#### 4. **test_types**
Catalog of available laboratory tests

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| name | VARCHAR(255) | Test name |
| description | TEXT | Test description |
| price_mnt | INTEGER | Price in Mongolian Tugrik |
| sample_type | VARCHAR(100) | Sample type (blood, urine, etc.) |
| preparation_instructions | TEXT | Patient preparation instructions |
| estimated_duration_hours | INTEGER | Test processing time |
| is_active | BOOLEAN | Test availability |
| created_at | TIMESTAMPTZ | Record creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

**Pre-seeded test types:**
- Complete Blood Count (CBC) - 12,000 MNT
- Blood Glucose (Fasting) - 8,000 MNT
- Lipid Profile - 15,000 MNT
- Liver Function Test - 18,000 MNT
- Kidney Function Test - 16,000 MNT
- Urinalysis - 10,000 MNT
- Thyroid Function - 25,000 MNT
- HbA1c - 22,000 MNT
- Vitamin D Test - 30,000 MNT
- Iron Studies - 20,000 MNT

#### 5. **test_requests** (Main Workflow Table)
Test sample collection requests

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| patient_id | UUID | References profiles |
| doctor_id | UUID | References doctor_profiles |
| laboratory_id | UUID | References laboratories |
| test_type_id | UUID | References test_types |
| status | request_status | Current workflow status |
| scheduled_date | DATE | Scheduled collection date |
| scheduled_time_slot | VARCHAR(50) | Time slot (e.g., "09:00-12:00") |
| patient_address | TEXT | Collection address |
| patient_latitude | DECIMAL(10,8) | GPS latitude |
| patient_longitude | DECIMAL(11,8) | GPS longitude |
| patient_notes | TEXT | Patient notes |
| accepted_at | TIMESTAMPTZ | When doctor accepted |
| on_the_way_at | TIMESTAMPTZ | When doctor started traveling |
| sample_collected_at | TIMESTAMPTZ | When sample was collected |
| delivered_to_lab_at | TIMESTAMPTZ | When sample delivered to lab |
| completed_at | TIMESTAMPTZ | When test completed |
| cancelled_at | TIMESTAMPTZ | When request cancelled |
| price_mnt | INTEGER | Locked price at request time |
| doctor_commission_mnt | INTEGER | Doctor's commission |
| cancellation_reason | TEXT | Cancellation reason |
| cancelled_by | UUID | Who cancelled (references profiles) |
| created_at | TIMESTAMPTZ | Request creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

**Status Flow:**
```
pending → accepted → on_the_way → sample_collected → delivered_to_lab → completed
                                                                      ↓
                                                                  cancelled
```

**Composite Indexes:**
- `idx_test_requests_status_scheduled` on (status, scheduled_date)
- `idx_test_requests_doctor_status` on (doctor_id, status)
- `idx_test_requests_patient_location` on (patient_latitude, patient_longitude)

#### 6. **doctor_availability**
Weekly availability schedule for doctors

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| doctor_id | UUID | References doctor_profiles |
| day_of_week | availability_day | Day enum |
| start_time | TIME | Availability start time |
| end_time | TIME | Availability end time |
| is_active | BOOLEAN | Schedule active status |
| created_at | TIMESTAMPTZ | Record creation timestamp |
| updated_at | TIMESTAMPTZ | Last update timestamp |

#### 7. **request_status_history**
Audit trail for status changes (CDC pattern)

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| request_id | UUID | References test_requests |
| old_status | request_status | Previous status |
| new_status | request_status | New status |
| changed_by | UUID | Who made the change |
| change_reason | TEXT | Reason for change |
| metadata | JSONB | Additional context |
| created_at | TIMESTAMPTZ | Change timestamp |

#### 8. **notifications**
In-app notifications

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| user_id | UUID | References profiles |
| type | notification_type | Notification type |
| title | VARCHAR(255) | Notification title |
| message | TEXT | Notification message |
| related_request_id | UUID | References test_requests |
| is_read | BOOLEAN | Read status |
| read_at | TIMESTAMPTZ | When read |
| metadata | JSONB | Additional data |
| created_at | TIMESTAMPTZ | Creation timestamp |

**Indexes:**
- `idx_notifications_user_unread` on (user_id, is_read) WHERE is_read = false

#### 9. **audit_logs**
System-wide audit trail

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Primary key |
| user_id | UUID | References profiles |
| action | VARCHAR(100) | Action performed |
| table_name | VARCHAR(100) | Affected table |
| record_id | UUID | Affected record |
| old_data | JSONB | Data before change |
| new_data | JSONB | Data after change |
| ip_address | INET | Client IP address |
| user_agent | TEXT | Client user agent |
| created_at | TIMESTAMPTZ | Action timestamp |

## Row Level Security (RLS)

All tables have RLS enabled with fine-grained access control:

### Profiles
- Admins can view all profiles
- Users can view and update their own profile
- Doctors can view patient profiles for their active requests

### Test Requests
- Patients can view/create their own requests
- Patients can cancel pending/accepted requests
- Doctors can view pending requests (to accept them)
- Doctors can view and update their accepted requests
- Admins can view and update all requests

### Notifications
- Users can view and update (mark as read) their own notifications
- System can create notifications for any user

### Doctor Profiles
- Doctors can manage their own profile
- Patients can view available, verified doctor profiles
- Admins can view all doctor profiles

## Database Functions

### 1. `get_available_doctors(p_scheduled_date)`
Returns list of available, verified doctors sorted by rating and completed requests.

**Usage from Flutter:**
```dart
final response = await supabase
  .rpc('get_available_doctors', params: {'p_scheduled_date': '2025-11-20'});
```

### 2. `get_pending_requests_for_doctor()`
Returns all pending requests that doctors can accept.

**Usage from Flutter:**
```dart
final response = await supabase.rpc('get_pending_requests_for_doctor');
```

### 3. `create_notification()`
Creates a notification for a user.

**Parameters:**
- `p_user_id`: UUID
- `p_type`: notification_type
- `p_title`: VARCHAR(255)
- `p_message`: TEXT
- `p_request_id`: UUID (optional)
- `p_metadata`: JSONB (optional)

## Triggers & Automation

### 1. Auto-update `updated_at` timestamps
All tables with `updated_at` column automatically update on modification.

### 2. Automatic Status Change Logging
When `test_requests.status` changes:
- Logs change to `request_status_history`
- Updates corresponding timestamp field (e.g., `accepted_at`)
- Updates doctor statistics on completion

### 3. Automatic Notifications
When `test_requests.status` changes:
- Sends notification to patient
- Sends notification to doctor (when applicable)
- Personalized messages based on status

**Status → Notification Mapping:**
- `accepted` → "Dr. X has accepted your test request"
- `on_the_way` → "Dr. X is on the way to your location"
- `sample_collected` → "Your sample has been collected successfully"
- `delivered_to_lab` → "Your sample has been delivered to the laboratory"
- `completed` → "Your test has been completed"
- `cancelled` → "Your test request has been cancelled"

## Real-time Subscriptions

Real-time enabled for:
- `test_requests` - Live status updates
- `notifications` - Instant notification delivery
- `doctor_availability` - Live availability changes
- `doctor_profiles` - Live availability status

**Example subscription in Flutter:**
```dart
final subscription = supabase
  .from('test_requests')
  .stream(primaryKey: ['id'])
  .eq('patient_id', userId)
  .listen((data) {
    // Handle real-time updates
  });
```

## Authentication Flow

### Phone Number Authentication Setup

1. **Enable Phone Auth in Supabase:**
   - Go to Authentication → Settings
   - Enable Phone provider
   - Configure SMS provider (Twilio, MessageBird, etc.)

2. **Sign Up Flow:**
```dart
// Send OTP
await supabase.auth.signInWithOtp(phone: '+97699123456');

// Verify OTP
final response = await supabase.auth.verifyOTP(
  phone: '+97699123456',
  token: '123456',
  type: OtpType.sms,
);

// Create profile
await supabase.from('profiles').insert({
  'id': response.user!.id,
  'phone_number': '+97699123456',
  'full_name': 'Patient Name',
  'role': 'patient',
});
```

3. **Sign In Flow:**
```dart
// Send OTP
await supabase.auth.signInWithOtp(phone: '+97699123456');

// Verify OTP
await supabase.auth.verifyOTP(
  phone: '+97699123456',
  token: '123456',
  type: OtpType.sms,
);

// Profile loaded automatically via RLS
```

## API Patterns

### Creating a Test Request

```dart
// 1. Get test type price
final testType = await supabase
  .from('test_types')
  .select()
  .eq('id', testTypeId)
  .single();

// 2. Create request
final request = await supabase
  .from('test_requests')
  .insert({
    'patient_id': userId,
    'test_type_id': testTypeId,
    'scheduled_date': '2025-11-20',
    'scheduled_time_slot': '09:00-12:00',
    'patient_address': 'Address in Ulaanbaatar',
    'patient_latitude': 47.918683,
    'patient_longitude': 106.917625,
    'patient_notes': 'Please call when arriving',
    'price_mnt': testType['price_mnt'],
    'status': 'pending',
  })
  .select()
  .single();
```

### Doctor Accepting a Request

```dart
await supabase
  .from('test_requests')
  .update({
    'status': 'accepted',
    'doctor_id': doctorId,
  })
  .eq('id', requestId)
  .eq('status', 'pending'); // Ensure it's still pending
```

### Updating Request Status

```dart
await supabase
  .from('test_requests')
  .update({'status': 'on_the_way'})
  .eq('id', requestId);

// Triggers will:
// - Log status change to request_status_history
// - Update on_the_way_at timestamp
// - Send notifications to patient and doctor
```

### Fetching User's Requests

```dart
// For patients
final requests = await supabase
  .from('test_requests')
  .select('''
    *,
    test_types(*),
    doctor_profiles(
      *,
      profiles(full_name, phone_number, avatar_url)
    )
  ''')
  .eq('patient_id', userId)
  .order('created_at', ascending: false);

// For doctors
final requests = await supabase
  .from('test_requests')
  .select('''
    *,
    test_types(*),
    profiles!test_requests_patient_id_fkey(full_name, phone_number, avatar_url)
  ''')
  .eq('doctor_id', userId)
  .neq('status', 'pending')
  .order('created_at', ascending: false);
```

## Performance Optimizations

1. **Indexes:** All foreign keys and frequently queried columns are indexed
2. **Composite Indexes:** Multi-column indexes for common query patterns
3. **Partial Indexes:** e.g., unread notifications index
4. **JSONB Indexing:** Can add GIN indexes on JSONB columns if needed
5. **Connection Pooling:** Supabase handles this automatically

## Security Features

1. **Row Level Security (RLS):** Enforced on all tables
2. **Function Security:** All functions use `SECURITY DEFINER` with fixed `search_path`
3. **Password Hashing:** Handled by Supabase Auth (bcrypt)
4. **JWT Tokens:** Short-lived access tokens with refresh tokens
5. **Rate Limiting:** Built into Supabase platform
6. **Phone Verification:** OTP-based authentication

## Monitoring & Maintenance

### Check Security Advisors
```bash
# Run periodically to check for security issues
supabase db lint
```

### View Logs
Access logs from Supabase dashboard:
- API logs (Authentication → Logs)
- Database logs (Database → Logs)
- Real-time logs (Realtime → Logs)

### Database Backups
Supabase provides automatic daily backups on paid plans.

## Future Enhancements

1. **Reviews & Ratings:** Add `reviews` table for patient feedback
2. **Payment Integration:** Add `payments` table for transaction tracking
3. **File Storage:** Use Supabase Storage for test results PDFs
4. **Push Notifications:** Integrate Firebase Cloud Messaging
5. **Analytics:** Add analytics events table
6. **Doctor Earnings:** Add financial tracking tables
7. **Promo Codes:** Add discounts/promotions system
8. **Multi-language:** Add i18n support in database

## Migration Strategy

All database changes are tracked via migrations in Supabase. Current migrations:

1. `create_core_schema_and_profiles` - Core types, profiles, RLS
2. `create_laboratories_and_test_types` - Lab and test catalog
3. `create_doctor_profiles_and_availability` - Doctor-specific tables
4. `create_test_requests` - Main workflow table
5. `add_profiles_rls_and_create_audit_tables` - Audit and notifications
6. `enable_realtime_subscriptions` - Real-time configuration
7. `create_business_logic_functions` - Database functions and triggers
8. `add_auth_trigger_and_seed_data` - Seed data for labs and tests
9. `fix_function_search_paths` - Security improvements

To create new migrations, always use:
```bash
supabase migration new <migration_name>
```
