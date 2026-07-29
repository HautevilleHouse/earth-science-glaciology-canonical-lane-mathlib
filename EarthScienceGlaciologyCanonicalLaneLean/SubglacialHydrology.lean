import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure SubglacialHydrologyPackage where
  drainageSystem : Type u
  waterPressure : Type v
  conduitGeometry : Type w
  waterFlux : Prop
  cavityFormation : Prop
  sedimentTransport : Prop
  drainageDefined : drainageSystem
  waterPressureDefined : waterPressure
  conduitGeometryDefined : conduitGeometry
  waterFluxClosed : waterFlux
  cavityFormationClosed : cavityFormation
  sedimentTransportClosed : sedimentTransport

structure SubglacialHydrologyEvidence (S : SubglacialHydrologyPackage) where
  waterFluxClosed : S.waterFlux
  cavityFormationClosed : S.cavityFormation
  sedimentTransportClosed : S.sedimentTransport

def SubglacialHydrologyClosed (S : SubglacialHydrologyPackage) : Prop :=
  S.waterFlux ∧ S.cavityFormation ∧ S.sedimentTransport

theorem subglacial_hydrology_closed_from_evidence (S : SubglacialHydrologyPackage) (E : SubglacialHydrologyEvidence S) : SubglacialHydrologyClosed S := by
  exact And.intro E.waterFluxClosed (And.intro E.cavityFormationClosed E.sedimentTransportClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse
