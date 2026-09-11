# Claim Registry

A derived result should not appear in the final manuscript as established
unless its status is VERIFIED.

---

## C-001: Pairwise-equal BPS relation

Status: PROPOSED

Statement:

\[
1+a=\coth(\delta_1+\delta_2)
\]

in g=1 conventions.

Assumptions:

- pairwise-equal rotating AdS4 black-hole family
- supersymmetric limit
- g=1

Literature:
TODO

Analytic derivation:
TODO

Machine verification:
TODO

Used in:
TODO

---

## C-002: Regular BPS charge-parameter identity

Status: PROPOSED

Statement:

\[
Q_1Q_2=a(1+a)^2.
\]

Assumptions:

- supersymmetry
- regular extremal horizon
- g=1

Literature:
TODO

Analytic derivation:
TODO

Machine verification:
TODO

---

## C-003: mu_1 charge dictionary

Status: PROPOSED

Statement:

\[
\mu_1=1
\quad\longleftrightarrow\quad
Q_1
\quad\longleftrightarrow\quad
\Phi'_1.
\]

Assumptions:

- standard U(1)^4 direction-cosine convention

Literature:
TODO

Convention derivation:
docs/06_mu_i_dictionary.md

Machine verification:
N/A

---

## C-004: BPS perfect-square identity for the mu_1 probe

Status: PROPOSED

Statement:

\[
\Delta_r(r_2^2+a^2)
-
(r_1r_2+a^2-Q_1r_2)^2
=
\left[r_2(r_1r_2+a^2)-aQ_2\right]^2.
\]

Assumptions:

- g=1
- supersymmetry relation
- determine whether regularity is required

Analytic derivation:
docs/11_bogomolny.md

Machine verification:
symbolic/wolfram/verify_perfect_square.wls

---

## C-005: BPS angular velocity

Status: PROPOSED

Statement:

\[
\dot\psi=1
\]

for the BPS probe in g=1 conventions.

Analytic derivation:
docs/10_hamiltonian.md

Machine verification:
TODO

---

## C-006: Bogomolny first-order equation

Status: PROPOSED

Statement:

\[
\frac{dr}{d\theta}
=
-
\frac{
a^2\sin\theta\cos\theta\,\Delta_r
}{
\Delta_\theta
\left[r_2(r_1r_2+a^2)-aQ_2\right]
}.
\]

Assumptions:

- mu_1 = 1 species
- g=1
- BPS black hole
- BPS probe angular velocity

Analytic derivation:
docs/11_bogomolny.md

Machine verification:
symbolic/wolfram/verify_bogomolny.wls

---

## C-007: Horizon charge / chemical-potential sign relation

Status: PROPOSED

Statement:

\[
\operatorname{sgn}P_{\psi,h}
=
\operatorname{sgn}\operatorname{Re}\Phi'_1.
\]

Analytic derivation:
docs/13_m2_charge.md
docs/14_chemical_potentials.md

Machine verification:
symbolic/wolfram/verify_chemical_potential_match.wls