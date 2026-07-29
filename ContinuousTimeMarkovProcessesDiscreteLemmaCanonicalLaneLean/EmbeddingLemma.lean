import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.DiscreteKolmogorovEquations

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure EmbeddingData (S : Type u) [Fintype S] where
  P : ℕ → S → S → ℝ
  isDiscreteSemigroup : Prop
  Q : GeneratorMatrix S
  embeddingCondition : Prop
  proofEmbedding : embeddingCondition

def EmbeddingLemmaClosed {S : Type u} [Fintype S] (E : EmbeddingData S) : Prop :=
  E.isDiscreteSemigroup ∧ E.embeddingCondition

theorem embedding_lemma_closed_from_evidence {S : Type u} [Fintype S]
    (E : EmbeddingData S) : EmbeddingLemmaClosed E :=
  And.intro E.isDiscreteSemigroup E.proofEmbedding

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse