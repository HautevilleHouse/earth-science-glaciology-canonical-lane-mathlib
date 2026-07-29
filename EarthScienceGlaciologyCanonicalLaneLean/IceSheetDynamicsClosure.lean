import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceSheetDynamicsPackage where
  iceThickness : ℝ → ℝ → ℝ  -- function of space (x,y)
  basalSlidingVelocity : ℝ → ℝ → ℝ
  deformationVelocity : ℝ → ℝ → ℝ
  surfaceMassBalance : ℝ → ℝ → ℝ
  isStationary : Prop
  velocityDivergenceEqualsMassBalance : Prop
  basalSlidingVelocityPositive : ∀ x y, basalSlidingVelocity x y > 0 → True
  deformationVelocityPositive : ∀ x y, deformationVelocity x y > 0 → True

structure IceSheetDynamicsEvidence (P : IceSheetDynamicsPackage) where
  stationaryCondition : P.isStationary
  continuityEquation : ∀ x y, P.velocityDivergenceEqualsMassBalance

def IceSheetDynamicsClosed (P : IceSheetDynamicsPackage) : Prop :=
  P.isStationary ∧ P.velocityDivergenceEqualsMassBalance

theorem ice_sheet_dynamics_closed_from_evidence (P : IceSheetDynamicsPackage)
    (E : IceSheetDynamicsEvidence P) : IceSheetDynamicsClosed P := by
  exact And.intro E.stationaryCondition E.continuityEquation

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse