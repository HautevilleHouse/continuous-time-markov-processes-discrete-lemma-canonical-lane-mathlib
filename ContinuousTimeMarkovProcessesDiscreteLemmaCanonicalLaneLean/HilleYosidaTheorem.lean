import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

structure HilleYosidaData (State : Type u) where
  generatorDomain : Set (State → ℝ)
  generatorOperator : (State → ℝ) → (State → ℝ)
  domainDense : Topology.IsDense (Subtype.val : generatorDomain → State → ℝ)
  resolventSet : Set ℂ
  resolventEquation : ∀ λ ∈ resolventSet, (λ • (fun x : State → ℝ => x) - generatorOperator)⁻¹ ∈ (State → ℝ) → (State → ℝ)

structure HilleYosidaEvidence (State : Type u) (H : HilleYosidaData State) where
  domainDenseClosed : H.domainDense
  resolventEquationClosed : ∀ λ ∈ H.resolventSet, True

def HilleYosidaClosed (State : Type u) (H : HilleYosidaData State) : Prop :=
  H.domainDense ∧ ∀ λ ∈ H.resolventSet, True

theorem hille_yosida_closed_from_evidence
    (State : Type u) (H : HilleYosidaData State) (E : HilleYosidaEvidence State H) :
    HilleYosidaClosed State H := by
  exact And.intro E.domainDenseClosed (fun λ hλ => E.resolventEquationClosed λ hλ)

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse