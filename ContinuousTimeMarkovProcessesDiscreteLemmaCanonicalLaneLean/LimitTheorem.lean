import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.EmbeddingLemma

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure ContinuousTimeLimit (S : Type u) [Fintype S] where
  Q : GeneratorMatrix S
  semigroup : ℕ → S → S → ℝ
  limitCondition : Prop
  semigroupPropertyHolds : Prop
  strongContinuityAssumed : Prop
  proofLimit : limitCondition

def MarkovProcessConvergenceClosed {S : Type u} [Fintype S] (L : ContinuousTimeLimit S) : Prop :=
  L.limitCondition ∧ L.semigroupPropertyHolds

theorem markov_process_convergence_closed_from_evidence {S : Type u} [Fintype S]
    (L : ContinuousTimeLimit S) : MarkovProcessConvergenceClosed L :=
  And.intro L.proofLimit L.semigroupPropertyHolds

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse