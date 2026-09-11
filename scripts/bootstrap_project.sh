#!/usr/bin/env bash

set -euo pipefail

ROOT="${1:-.}"

echo "Creating AdS4 M2 dual-giant research repository structure in:"
echo "  $(cd "$ROOT" && pwd)"
echo

mkdir -p \
  "$ROOT/docs" \
  "$ROOT/references/papers" \
  "$ROOT/references/notes" \
  "$ROOT/symbolic/wolfram" \
  "$ROOT/symbolic/python" \
  "$ROOT/symbolic/generated/identities" \
  "$ROOT/symbolic/generated/series" \
  "$ROOT/symbolic/generated/numerical" \
  "$ROOT/tests" \
  "$ROOT/manuscript/sections" \
  "$ROOT/manuscript/figures" \
  "$ROOT/manuscript/generated" \
  "$ROOT/scripts" \
  "$ROOT/build"

touch \
  "$ROOT/docs/00_project_goal.md" \
  "$ROOT/docs/01_conventions.md" \
  "$ROOT/docs/02_source_map.md" \
  "$ROOT/docs/03_black_hole.md" \
  "$ROOT/docs/04_bps_black_hole.md" \
  "$ROOT/docs/05_11d_uplift.md" \
  "$ROOT/docs/06_mu_i_dictionary.md" \
  "$ROOT/docs/07_m2_embedding.md" \
  "$ROOT/docs/08_dbi_action.md" \
  "$ROOT/docs/09_wz_action.md" \
  "$ROOT/docs/10_hamiltonian.md" \
  "$ROOT/docs/11_bogomolny.md" \
  "$ROOT/docs/12_equilibrium_profile.md" \
  "$ROOT/docs/13_m2_charge.md" \
  "$ROOT/docs/14_chemical_potentials.md" \
  "$ROOT/docs/15_zero_charge_instability.md" \
  "$ROOT/docs/16_ads5_comparison.md" \
  "$ROOT/docs/90_open_questions.md" \
  "$ROOT/docs/99_error_log.md" \
  "$ROOT/docs/claims.md"

touch \
  "$ROOT/references/README.md" \
  "$ROOT/references/manifest.yaml"

touch \
  "$ROOT/symbolic/wolfram/definitions.wl" \
  "$ROOT/symbolic/wolfram/assumptions.wl" \
  "$ROOT/symbolic/wolfram/verify_definitions.wls" \
  "$ROOT/symbolic/wolfram/verify_bps_relations.wls" \
  "$ROOT/symbolic/wolfram/verify_horizon_identities.wls" \
  "$ROOT/symbolic/wolfram/verify_perfect_square.wls" \
  "$ROOT/symbolic/wolfram/verify_bogomolny.wls" \
  "$ROOT/symbolic/wolfram/verify_profile_integration.wls" \
  "$ROOT/symbolic/wolfram/verify_horizon_charge.wls" \
  "$ROOT/symbolic/wolfram/verify_chemical_potential_match.wls"

touch \
  "$ROOT/symbolic/python/sample_bps_parameters.py" \
  "$ROOT/symbolic/python/solve_profile.py" \
  "$ROOT/symbolic/python/charge_vs_radius.py" \
  "$ROOT/symbolic/python/find_zero_charge.py" \
  "$ROOT/symbolic/python/scan_parameter_space.py" \
  "$ROOT/symbolic/python/plot_profiles.py"

touch \
  "$ROOT/tests/test_bps_identities.py" \
  "$ROOT/tests/test_numerical_profile.py" \
  "$ROOT/tests/test_charge.py" \
  "$ROOT/tests/test_limits.py" \
  "$ROOT/tests/test_symmetry_1_2.py"

touch \
  "$ROOT/manuscript/main.tex" \
  "$ROOT/manuscript/references.bib" \
  "$ROOT/manuscript/sections/introduction.tex" \
  "$ROOT/manuscript/sections/black_hole.tex" \
  "$ROOT/manuscript/sections/uplift.tex" \
  "$ROOT/manuscript/sections/probe_action.tex" \
  "$ROOT/manuscript/sections/bogomolny.tex" \
  "$ROOT/manuscript/sections/profiles.tex" \
  "$ROOT/manuscript/sections/instability.tex" \
  "$ROOT/manuscript/sections/discussion.tex"

touch \
  "$ROOT/scripts/check_all.sh" \
  "$ROOT/scripts/build_paper.sh" \
  "$ROOT/scripts/fetch_arxiv.sh"

if [[ ! -f "$ROOT/.gitignore" ]]; then
cat > "$ROOT/.gitignore" <<'EOF'
# Python
.venv/
__pycache__/
*.pyc
.pytest_cache/

# Mathematica
*.mx
*.nb~
*.autosave

# LaTeX
*.aux
*.bbl
*.bcf
*.blg
*.fdb_latexmk
*.fls
*.log
*.out
*.run.xml
*.synctex.gz
*.toc

# Build
build/*

# OS
.DS_Store
Thumbs.db

# Keep generated scientific outputs that are intentionally committed.
EOF
fi

if [[ ! -d "$ROOT/.git" ]]; then
  echo "Initializing Git repository."
  git -C "$ROOT" init
fi

chmod +x \
  "$ROOT/scripts/bootstrap_project.sh" \
  "$ROOT/scripts/check_all.sh" \
  "$ROOT/scripts/build_paper.sh" \
  "$ROOT/scripts/fetch_arxiv.sh" 2>/dev/null || true

echo
echo "Repository skeleton created."
echo
echo "Next:"
echo "  1. Add AGENTS.md, README.md, and Makefile."
echo "  2. Populate docs/01_conventions.md."
echo "  3. Copy reference papers and notes into references/."
echo "  4. Run: make env"
echo "  5. Start Codex from the repository root."