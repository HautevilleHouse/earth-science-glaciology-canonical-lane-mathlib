import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure BasalThermalRegimePackage where
  geothermalHeatFlux : Type u
  frictionalHeating : Type v
  pressureMeltingPoint : Prop
  temperateIce : Prop

structure BasalThermalRegimeEvidence (P : BasalThermalRegimePackage) where
  pressureMeltingPointClosed : P.pressureMeltingPoint
  temperateIceClosed : P.temperateIce

def BasalThermalRegimeClosed (P : BasalThermalRegimePackage) : Prop :=
  P.pressureMeltingPoint ∧ P.temperateIce

theorem basal_thermal_regime_closed_from_evidence (P : BasalThermalRegimePackage) (E : BasalThermalRegimeEvidence P) : BasalThermalRegimeClosed P := by
  exact And.intro E.pressureMeltingPointClosed E.temperateIceClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse