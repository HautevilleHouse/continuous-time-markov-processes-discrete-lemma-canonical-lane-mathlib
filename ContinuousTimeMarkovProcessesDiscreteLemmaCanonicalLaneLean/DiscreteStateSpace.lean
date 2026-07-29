import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure DiscreteStateSpace where
  carrier : Type u
  discreteTopology : Topology carrier
  countableSet : Countable carrier

def StateSpaceClosed (S : DiscreteStateSpace) : Prop :=
  S.countableSet.countable

theorem state_space_closed_from_countable (S : DiscreteStateSpace) : StateSpaceClosed S := by
  exact S.countableSet.countable

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse
