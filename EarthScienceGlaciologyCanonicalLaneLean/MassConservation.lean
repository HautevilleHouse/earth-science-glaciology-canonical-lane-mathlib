import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGlaciologyCanonicalLaneLean.IceSheetMomentumBalance

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure MassConservationPackage {M : IceSheetMomentumBalancePackage} where
  iceThickness : ℝ
  accumulationRate : ℝ
  ablationRate : ℝ
  velocityDivergence : ℝ
  massContinuityEquation : Prop

structure MassConservationEvidence {M : IceSheetMomentumBalancePackage} (C : MassConservationPackage M) where
  massContinuityEquationClosed : C.massContinuityEquation

def MassConservationClosed {M : IceSheetMomentumBalancePackage} (C : MassConservationPackage M) : Prop :=
  C.massContinuityEquation

theorem mass_conservation_closed_from_evidence
    {M : IceSheetMomentumBalancePackage} (C : MassConservationPackage M) (E : MassConservationEvidence C) :
    MassConservationClosed C := by
  exact E.massContinuityEquationClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse