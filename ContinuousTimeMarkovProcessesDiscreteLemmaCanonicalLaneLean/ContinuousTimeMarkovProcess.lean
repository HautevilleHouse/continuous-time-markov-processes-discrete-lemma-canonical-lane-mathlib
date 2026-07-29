import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure ContinuousTimeMarkovProcess (State : Type u) where
  stateSpace : Set State
  transitionKernel : State → State → ℝ≥0 → ℝ≥0
  semigroupProperty : ∀ s t u v, transitionKernel s u (t + v) = ∑' w, transitionKernel s w t * transitionKernel w u v
  initialDistribution : State → ℝ≥0
  initialSum : ∑' s, initialDistribution s = 1
  conservedProbability : ∀ t, ∑' u, (∑' s, initialDistribution s * transitionKernel s u t) = 1

structure ContinuousTimeMarkovProcessEvidence (P : ContinuousTimeMarkovProcess State) where
  semigroupPropertyClosed : P.semigroupProperty
  initialSumClosed : P.initialSum
  conservedProbabilityClosed : P.conservedProbability

def ContinuousTimeMarkovProcessClosed (P : ContinuousTimeMarkovProcess State) : Prop :=
  P.semigroupProperty ∧ P.initialSum ∧ P.conservedProbability

theorem continuous_time_markov_process_closed_from_evidence
    (P : ContinuousTimeMarkovProcess State) (E : ContinuousTimeMarkovProcessEvidence P) :
    ContinuousTimeMarkovProcessClosed P := by
  exact And.intro E.semigroupPropertyClosed (And.intro E.initialSumClosed E.conservedProbabilityClosed)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse