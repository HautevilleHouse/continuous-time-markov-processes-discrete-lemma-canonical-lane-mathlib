import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure KolmogorovBackwardPackage where
  generator : GeneratorState
  transitionSemigroup : Type u
  kolmogorovEquation : Prop
  solutionUniqueness : Prop

def KolmogorovBackwardClosed (K : KolmogorovBackwardPackage) : Prop :=
  K.kolmogorovEquation ∧ K.solutionUniqueness

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse