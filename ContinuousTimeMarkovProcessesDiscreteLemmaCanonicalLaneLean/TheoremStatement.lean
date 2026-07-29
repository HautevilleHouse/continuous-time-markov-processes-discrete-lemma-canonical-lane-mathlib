import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure ContinuousTimeMarkovProcessSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ContinuousTimeMarkovProcessAdmittedObject where
  space : ContinuousTimeMarkovProcessSpace
  markovProperty : Prop
  discreteStateSpace : Prop
  timeHomogeneous : Prop
  càdlàgPaths : Prop
  transitionSemigroup : Prop
  conclusion : markovProperty ∧ discreteStateSpace ∧ timeHomogeneous ∧ càdlàgPaths ∧ transitionSemigroup

def ContinuousTimeMarkovProcessWitnessClosed (O : ContinuousTimeMarkovProcessAdmittedObject) : Prop :=
  O.markovProperty ∧ O.discreteStateSpace ∧ O.timeHomogeneous ∧ O.càdlàgPaths ∧ O.transitionSemigroup

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse