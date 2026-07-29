import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.MarkovProcessStateSpace
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.GeneratorMatrix
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.KolmogorovEquations

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure EmbeddingTheorem {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S}
    (K : KolmogorovBackwardEquation G) where
  continuousTimeChain : S.space.carrier → S.space.carrier → ℝ → ℝ
  discreteEmbedding : ∀ i j, ∀ n : ℕ, continuousTimeChain i j (n : ℝ) = (G.Qmatrix ^ n) i j
  continuity : ∀ i j, Continuous (continuousTimeChain i j)
  markovProperty : ∀ i j s t, continuousTimeChain i j (s + t) = ∑' k, continuousTimeChain i k s * continuousTimeChain k j t

def EmbeddingTheoremClosed {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S}
    {K : KolmogorovBackwardEquation G} (E : EmbeddingTheorem K) : Prop :=
  E.discreteEmbedding ∧ E.continuity ∧ E.markovProperty

structure EmbeddingEvidence {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S}
    {K : KolmogorovBackwardEquation G} (E : EmbeddingTheorem K) where
  discreteEmbeddingClosed : E.discreteEmbedding
  continuityClosed : E.continuity
  markovPropertyClosed : E.markovProperty

theorem embedding_closed_from_evidence {S : MarkovStateSpaceAdmitted} {G : GeneratorMatrix S}
    {K : KolmogorovBackwardEquation G} (E : EmbeddingTheorem K) (Ev : EmbeddingEvidence E) :
    EmbeddingTheoremClosed E := by
  exact And.intro Ev.discreteEmbeddingClosed (And.intro Ev.continuityClosed Ev.markovPropertyClosed)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse