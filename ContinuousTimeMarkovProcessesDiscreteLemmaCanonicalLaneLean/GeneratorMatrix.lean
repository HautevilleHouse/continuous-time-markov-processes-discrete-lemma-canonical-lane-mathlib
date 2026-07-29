import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.DiscreteStateSpace

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure GeneratorMatrix (S : DiscreteStateSpace) where
  Q : S.carrier → S.carrier → ℝ
  offDiagonalNonnegative : ∀ i j, i ≠ j → Q i j ≥ 0
  rowSumZero : ∀ i, ∑' j, Q i j = 0

def GeneratorMatrixClosed {S : DiscreteStateSpace} (G : GeneratorMatrix S) : Prop :=
  G.offDiagonalNonnegative ∧ G.rowSumZero

theorem generator_matrix_closed_from_evidence {S : DiscreteStateSpace} (G : GeneratorMatrix S) : GeneratorMatrixClosed G := by
  exact And.intro G.offDiagonalNonnegative G.rowSumZero

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse
