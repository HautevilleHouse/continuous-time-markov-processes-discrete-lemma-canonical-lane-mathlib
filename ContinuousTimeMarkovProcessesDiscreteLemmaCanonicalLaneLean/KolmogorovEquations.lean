import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.MarkovProcessStateSpace
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure KolmogorovBackwardEquation {S : MarkovStateSpaceAdmitted} (G : GeneratorMatrix S) where
  transitionMatrix : ℝ → S.space.carrier → S.space.carrier → ℝ
  initialCondition : ∀ i j, transitionMatrix 0 i j = if i = j then 1 else 0
  backwardEquation : ∀ t ≥ 0, ∀ i j, ∂/∂t (transitionMatrix t i j) = ∑' k, G.Qmatrix i k * transitionMatrix t k j
  forwardEquation : ∀ t ≥ 0, ∀ i j, ∂/∂t (transitionMatrix t i j) = ∑' k, transitionMatrix t i k * G.Qmatrix k j
  differentiability : ∀ t > 0, Differentiable ℝ (fun (t' : ℝ) => transitionMatrix t' i j)

def KolmogorovClosed {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S} (K : KolmogorovBackwardEquation G) : Prop :=
  K.initialCondition ∧ K.backwardEquation ∧ K.forwardEquation

structure KolmogorovEvidence {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S} (K : KolmogorovBackwardEquation G) where
  initialConditionClosed : K.initialCondition
  backwardEquationClosed : K.backwardEquation
  forwardEquationClosed : K.forwardEquation

theorem kolmogorov_closed_from_evidence {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S}
    (K : KolmogorovBackwardEquation G) (E : KolmogorovEvidence K) : KolmogorovClosed K := by
  exact And.intro E.initialConditionClosed (And.intro E.backwardEquationClosed E.forwardEquationClosed)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse