import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.GeneratorMatrix

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure TransitionSemigroup (S : DiscreteStateSpace) (G : GeneratorMatrix S) where
  P : ℝ → S.carrier → S.carrier → ℝ
  semigroupProperty : ∀ t s, ∀ i j, ∑' k, P t i k * P s k j = P (t + s) i j
  generatorRelation : ∀ t, ∀ i j, (d/dt) P t i j = ∑' k, P t i k * G.Q k j

def TransitionSemigroupClosed {S : DiscreteStateSpace} {G : GeneratorMatrix S} (T : TransitionSemigroup S G) : Prop :=
  T.semigroupProperty ∧ T.generatorRelation

theorem transition_semigroup_closed_from_evidence {S : DiscreteStateSpace} {G : GeneratorMatrix S} (T : TransitionSemigroup S G) : TransitionSemigroupClosed T := by
  exact And.intro T.semigroupProperty T.generatorRelation

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse
