import EarthScienceGlaciologyCanonicalLaneLean.IceCorePaleoclimate

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure SeaLevelRisePackage {G : GlacierDynamicsPackage}
    {D : GlacierDynamicsPackage} {I : IceCorePaleoclimatePackage D}
    (S : GlacierDynamicsPackage) where
  glacierMassBalance : Prop
  thermalExpansionContribution : Prop
  iceSheetDynamicProjection : Prop
  seaLevelBudgetClosed : Prop

structure SeaLevelRiseEvidence {G : GlacierDynamicsPackage}
    {D : GlacierDynamicsPackage} {I : IceCorePaleoclimatePackage D}
    {S : GlacierDynamicsPackage} (L : SeaLevelRisePackage S) where
  glacierMassBalanceClosed : L.glacierMassBalance
  thermalExpansionContributionClosed : L.thermalExpansionContribution
  iceSheetDynamicProjectionClosed : L.iceSheetDynamicProjection
  seaLevelBudgetClosedClosed : L.seaLevelBudgetClosed

def SeaLevelRiseClosed {G : GlacierDynamicsPackage}
    {D : GlacierDynamicsPackage} {I : IceCorePaleoclimatePackage D}
    {S : GlacierDynamicsPackage} (L : SeaLevelRisePackage S) : Prop :=
  L.glacierMassBalance ∧ L.thermalExpansionContribution ∧
  L.iceSheetDynamicProjection ∧ L.seaLevelBudgetClosed

theorem sea_level_rise_closed_from_evidence
    {G : GlacierDynamicsPackage} {D : GlacierDynamicsPackage}
    {I : IceCorePaleoclimatePackage D} {S : GlacierDynamicsPackage}
    (L : SeaLevelRisePackage S) (E : SeaLevelRiseEvidence L) :
    SeaLevelRiseClosed L := by
  exact And.intro E.glacierMassBalanceClosed
    (And.intro E.thermalExpansionContributionClosed
      (And.intro E.iceSheetDynamicProjectionClosed E.seaLevelBudgetClosedClosed))

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse