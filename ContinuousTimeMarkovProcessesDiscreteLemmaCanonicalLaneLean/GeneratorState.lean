import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure MarkovChainState (S : Type u) where
  current : S
  time : ℕ

def stateSpace (S : Type u) : Set (MarkovChainState S) := Set.univ

structure GeneratorMatrix (S : Type u) [Fintype S] where
  Q : S → S → ℝ
  rowSumsZero : ∀ i, ∑ j, Q i j = 0
  nonnegOffDiagonal : ∀ i j, i ≠ j → Q i j ≥ 0

def GeneratorMatrixClosed {S : Type u} [Fintype S] (G : GeneratorMatrix S) : Prop :=
  (∀ i, ∑ j, G.Q i j = 0) ∧ (∀ i j, i ≠ j → G.Q i j ≥ 0)

theorem generator_matrix_closed_from_properties {S : Type u} [Fintype S]
    (G : GeneratorMatrix S) : GeneratorMatrixClosed G :=
  And.intro G.rowSumsZero G.nonnegOffDiagonal

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse