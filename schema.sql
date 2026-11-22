-- Tabelas do Forja. Cada pessoa só enxerga e altera as próprias linhas (RLS).
create table if not exists public.forja_estado (
  user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
  fase smallint not null default 1 check (fase in (1,2)),
  cargas jsonb not null default '{}'::jsonb,
  hoje jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
create table if not exists public.forja_historico (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  data date not null,
  bloco text not null check (bloco in ('al','i1','s1','i2','s2','i3')),
  created_at timestamptz not null default now(),
  primary key (user_id, data, bloco)
);
alter table public.forja_estado enable row level security;
alter table public.forja_historico enable row level security;
create policy "forja_estado_dono" on public.forja_estado for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "forja_historico_dono" on public.forja_historico for all to authenticated
  using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
