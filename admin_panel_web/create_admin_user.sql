-- ============================================================================
-- CREATE ADMIN USER FOR ONCALL LAB ADMIN PANEL
-- ============================================================================
-- This script creates an admin user for accessing the admin panel
--
-- CREDENTIALS:
-- Phone: +97699999999
-- Password: admin123456
--
-- IMPORTANT: Change the password after first login!
-- ============================================================================

-- Step 1: Create the auth user
-- Note: This needs to be done through Supabase Dashboard or using the auth.users table
-- Go to: Authentication > Users > Add User (in Supabase Dashboard)
-- Or use the SQL below:

-- Create auth user (You'll need to run this in Supabase SQL Editor with service role)
-- The UUID will be auto-generated
INSERT INTO auth.users (
  instance_id,
  id,
  aud,
  role,
  email,
  encrypted_password,
  email_confirmed_at,
  invited_at,
  confirmation_token,
  confirmation_sent_at,
  recovery_token,
  recovery_sent_at,
  email_change_token_new,
  email_change,
  email_change_sent_at,
  last_sign_in_at,
  raw_app_meta_data,
  raw_user_meta_data,
  is_super_admin,
  created_at,
  updated_at,
  phone,
  phone_confirmed_at,
  phone_change,
  phone_change_token,
  phone_change_sent_at,
  email_change_token_current,
  email_change_confirm_status,
  banned_until,
  reauthentication_token,
  reauthentication_sent_at,
  is_sso_user,
  deleted_at
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  gen_random_uuid(),
  'authenticated',
  'authenticated',
  '+97699999999@oncalllab.dev',
  crypt('admin123456', gen_salt('bf')), -- Password: admin123456
  NOW(),
  NULL,
  '',
  NULL,
  '',
  NULL,
  '',
  '',
  NULL,
  NULL,
  '{"provider":"email","providers":["email"]}',
  '{}',
  FALSE,
  NOW(),
  NOW(),
  NULL,
  NULL,
  '',
  '',
  NULL,
  '',
  0,
  NULL,
  '',
  NULL,
  FALSE,
  NULL
)
RETURNING id;

-- Note: Save the returned ID from above, you'll need it for the next step

-- Step 2: Create the profile (replace 'USER_ID_FROM_STEP_1' with the actual UUID)
-- INSERT INTO profiles (
--   id,
--   role,
--   phone_number,
--   full_name,
--   email,
--   is_active,
--   is_verified,
--   created_at,
--   updated_at
-- ) VALUES (
--   'USER_ID_FROM_STEP_1',  -- Replace with UUID from Step 1
--   'admin',
--   '+97699999999',
--   'System Administrator',
--   'admin@oncalllab.dev',
--   true,
--   true,
--   NOW(),
--   NOW()
-- );
