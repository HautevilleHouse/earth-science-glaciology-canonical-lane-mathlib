import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceTemperatureEvolutionPackage {I : IceSheetModelPackage}
    (S : StokesFlowPackage I) where
  heatEquation : Prop
  strainHeating : Prop
  basalGeothermalFlux : Prop
  surfaceTemperatureBoundary : Prop
  heatEquationClosed : heatEquation
  strainHeatingClosed : strainHeating
  basalGeothermalFluxClosed : basalGeothermalFlux
  surfaceTemperatureBoundaryClosed : surfaceTemperatureBoundary

structure IceTemperatureEvolutionEvidence {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (T : IceTemperatureEvolutionPackage S) where
  heatEquationClosed : T.heatEquation
  strainHeatingClosed : T.strainHeating
  basalGeothermalFluxClosed : T.basalGeothermalFlux
  surfaceTemperatureBoundaryClosed : T.surfaceTemperatureBoundary

def IceTemperatureEvolutionClosed {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (T : IceTemperatureEvolutionPackage S) : Prop :=
  T.heatEquation ∧ T.strainHeating ∧ T.basalGeothermalFlux ∧ T.surfaceTemperatureBoundary

theorem ice_temperature_evolution_closed_from_evidence {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (T : IceTemperatureEvolutionPackage S)
    (E : IceTemperatureEvolutionEvidence T) : IceTemperatureEvolutionClosed T := by
  exact And.intro E.heatEquationClosed
    (And.intro E.strainHeatingClosed
      (And.intro E.basalGeothermalFluxClosed E.surfaceTemperatureBoundaryClosed))

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse