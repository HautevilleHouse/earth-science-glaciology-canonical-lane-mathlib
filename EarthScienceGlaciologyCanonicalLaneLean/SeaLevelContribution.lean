import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure SeaLevelContributionPackage where
  iceVolumeChange : Type u
  seaLevelRise : Type v
  massLossIntegration : Prop
  stericCorrection : Prop
  gravitationalAdjustment : Prop

structure SeaLevelContributionEvidence (P : SeaLevelContributionPackage) where
  massLossIntegrationClosed : P.massLossIntegration
  stericCorrectionClosed : P.stericCorrection
  gravitationalAdjustmentClosed : P.gravitationalAdjustment

def SeaLevelContributionClosed (P : SeaLevelContributionPackage) : Prop :=
  P.massLossIntegration ∧ P.stericCorrection ∧ P.gravitationalAdjustment

theorem sea_level_contribution_closed_from_evidence (P : SeaLevelContributionPackage) (E : SeaLevelContributionEvidence P) : SeaLevelContributionClosed P := by
  exact And.intro E.massLossIntegrationClosed (And.intro E.stericCorrectionClosed E.gravitationalAdjustmentClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse