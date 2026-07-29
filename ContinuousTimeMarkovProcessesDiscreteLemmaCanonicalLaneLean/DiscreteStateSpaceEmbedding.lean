import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure DiscreteStateSpace (State : Type u) where
  countable : Countable State
  discreteTopology : TopologicalSpace State
  discreteUniform : discreteTopology = ⊤

structure DiscreteEmbedding (State : Type u) (P : ContinuousTimeMarkovProcess State) where
  stateSpaceDiscrete : DiscreteStateSpace State
  kernelCompatible : ∀ s t, P.transitionKernel s t 0 = if s = t then 1 else 0

structure DiscreteEmbeddingEvidence (State : Type u) (P : ContinuousTimeMarkovProcess State) (E : DiscreteEmbedding State P) where
  stateSpaceDiscreteClosed : E.stateSpaceDiscrete.countable
  kernelCompatibleClosed : E.kernelCompatible

def DiscreteEmbeddingClosed (State : Type u) (P : ContinuousTimeMarkovProcess State) (E : DiscreteEmbedding State P) : Prop :=
  E.stateSpaceDiscrete.countable ∧ E.kernelCompatible

theorem discrete_embedding_closed_from_evidence
    (State : Type u) (P : ContinuousTimeMarkovProcess State) (E : DiscreteEmbedding State P)
    (Ev : DiscreteEmbeddingEvidence State P E) : DiscreteEmbeddingClosed State P E := by
  exact And.intro Ev.stateSpaceDiscreteClosed Ev.kernelCompatibleClosed

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse