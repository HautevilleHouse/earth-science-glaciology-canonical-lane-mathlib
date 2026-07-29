import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceCoreAnalysisPackage where
  coreSample : Type u
  isotopeRatio : Type v
  annualLayerCounting : Prop
  gasTrapClosed : Prop
  ageDepthRelation : Prop

structure IceCoreAnalysisEvidence (P : IceCoreAnalysisPackage) where
  annualLayerCountingClosed : P.annualLayerCounting
  gasTrapClosed : P.gasTrapClosed
  ageDepthRelationClosed : P.ageDepthRelation

def IceCoreAnalysisClosed (P : IceCoreAnalysisPackage) : Prop :=
  P.annualLayerCounting ∧ P.gasTrapClosed ∧ P.ageDepthRelation

theorem ice_core_analysis_closed_from_evidence (P : IceCoreAnalysisPackage) (E : IceCoreAnalysisEvidence P) : IceCoreAnalysisClosed P := by
  exact And.intro E.annualLayerCountingClosed (And.intro E.gasTrapClosed E.ageDepthRelationClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse