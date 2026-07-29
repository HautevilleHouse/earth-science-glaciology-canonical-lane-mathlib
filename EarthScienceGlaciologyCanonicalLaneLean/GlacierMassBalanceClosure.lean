import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierMassBalancePackage where
  accumulationRate : ℝ
  ablationRate : ℝ
  netMassBalance : ℝ
  surfaceArea : ℝ
  equilibriumLineAltitude : ℝ
  accumulationRatePositive : accumulationRate > 0
  ablationRateNonnegative : ablationRate ≥ 0

structure GlacierMassBalanceEvidence (P : GlacierMassBalancePackage) where
  netMassBalanceConsistent : P.netMassBalance = P.accumulationRate - P.ablationRate
  equilibriumLineDefined : P.equilibriumLineAltitude ≥ 0

def GlacierMassBalanceClosed (P : GlacierMassBalancePackage) : Prop :=
  P.accumulationRate > 0 ∧ P.netMassBalance = P.accumulationRate - P.ablationRate ∧ P.equilibriumLineAltitude ≥ 0

theorem glacier_mass_balance_closed_from_evidence (P : GlacierMassBalancePackage)
    (E : GlacierMassBalanceEvidence P) : GlacierMassBalanceClosed P := by
  exact And.intro P.accumulationRatePositive
    (And.intro E.netMassBalanceConsistent E.equilibriumLineDefined)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse