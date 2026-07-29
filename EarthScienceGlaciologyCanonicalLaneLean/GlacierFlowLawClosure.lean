import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierFlowLawPackage where
  flowLawExponent : ℕ
  flowLawConstant : ℝ
  effectiveStress : ℝ → ℝ → ℝ
  strainRate : ℝ → ℝ → ℝ
  isGlenLaw : Prop
  flowLawExponentPositive : flowLawExponent > 0
  flowLawConstantPositive : flowLawConstant > 0
  strainRateDerivedCorrectly : Prop

structure GlacierFlowLawEvidence (P : GlacierFlowLawPackage) where
  glenLawHolds : P.isGlenLaw
  strainRateEquation : ∀ x y, P.strainRate x y = P.flowLawConstant * (P.effectiveStress x y)^(P.flowLawExponent : ℕ : ℝ)

def GlacierFlowLawClosed (P : GlacierFlowLawPackage) : Prop :=
  P.isGlenLaw ∧ P.strainRateDerivedCorrectly

theorem glacier_flow_law_closed_from_evidence (P : GlacierFlowLawPackage)
    (E : GlacierFlowLawEvidence P) : GlacierFlowLawClosed P := by
  exact And.intro E.glenLawHolds (by
    unfold GlacierFlowLawClosed
    exact P.strainRateDerivedCorrectly)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse