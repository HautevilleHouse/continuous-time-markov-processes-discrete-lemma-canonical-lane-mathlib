import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure ContinuousTimeMarkovProcessPackage where
  stateSpace : Type u
  timeDomain : Type v
  stateSpaceTopology : TopologicalSpace stateSpace
  timeDomainTopology : TopologicalSpace timeDomain
  transitionFamily : timeDomain → stateSpace → Set (stateSpace → ℝ)
  semigroupProperty : Prop
  stochasticContinuity : Prop
  fellerProperty : Prop

structure DiscreteLemmaPackage (M : ContinuousTimeMarkovProcessPackage) where
  inducedEmbedding : Type w
  embeddedProcess : Prop
  discreteApproximation : Prop
  discreteTransitionKernel : Prop
  approximationError : ℝ
  errorBound : Prop
  convergenceAsMeshVanishes : Prop

structure DiscreteLemmaEvidence {M : ContinuousTimeMarkovProcessPackage}
    (D : DiscreteLemmaPackage M) where
  embeddedProcessClosed : D.embeddedProcess
  discreteApproximationClosed : D.discreteApproximation
  discreteTransitionKernelClosed : D.discreteTransitionKernel
  convergenceAsMeshVanishesClosed : D.convergenceAsMeshVanishes

def DiscreteLemmaClosed {M : ContinuousTimeMarkovProcessPackage}
    (D : DiscreteLemmaPackage M) : Prop :=
  D.embeddedProcess ∧ D.discreteApproximation ∧ D.discreteTransitionKernel ∧ D.convergenceAsMeshVanishes

theorem discrete_lemma_closed_from_evidence
    {M : ContinuousTimeMarkovProcessPackage}
    (D : DiscreteLemmaPackage M) (E : DiscreteLemmaEvidence D) :
    DiscreteLemmaClosed D := by
  exact And.intro E.embeddedProcessClosed
    (And.intro E.discreteApproximationClosed
      (And.intro E.discreteTransitionKernelClosed E.convergenceAsMeshVanishesClosed))

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse