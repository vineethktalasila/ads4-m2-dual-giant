# AGENTS.md

# Project

This repository studies supersymmetric M2 dual giant gravitons in the
11-dimensional uplift of rotating AdS4 black holes with pairwise equal
electric charges.

The main goals are:

1. Reproduce the D=4 black-hole solution and its BPS limit.
2. Establish the correct D=11 uplift conventions.
3. Derive the M2 Nambu-Goto and Wess-Zumino actions.
4. Allow a general axisymmetric embedding r = r(theta).
5. Derive the M2 Hamiltonian and conserved internal angular momentum.
6. Prove the BPS/Bogomolny bound.
7. Derive and integrate the first-order BPS shape equation.
8. Compute the M2 charge along the BPS family.
9. Determine the zero-charge dual-giant configuration.
10. Compare the probe instability with the real parts of the BPS
    chemical potentials.
11. Produce a publication-quality LaTeX manuscript whose equations
    are backed by executable symbolic and numerical checks.

---

# Required reading before doing physics

Before modifying any physics derivation, read:

- `docs/00_project_goal.md`
- `docs/01_conventions.md`
- `docs/02_source_map.md`
- `docs/claims.md`
- any earlier derivation document on which the task depends

Do not infer conventions from memory when they are written in
`docs/01_conventions.md`.

---

# Source-of-truth hierarchy

Use the following order of authority:

1. Explicit project conventions in `docs/01_conventions.md`
2. Original literature under `references/papers/`
3. Uploaded/internal research notes under `references/notes/`
4. Verified executable calculations under `symbolic/`
5. Human-readable derivation documents under `docs/`
6. Manuscript text

The manuscript is NOT a source of truth for a derivation.

If the manuscript and an executable calculation disagree, the executable
calculation and original sources must be checked before changing either.

---

# Non-negotiable convention rules

## Four-dimensional parameters

Use

- `s_i = sinh(delta_i)`
- `c_i = cosh(delta_i)`
- `r_i = r + 2 m s_i^2`

The symbols

- `Q_i = m sinh(2 delta_i)`

denote charge parameters unless explicitly stated otherwise.

Do not silently identify `Q_i` with normalized conserved electric charges.

Use a distinct symbol such as `mathcal Q_i` for physical conserved charges.

## Gauge coupling

The main symbolic probe calculation is performed with

`g = 1`

unless a derivation explicitly states otherwise.

Restore `g` only in dedicated sections or scripts.

Never mix `g = 1` formulas with general-`g` formulas in the same derivation
without an explicit dimensional check.

## Internal S7 charge labels

This convention is critical.

In standard U(1)^4 direction-cosine coordinates:

- `mu_1 = 1` is the Q_1 species
- `mu_3 = 1` is also in the pairwise-equal Q_1 sector
- `mu_2 = 1` is the Q_2 species
- `mu_4 = 1` is also in the pairwise-equal Q_2 sector

Therefore:

- `mu_1 = 1  <-> Q_1 <-> Phi'_1`
- `mu_2 = 1  <-> Q_2 <-> Phi'_2`

Do NOT identify the first S^3 in the SO(4) S^3 x S^3 uplift with the
standard `mu_1` plane.

The `xi = 0` S^3 used in the SO(4) uplift carries the Q_2 pair in the
conventions used in this project.

The `mu_1 = 1` probe is obtained from the opposite S^3 and is related to
the `xi = 0` calculation by `1 <-> 2`.

Any agent changing this convention must stop and create a convention
audit instead of editing downstream equations.

## Internal angle normalization

The Hopf angle `psi` used in the S^3 uplift has period `4 pi`.

The standard 2 pi-periodic U(1) angle is

`varphi_1 = psi / 2`.

In `g = 1` units:

- BPS `dot psi = 1`
- BPS `dot varphi_1 = 1/2`

With general `g`:

- BPS `dot psi = g`
- BPS `dot varphi_1 = g/2`

---

# BPS assumptions must be tracked explicitly

Distinguish carefully between:

1. supersymmetry conditions,
2. regularity conditions,
3. horizon identities.

For example, an identity that requires only

`1 + a = coth(delta_1 + delta_2)`

must not be documented as requiring the regularity condition on `m`.

Conversely, factorization of `Delta_r` at the regular BPS horizon must
not be claimed from supersymmetry alone if regularity is also required.

Every symbolic verification script must print which assumptions it uses.

---

# Literature provenance

Every formula imported from the literature must have a provenance entry
in `docs/02_source_map.md` containing:

- paper identifier
- section or equation number if available
- local reference path
- original notation
- conversion to project notation
- any gauge or coordinate transformation used

Never write "standard result" for a nontrivial formula if a specific source
is available.

---

# Internal notes

Files in `references/notes/` are research notes, not authoritative literature.

Treat them as hypotheses or derivation aids.

If an internal note disagrees with an original paper or executable
calculation:

1. record the discrepancy in `docs/99_error_log.md`,
2. determine the source of the mismatch,
3. do not silently correct the note,
4. do not propagate an unverified correction into the manuscript.

Do not modify original PDF notes.

---

# Symbolic algebra rules

Wolfram Language is the preferred tool for:

- exact expansion
- factorization
- FullSimplify under explicit assumptions
- series expansions
- partial fraction decomposition
- exact integration when possible
- checking identities coefficient by coefficient

Python/SymPy may be used as an independent second symbolic implementation.

Every important symbolic identity must have an executable script under

`symbolic/wolfram/`

and, where practical, an independent numerical check.

Do not use Mathematica as an oracle.

For every FullSimplify or Reduce call:

- specify assumptions explicitly,
- report whether supersymmetry is assumed,
- report whether regularity is assumed,
- report domain assumptions such as `0 < a < 1`.

A symbolic script must exit with nonzero status on failure.

---

# Numerical verification rules

Python is preferred for:

- numerical parameter scans
- solving the first-order profile equation
- evaluating the charge integral
- locating zero-charge configurations
- plotting profiles
- checking limiting behavior
- random numerical substitution tests

For every major analytic identity, test multiple random admissible BPS
parameter points.

Numerical tests are supporting evidence, not substitutes for exact proofs
when an exact proof is available.

---

# Required checks for this project

The repository should eventually contain executable checks for:

1. four-dimensional metric definitions
2. BPS parameter relations
3. regular BPS horizon identities
4. D=11 uplift convention map
5. `mu_1 <-> Q_1 <-> Phi'_1`
6. M2 induced metric determinant
7. Wess-Zumino normalization
8. pure AdS4 limit
9. equal-charge limit
10. nonrotating limit
11. BPS perfect-square identity
12. convexity in the internal angular velocity
13. Bogomolny completion
14. first-order BPS flow
15. integrated level-set solution
16. near-horizon series
17. large-radius series
18. horizon M2 charge
19. `1 <-> 2` symmetry
20. sign relation between horizon M2 charge and Re(Phi'_1)
21. numerical existence of the exterior zero-charge solution when
    Re(Phi'_1) < 0

---

# Claim registry

Every important nontrivial result must have an entry in `docs/claims.md`.

Allowed statuses:

- `PROPOSED`
- `PARTIALLY VERIFIED`
- `VERIFIED`
- `DISPROVED`
- `SUPERSEDED`

A claim may be marked VERIFIED only if:

1. its assumptions are stated,
2. its derivation exists,
3. relevant executable checks pass,
4. its convention mapping has been checked.

The manuscript may state a derived result as established only if its claim
status is VERIFIED.

---

# Required structure of derivation documents

Every derivation document under `docs/` should use this structure where
appropriate:

## Goal

## Inputs

## Conventions

## Derivation

## Result

## Analytic checks

## Numerical checks

## Limiting cases

## Literature provenance

## Open issues

Avoid unexplained jumps in algebra.

---

# Generated files

Machine-generated results belong under:

`symbolic/generated/`

Examples:

- simplified identities
- factorized expressions
- series expansions
- numerical scan data
- generated LaTeX tables

Do not hand-edit generated files.

The script that generated a file must be named in the generated file or
in adjacent metadata.

---

# Manuscript rules

Only the manuscript integration task should edit `manuscript/`.

The manuscript must use simple English where possible.

Do not introduce custom LaTeX shortcut commands for mathematical symbols.

Do not introduce unnecessary abbreviations.

Define every symbol before use.

Do not rename standard objects from the literature.

Distinguish explicitly between:

- literature results,
- results derived in this repository,
- numerical evidence,
- conjectures or unresolved points.

The manuscript must preserve the convention

`mu_1 = 1 <-> Q_1 <-> Phi'_1`.

---

# References

For arXiv papers, prefer storing both:

- canonical PDF
- arXiv TeX source when available

The PDF is the reference for rendered equation numbers and layout.

The TeX source is preferred for machine-readable equation searches.

Each paper directory should contain metadata describing its role.

---

# Editing boundaries

Specialist derivation agents should normally edit only:

- their assigned `docs/*.md`
- their assigned `symbolic/*`
- their assigned tests

They should NOT edit:

- unrelated derivations
- reference files
- the manuscript

unless explicitly instructed.

---

# Error handling

Never hide or work around a failed check.

If a symbolic or numerical test fails:

1. preserve the failing case,
2. write the failure to `docs/99_error_log.md`,
3. determine whether the cause is algebra, conventions, assumptions,
   numerical precision, or code,
4. fix the underlying problem,
5. rerun the full relevant test set.

Do not weaken a test merely to make it pass.

---

# Completion criteria

A physics derivation task is not complete until the relevant executable
checks pass.

Before completing any major derivation task, run:

`make check`

Before completing any manuscript task, run:

`make check`

followed by

`make paper`

The final research state should be reproducible from a fresh checkout using:

`make clean`
`make check`
`make paper`

---

# Git discipline

Commit stable physics milestones separately.

Recommended style:

- `conventions: fix U(1)^4 and SO(4) charge dictionary`
- `dbi: verify r(theta) induced determinant`
- `wz: derive mu1 probe pullback`
- `bps: verify perfect-square identity`
- `bogomolny: derive first-order flow`
- `profile: integrate BPS shape equation`
- `charge: derive horizon probe momentum`
- `thermo: match probe charge with Phi1 prime`
- `paper: assemble verified manuscript`

Do not mix unrelated convention changes and downstream physics changes in
the same commit.

---

# Independent verification

When asked to verify another agent's result:

- do not assume the result is correct,
- preferably derive it from the original definitions,
- try to find a counterexample,
- test random admissible parameter values,
- identify any hidden assumptions.

A verifier should not merely restate the original derivation.

---

# Final principle

The repository, not the conversation, is the memory of this project.

If a result matters, it must exist in:

- a derivation document,
- an executable check,
- a claim-registry entry,

before it is treated as established.
