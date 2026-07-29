import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure DiscreteLemma (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P) where
  matrixExponentialRepresentation : ∀ t, P.transitionKernel = exp(t * G.generator)
  transitionFunctionSmooth : ∀ s t, Differentiable ℝ (λ t' => P.transitionKernel s t t')
  kolmogorovEquations : ∀ s u t, d/dt (P.transitionKernel s u t) = ∑' v, G.generator s v * P.transitionKernel v u t

structure DiscreteLemmaEvidence (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P) (L : DiscreteLemma State P G) where
  matrixExponentialRepresentationClosed : L.matrixExponentialRepresentation
  transitionFunctionSmoothClosed : L.transitionFunctionSmooth
  kolmogorovEquationsClosed : L.kolmogorovEquations

def DiscreteLemmaClosed (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P) (L : DiscreteLemma State P G) : Prop :=
  L.matrixExponentialRepresentation ∧ L.transitionFunctionSmooth ∧ L.kolmogorovEquations

theorem discrete_lemma_closed_from_evidence
    (State : Type u) (P : ContinuousTimeMarkovProcess State) (G : GeneratorFamily State P)
    (L : DiscreteLemma State P G) (E : DiscreteLemmaEvidence State P G L) : DiscreteLemmaClosed State P G L := by
  exact And.intro E.matrixExponentialRepresentationClosed
    (And.intro E.transitionFunctionSmoothClosed E.kolmogorovEquationsClosed)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse