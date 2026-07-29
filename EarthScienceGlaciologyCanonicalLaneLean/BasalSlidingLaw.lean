import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure BasalSlidingLawPackage {I : IceSheetModelPackage} (S : StokesFlowPackage I) where
  slidingVelocity : Type u
  basalShearStress : Type v
  effectivePressure : Type w
  slidingLawEquation : Prop
  cavitationModel : Prop
  sedimentDeformation : Prop
  slidingVelocityDefined : slidingVelocity
  basalShearStressDefined : basalShearStress
  effectivePressureDefined : effectivePressure
  slidingLawEquationClosed : slidingLawEquation
  cavitationModelClosed : cavitationModel
  sedimentDeformationClosed : sedimentDeformation

structure BasalSlidingLawEvidence {I : IceSheetModelPackage} {S : StokesFlowPackage I}
    (B : BasalSlidingLawPackage S) where
  slidingLawEquationClosed : B.slidingLawEquation
  cavitationModelClosed : B.cavitationModel
  sedimentDeformationClosed : B.sedimentDeformation

def BasalSlidingLawClosed {I : IceSheetModelPackage} {S : StokesFlowPackage I}
    (B : BasalSlidingLawPackage S) : Prop :=
  B.slidingLawEquation ∧ B.cavitationModel ∧ B.sedimentDeformation

theorem basal_sliding_law_closed_from_evidence {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (B : BasalSlidingLawPackage S)
    (E : BasalSlidingLawEvidence B) : BasalSlidingLawClosed B := by
  exact And.intro E.slidingLawEquationClosed
    (And.intro E.cavitationModelClosed E.sedimentDeformationClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse