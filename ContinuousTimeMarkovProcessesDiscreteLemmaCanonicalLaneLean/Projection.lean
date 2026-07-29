import canonicalLaneMathlib.AdmissibleClass
import ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlib

structure MarkovEndgameState where
  object : AdmissibleClass

def markovProjection : Projection MarkovEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem markov_projection_idempotent (x : MarkovEndgameState) :
    markovProjection.toFun (markovProjection.toFun x) = markovProjection.toFun x := by
  exact markovProjection.idempotent x

end ContinuousTimeMarkovProcessesDiscreteLemmaCanonicalLaneLean
end HautevilleHouse
