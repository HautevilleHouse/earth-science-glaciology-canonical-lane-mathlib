import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EarthScienceGlaciologyCanonicalLaneLean.IceSheetMomentumBalance

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure EnergyBalancePackage {M : IceSheetMomentumBalancePackage} where
  iceTemperature : ℝ
  thermalConductivity : ℝ
  basalGeothermalFlux : ℝ
  frictionalHeating : ℝ
  energyConservationEquation : Prop

structure EnergyBalanceEvidence {M : IceSheetMomentumBalancePackage} (E : EnergyBalancePackage M) where
  energyConservationEquationClosed : E.energyConservationEquation

def EnergyBalanceClosed {M : IceSheetMomentumBalancePackage} (E : EnergyBalancePackage M) : Prop :=
  E.energyConservationEquation

theorem energy_balance_closed_from_evidence
    {M : IceSheetMomentumBalancePackage} (E : EnergyBalancePackage M) (Ev : EnergyBalanceEvidence E) :
    EnergyBalanceClosed E := by
  exact Ev.energyConservationEquationClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse