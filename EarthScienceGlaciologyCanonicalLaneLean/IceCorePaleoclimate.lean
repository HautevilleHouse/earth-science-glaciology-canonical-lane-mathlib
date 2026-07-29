import EarthScienceGlaciologyCanonicalLaneLean.GlacierDynamics

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceCorePaleoclimatePackage {G : GlacierDynamicsPackage}
    (D : GlacierDynamicsPackage) where
  coreSampleDepthSeries : Type u
  isotopicFractionation : Prop
  accumulationRateReconstruction : Prop
  gasTrappingClosed : Prop
  climateProxyCalibration : Prop

structure IceCorePaleoclimateEvidence {G : GlacierDynamicsPackage}
    {D : GlacierDynamicsPackage} (I : IceCorePaleoclimatePackage D) where
  isotopicFractionationClosed : I.isotopicFractionation
  accumulationRateReconstructionClosed : I.accumulationRateReconstruction
  gasTrappingClosed : I.gasTrappingClosed
  climateProxyCalibrationClosed : I.climateProxyCalibration

def IceCorePaleoclimateClosed {G : GlacierDynamicsPackage}
    {D : GlacierDynamicsPackage} (I : IceCorePaleoclimatePackage D) : Prop :=
  I.isotopicFractionation ∧ I.accumulationRateReconstruction ∧
  I.gasTrappingClosed ∧ I.climateProxyCalibration

theorem ice_core_paleoclimate_closed_from_evidence
    {G : GlacierDynamicsPackage} {D : GlacierDynamicsPackage}
    (I : IceCorePaleoclimatePackage D)
    (E : IceCorePaleoclimateEvidence I) : IceCorePaleoclimateClosed I := by
  exact And.intro E.isotopicFractionationClosed
    (And.intro E.accumulationRateReconstructionClosed
      (And.intro E.gasTrappingClosed E.climateProxyCalibrationClosed))

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse