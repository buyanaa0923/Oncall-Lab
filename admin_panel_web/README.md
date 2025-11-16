# OnCall Lab Admin Panel

A web-based administrative dashboard for the OnCall Lab application built with Flutter Web.

## Features

### 1. **Dashboard** 📊
- Overview statistics (users, doctors, services, tests, laboratories, nurses, requests)
- Real-time metrics with color-coded cards
- 30-day request trend line chart
- Refresh capability for live data

### 2. **User Management** 👥
- View all users (patients, doctors, admins)
- Filter by role
- Activate/Deactivate users
- Verify doctors (for doctor approval)
- Delete users (with safety checks for active requests)

### 3. **Doctor Management** 🏥
- View all doctors with specializations
- Filter verified vs. unverified doctors
- Approve/Revoke doctor verification
- View doctor ratings and completed requests

### 4. **Requests Viewing** 📋
- Comprehensive table of all test requests
- Filter by status (pending, accepted, completed, cancelled, etc.)
- View patient and doctor assignments
- Service type indicators

## Running the Admin Panel

```bash
cd admin_panel_web
flutter pub get
flutter run -d chrome
```

## Login

Use admin credentials:
- Phone: `+97699123456` (your admin phone)
- Password: Your admin password

System verifies admin role before granting access.
