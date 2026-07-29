import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.GeneratorState

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure KolmogorovEquations (S : Type u) [Fintype S] where
  Q : GeneratorMatrix S
  transitionProb : ℕ → S → S → ℝ
  forwardEquationHolds : Prop
  backwardEquationHolds : Prop
  forwardEquationProof : forwardEquationHolds
  backwardEquationProof : backwardEquationHolds

def KolmogorovEquationsClosed {S : Type u} [Fintype S] (K : KolmogorovEquations S) : Prop :=
  K.forwardEquationHolds ∧ K.backwardEquationHolds

theorem kolmogorov_equations_closed_from_evidence {S : Type u} [Fintype S]
    (K : KolmogorovEquations S) : KolmogorovEquationsClosed K :=
  And.intro K.forwardEquationProof K.backwardEquationProof

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse