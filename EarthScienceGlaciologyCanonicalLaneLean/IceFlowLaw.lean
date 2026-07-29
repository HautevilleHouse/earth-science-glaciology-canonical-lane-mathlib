import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGlaciologyCanonicalLaneLean.IceSheetMomentumBalance

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceFlowLawPackage {M : IceSheetMomentumBalancePackage} where
  flowLawExponent : ℕ
  rateFactor : ℝ
  shearStrainRate : ℝ
  drivingStress : ℝ
  flowLawRelation : Prop

structure IceFlowLawEvidence {M : IceSheetMomentumBalancePackage} (F : IceFlowLawPackage M) where
  flowLawRelationClosed : F.flowLawRelation

def IceFlowLawClosed {M : IceSheetMomentumBalancePackage} (F : IceFlowLawPackage M) : Prop :=
  F.flowLawRelation

theorem ice_flow_law_closed_from_evidence
    {M : IceSheetMomentumBalancePackage} (F : IceFlowLawPackage M) (E : IceFlowLawEvidence F) :
    IceFlowLawClosed F := by
  exact E.flowLawRelationClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse