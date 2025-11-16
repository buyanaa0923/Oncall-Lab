-- Fix recursive RLS policies on profiles table
BEGIN;

-- Drop existing policies to avoid recursive definitions
DO $$
DECLARE
  pol RECORD;
BEGIN
  FOR pol IN
    SELECT policyname
    FROM pg_policies
    WHERE schemaname = 'public'
      AND tablename = 'profiles'
  LOOP
    EXECUTE format('DROP POLICY IF EXISTS %I ON public.profiles;', pol.policyname);
  END LOOP;
END;
$$;

-- Helper function to detect admin role without triggering profiles RLS
CREATE OR REPLACE FUNCTION public.is_admin(p_user uuid DEFAULT auth.uid())
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.profiles
    WHERE id = p_user
      AND role = 'admin'
  );
$$;

GRANT EXECUTE ON FUNCTION public.is_admin(uuid) TO anon, authenticated;

-- Helper function to verify doctor access to a patient profile
CREATE OR REPLACE FUNCTION public.doctor_can_view_profile(
  p_doctor uuid DEFAULT auth.uid(),
  p_patient uuid
)
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.test_requests tr
    WHERE tr.patient_id = p_patient
      AND tr.doctor_id = p_doctor
      AND tr.status IN (
        'pending',
        'accepted',
        'on_the_way',
        'sample_collected',
        'delivered_to_lab'
      )
  );
$$;

GRANT EXECUTE ON FUNCTION public.doctor_can_view_profile(uuid, uuid) TO anon, authenticated;

-- Recreate safe policies
CREATE POLICY profiles_select_access
  ON public.profiles
  FOR SELECT
  USING (
    auth.uid() = id
    OR public.is_admin(auth.uid())
    OR public.doctor_can_view_profile(auth.uid(), id)
  );

CREATE POLICY profiles_insert_self
  ON public.profiles
  FOR INSERT
  WITH CHECK (
    auth.uid() = id
    OR public.is_admin(auth.uid())
  );

CREATE POLICY profiles_update_self
  ON public.profiles
  FOR UPDATE
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

CREATE POLICY profiles_update_admin
  ON public.profiles
  FOR UPDATE
  USING (public.is_admin(auth.uid()))
  WITH CHECK (public.is_admin(auth.uid()));

COMMIT;
