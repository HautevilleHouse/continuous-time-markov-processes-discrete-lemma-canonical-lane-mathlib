import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.ContinuousTimeMarkovProcessesDiscreteLemma

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | DiscreteLemmaPackage M => DiscreteLemmaClosed (A.object : DiscreteLemmaPackage _)
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  match A.object with
  | DiscreteLemmaPackage M =>
    have h : DiscreteLemmaPackage M := A.object
    -- Discharge using endpointSatisfied or remainderRecorded
    sorry
  | _ => exact False.elim (by
    intro h; exact h)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse