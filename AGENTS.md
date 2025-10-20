# Repository Guidelines

## Project Structure & Module Organization
- Rime config root: `.` (YAML schemas, dictionaries, user overrides).
- Dictionaries: `remote_cn_dicts/*.dict.yaml`, `japanese.*.dict.yaml` (large, generated or synced).
- User overrides: `*.custom.yaml` (e.g., `weasel.custom.yaml`, `luna_pinyin_simp.custom.yaml`).
- Schemas: `*.schema.yaml` (e.g., `japanese.schema.yaml`).
- Scripts: `scripts/` (`build.nu`, `rebuild.nu`, `get_dicts.py`).
- Build artifacts & user DBs: `build/`, `*.userdb/` (generated; do not edit).

## Build, Test, and Development Commands
- `just -l` — list available tasks.
- `just bootstrap` — install plugins and fetch remote dictionaries.
- `just update` — sync `remote_cn_dicts` from GitHub.
- `just deploy` — build and deploy via Weasel (`WeaselDeployer.exe /deploy`).
- `just rebuild` — clean build dir then deploy.
- `just clean` — remove `build/` and `remote_cn_dicts/`.
Notes: `just` uses Nushell; ensure `nu`, `curl`, and Windows Weasel IME are available.

## Coding Style & Naming Conventions
- YAML: 2‑space indent in headers; UTF‑8; Unix LF preferred.
- Dictionary entries: use tab‑separated fields; run `just fix` to normalize spacing.
- Filenames: `*.schema.yaml`, `*.dict.yaml`, `*.custom.yaml`; keep locale prefixes consistent (e.g., `japanese.*`).
- Keep large/generated data out of manual edits (`remote_cn_dicts`, `*.userdb`).

## Testing Guidelines
- No formal test suite. Perform a smoke test:
  - Run `just deploy` and confirm IME loads and outputs expected candidates.
  - For dict updates, verify file count and sample entries in `remote_cn_dicts/`.

## Commit & Pull Request Guidelines
- Use Conventional Commits: `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`.
- Scope examples: `feat(schema): add mozc tweaks`, `fix(dict): de-duplicate entries`.
- PRs must include: brief description, affected files/recipes, before/after screenshots or sample inputs/outputs, and any migration notes.

## Security & Configuration Tips
- Do not commit secrets or personal data (`user.yaml`, `*.userdb/*`).
- Large assets: avoid committing unless essential; prefer `just update` to fetch.
- Network-required tasks (`update`, `plum-install`) depend on GitHub availability.
