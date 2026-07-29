import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacialFlowLawPackage where
  flowLawType : Type u
  stressStrainRelationship : Prop
  rateFactor : Prop
  stressExponent : Prop
  enhancementFactor : Prop
  flowLawDefined : flowLawType
  stressStrainClosed : stressStrainRelationship
  rateFactorClosed : rateFactor
  stressExponentClosed : stressExponent
  enhancementFactorClosed : enhancementFactor

structure GlacialFlowLawEvidence (F : GlacialFlowLawPackage) where
  stressStrainClosed : F.stressStrainRelationship
  rateFactorClosed : F.rateFactor
  stressExponentClosed : F.stressExponent
  enhancementFactorClosed : F.enhancementFactor

def GlacialFlowLawClosed (F : GlacialFlowLawPackage) : Prop :=
  F.stressStrainRelationship ∧ F.rateFactor ∧ F.stressExponent ∧ F.enhancementFactor

theorem glacial_flow_law_closed_from_evidence (F : GlacialFlowLawPackage) (E : GlacialFlowLawEvidence F) : GlacialFlowLawClosed F := by
  exact And.intro E.stressStrainClosed (And.intro E.rateFactorClosed (And.intro E.stressExponentClosed E.enhancementFactorClosed))

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse
