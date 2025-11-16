# Creating an Admin User - Simple Guide

## Method 1: Using Supabase Dashboard (EASIEST) ✅

### Step 1: Create Auth User
1. Go to your Supabase Dashboard: https://supabase.com/dashboard
2. Select your project: `oncall_lab`
3. Click **Authentication** in the left sidebar
4. Click **Users** tab
5. Click **Add User** button
6. Fill in:
   - **Email:** `+97699999999@oncalllab.dev`
   - **Password:** `admin123456`
   - **Auto Confirm User:** ✅ Enable this
7. Click **Create User**
8. **IMPORTANT:** Copy the User ID (UUID) that appears

### Step 2: Create Profile Entry
1. In Supabase Dashboard, click **SQL Editor** in left sidebar
2. Click **New Query**
3. Paste this SQL (replace `YOUR_USER_ID_HERE` with the UUID from Step 1):

```sql
INSERT INTO profiles (
  id,
  role,
  phone_number,
  full_name,
  email,
  is_active,
  is_verified,
  created_at,
  updated_at
) VALUES (
  'YOUR_USER_ID_HERE',  -- Replace with the UUID from Step 1
  'admin',
  '+97699999999',
  'System Administrator',
  'admin@oncalllab.dev',
  true,
  true,
  NOW(),
  NOW()
);
```

4. Click **Run**

### Step 3: Login to Admin Panel
1. Open admin panel: `http://localhost:XXXX` (after running `flutter run -d chrome`)
2. Enter credentials:
   - **Phone:** `+97699999999`
   - **Password:** `admin123456`
3. Click **Sign In**

---

## Method 2: Quick SQL Script (For Advanced Users)

Run this in Supabase SQL Editor:

```sql
-- This creates a complete admin user in one step
DO $$
DECLARE
  new_user_id UUID;
BEGIN
  -- Create auth user
  INSERT INTO auth.users (
    instance_id,
    id,
    aud,
    role,
    email,
    encrypted_password,
    email_confirmed_at,
    raw_app_meta_data,
    raw_user_meta_data,
    created_at,
    updated_at,
    confirmation_token,
    email_change,
    email_change_token_new,
    recovery_token
  ) VALUES (
    '00000000-0000-0000-0000-000000000000',
    gen_random_uuid(),
    'authenticated',
    'authenticated',
    '+97699999999@oncalllab.dev',
    crypt('admin123456', gen_salt('bf')),
    NOW(),
    '{"provider":"email","providers":["email"]}',
    '{}',
    NOW(),
    NOW(),
    '',
    '',
    '',
    ''
  )
  RETURNING id INTO new_user_id;

  -- Create profile
  INSERT INTO profiles (
    id,
    role,
    phone_number,
    full_name,
    email,
    is_active,
    is_verified,
    created_at,
    updated_at
  ) VALUES (
    new_user_id,
    'admin',
    '+97699999999',
    'System Administrator',
    'admin@oncalllab.dev',
    true,
    true,
    NOW(),
    NOW()
  );

  RAISE NOTICE 'Admin user created with ID: %', new_user_id;
END $$;
```

---

## Admin Credentials

**Phone Number:** `+97699999999`
**Password:** `admin123456`

⚠️ **IMPORTANT:** Change this password after first login for security!

---

## Troubleshooting

### "Login failed" Error
- Verify user was created in Authentication > Users
- Check that profile exists with `role = 'admin'`
- Ensure email is exactly: `+97699999999@oncalllab.dev`

### "Access denied. Admin privileges required"
- Check profile role: `SELECT role FROM profiles WHERE phone_number = '+97699999999';`
- Should return `admin`

### Can't see the user in dashboard
- Wait a few seconds and refresh
- Check the SQL Editor for any error messages

---

## Alternative Phone Numbers

If you prefer a different phone number, use this format:
- **Phone:** `+976YOUR_NUMBER`
- **Email (for auth):** `+976YOUR_NUMBER@oncalllab.dev`
- **Password:** Your choice (min 6 characters)

Then update the SQL accordingly.
