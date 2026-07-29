import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure MarkovStateSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  measurableSpace : MeasurableSpace carrier
  sigmaAlgebraGeneratedBy : sigmaAlgebra = measurableSpace.measurableSet

structure MarkovStateSpaceAdmitted where
  space : MarkovStateSpace
  discreteState : Prop
  cadlag : Prop
  strongMarkov : Prop
  conclusion : strongMarkov

def MarkovStateSpaceClosed (O : MarkovStateSpaceAdmitted) : Prop :=
  O.strongMarkov

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse