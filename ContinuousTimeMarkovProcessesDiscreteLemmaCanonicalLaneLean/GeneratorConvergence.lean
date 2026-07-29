import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure GeneratorFamily (State : Type u) (P : ContinuousTimeMarkovProcess State) where
  generator : State → State → ℝ
  generatorDefinition : ∀ s t, generator s t = d/dt (P.transitionKernel s t t) at 0
  generatorNonnegativeOffDiagonal : ∀ s ≠ t, generator s t ≥ 0
  generatorZeroRowSum : ∀ s, ∑' t, generator s t = 0

structure GeneratorConvergenceEvidence (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P) where
  generatorDefinitionClosed : G.generatorDefinition
  generatorNonnegativeOffDiagonalClosed : G.generatorNonnegativeOffDiagonal
  generatorZeroRowSumClosed : G.generatorZeroRowSum

def GeneratorConvergenceClosed (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P) : Prop :=
  G.generatorDefinition ∧ G.generatorNonnegativeOffDiagonal ∧ G.generatorZeroRowSum

theorem generator_convergence_closed_from_evidence
    (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P)
    (E : GeneratorConvergenceEvidence State P G) : GeneratorConvergenceClosed State P G := by
  exact And.intro E.generatorDefinitionClosed
    (And.intro E.generatorNonnegativeOffDiagonalClosed E.generatorZeroRowSumClosed)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse