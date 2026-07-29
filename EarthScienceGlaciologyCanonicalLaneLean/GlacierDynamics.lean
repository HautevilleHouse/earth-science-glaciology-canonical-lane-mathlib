import EarthScienceGlaciologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierDynamicsPackage where
  iceSheetGeometry : Type u
  stressTensor : Type v
  basalSlidingLaw : Prop
  massConservation : Prop
  flowLawValid : Prop

structure GlacierDynamicsEvidence (G : GlacierDynamicsPackage) where
  basalSlidingLawClosed : G.basalSlidingLaw
  massConservationClosed : G.massConservation
  flowLawValidClosed : G.flowLawValid

def GlacierDynamicsClosed (G : GlacierDynamicsPackage) : Prop :=
  G.basalSlidingLaw ∧ G.massConservation ∧ G.flowLawValid

theorem glacier_dynamics_closed_from_evidence (G : GlacierDynamicsPackage)
    (E : GlacierDynamicsEvidence G) : GlacierDynamicsClosed G := by
  exact And.intro E.basalSlidingLawClosed
    (And.intro E.massConservationClosed E.flowLawValidClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse