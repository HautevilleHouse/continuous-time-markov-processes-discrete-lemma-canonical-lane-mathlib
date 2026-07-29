import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.GateLemmas
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

def ConstrainedMarkovProcessClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_markov_process_endgame (A : AdmissibleClass) :
    ConstrainedMarkovProcessClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse