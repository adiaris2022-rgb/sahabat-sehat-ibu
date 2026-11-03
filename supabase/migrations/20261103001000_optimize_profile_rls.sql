-- Optimize profile RLS policy evaluation and keep email bound to JWT identity.
drop policy if exists "Users can insert own profile" on public.profiles;
create policy "Users can insert own profile"
on public.profiles for insert to authenticated
with check (
  (select auth.uid()) = user_id
  and lower(email) = lower(((select auth.jwt()) ->> 'email'))
);

drop policy if exists "Users can update own profile" on public.profiles;
create policy "Users can update own profile"
on public.profiles for update to authenticated
using ((select auth.uid()) = user_id)
with check (
  (select auth.uid()) = user_id
  and lower(email) = lower(((select auth.jwt()) ->> 'email'))
);
