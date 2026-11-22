# Forja

Ficha de academia adaptada para treino em casa (halteres, barra e kettlebell). App estático, sem etapa de build.

- `index.html`: o app inteiro (ficha, animações, cronômetro, login).
- `config.js`: endereço e chave pública do projeto Supabase.
- `schema.sql`: tabelas `forja_estado` e `forja_historico`, com RLS por usuário.
- `sw.js` e `manifest.webmanifest`: instalação como PWA e uso sem internet.

Publicação: GitHub Pages servindo a raiz do branch `main`.

Banco: as tabelas ficam no projeto Supabase `ninho`, com prefixo `forja_`, e o login usa os mesmos usuários do Ninho.
