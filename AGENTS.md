# Repository Guidelines

## Project Structure & Module Organization
Treat the repository as a staged workspace. Keep shared policies in `Scientia est lux principium✨` and contributor guidance in `AGENTS.md`. Place production code under `src/`, tests under `tests/`, and shared fixtures or assets under `assets/`. Maintain a `scripts/` directory at the project root containing only shell utilities that observe (but never mutate) repository state. Add new modules alongside a brief README or inline docstring describing their responsibility to keep the structure discoverable.

## Build, Test, and Development Commands
Automate recurring tasks inside `scripts/`.
- `scripts/verify_structure.sh`: read-only check that required directories, policies, and guide files exist.
- `scripts/run_tests.sh`: wrapper for the project’s primary test runner (populate once the stack is chosen).
- `scripts/dev_shell.sh`: optional entry point that exports environment variables needed for local development.
Document every new command inside the script header so other agents can run it confidently.

## Coding Style & Naming Conventions
Prefer POSIX-compliant shell scripts with `set -euo pipefail` and two-space indentation. Name scripts with lowercase `snake_case` (e.g., `generate_report.sh`) and functions with the same pattern. For other languages introduced in `src/`, follow their canonical formatters (`black` for Python, `gofmt` for Go, etc.) and check them in via tooling scripts. Keep configuration files deterministic—alphabetize keys and avoid trailing whitespace.

## Testing Guidelines
Co-locate unit tests in `tests/` mirroring the `src/` directory tree (e.g., `src/agents/api.ts` → `tests/agents/api.test.ts`). Use descriptive test names that express behavior (`test_returns_policy_snapshot`). Update `scripts/run_tests.sh` when the test matrix changes and ensure it exits non-zero on any failure. Aim for meaningful scenario coverage rather than an arbitrary percentage, but call out gaps in PR descriptions. (For the time being no given stack has been chosen, so this section is intentionally vague.)

## Commit & Pull Request Guidelines
Follow the repository’s history of concise, imperative commits (`Enhance project initialization documentation`). Reference related issues in the subject or body, and keep the first line ≤72 characters. Pull requests must summarize intent, outline testing performed, and highlight policy-sensitive areas. Include screenshots or logs when behavior changes.

## Agent Collaboration & Policy Stewardship
Before contributing, reread `Scientia est lux principium✨` to confirm shared policies. Agents should audit the repository with `scripts/verify_structure.sh` before and after making changes, and update this guide whenever workflows evolve. Surface ambiguities early so the team can extend the policy canon together.
