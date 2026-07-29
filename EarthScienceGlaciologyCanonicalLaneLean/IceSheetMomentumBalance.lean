import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceSheetMomentumBalancePackage where
  iceDensity : ℝ
  gravity : ℝ
  basalFrictionCoeff : ℝ
  drivingStress : ℝ
  basalShearStress : ℝ
  stressBalanceEquality : Prop

structure IceSheetMomentumBalanceEvidence (P : IceSheetMomentumBalancePackage) where
  stressBalanceEqualityClosed : P.stressBalanceEquality

def IceSheetMomentumBalanceClosed (P : IceSheetMomentumBalancePackage) : Prop :=
  P.stressBalanceEquality

theorem ice_sheet_momentum_balance_closed_from_evidence
    (P : IceSheetMomentumBalancePackage) (E : IceSheetMomentumBalanceEvidence P) :
    IceSheetMomentumBalanceClosed P := by
  exact E.stressBalanceEqualityClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse