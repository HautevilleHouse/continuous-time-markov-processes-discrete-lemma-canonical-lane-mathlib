import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure DiscreteEmbeddingPackage where
  sourceGenerator : GeneratorState
  targetGenerator : GeneratorState
  embeddingMap : Type u
  compatibility : Prop
  compatibilityClosed : compatibility

def DiscreteEmbeddingClosed (D : DiscreteEmbeddingPackage) : Prop :=
  D.compatibility

theorem discrete_embedding_closed (D : DiscreteEmbeddingPackage) : DiscreteEmbeddingClosed D :=
  D.compatibilityClosed

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse