import EarthScienceGlaciologyCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

def ConstrainedGlaciologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_glaciology_endgame (A : AdmissibleClass) :
    ConstrainedGlaciologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse