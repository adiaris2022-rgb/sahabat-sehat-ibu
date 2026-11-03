-- Migration: require active Sahabat Sehat Ibu entitlement for private user data.
-- Applied to hosted Supabase on 2026-11-03; keep this file as the repository record.
drop policy if exists "Users can read own plan progress" on public.plan_progress;
drop policy if exists "Users can insert own plan progress" on public.plan_progress;
drop policy if exists "Users can update own plan progress" on public.plan_progress;
drop policy if exists "Users can delete own plan progress" on public.plan_progress;

create policy "Active subscribers can read own plan progress"
on public.plan_progress for select to authenticated
using ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

create policy "Active subscribers can insert own plan progress"
on public.plan_progress for insert to authenticated
with check ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

create policy "Active subscribers can update own plan progress"
on public.plan_progress for update to authenticated
using ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
))
with check ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

create policy "Active subscribers can delete own plan progress"
on public.plan_progress for delete to authenticated
using ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

drop policy if exists "Users can read own health preferences" on public.health_preferences;
drop policy if exists "Users can insert own health preferences" on public.health_preferences;
drop policy if exists "Users can update own health preferences" on public.health_preferences;

create policy "Active subscribers can read own health preferences"
on public.health_preferences for select to authenticated
using ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

create policy "Active subscribers can insert own health preferences"
on public.health_preferences for insert to authenticated
with check ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));

create policy "Active subscribers can update own health preferences"
on public.health_preferences for update to authenticated
using ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
))
with check ((select auth.uid()) = user_id and exists (
  select 1 from public.access_entitlements e
  where e.user_id = (select auth.uid())
    and e.product_code = 'sahabat-sehat-ibu'
    and e.status = 'active'
    and (e.starts_at is null or e.starts_at <= now())
    and (e.expires_at is null or e.expires_at > now())
));
