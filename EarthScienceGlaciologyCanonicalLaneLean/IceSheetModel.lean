import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceSheetModelPackage where
  domain : Type u
  geometry : Type v
  thicknessField : Type w
  velocityField : Type x
  temperatureField : Type y
  basalCondition : Prop
  surfaceMassBalance : Prop
  calvingLaw : Prop
  domainDefined : domain
  geometryDefined : geometry
  thicknessFieldDefined : thicknessField
  velocityFieldDefined : velocityField
  temperatureFieldDefined : temperatureField
  basalConditionClosed : basalCondition
  surfaceMassBalanceClosed : surfaceMassBalance
  calvingLawClosed : calvingLaw

structure IceSheetModelEvidence (I : IceSheetModelPackage) where
  basalConditionClosed : I.basalCondition
  surfaceMassBalanceClosed : I.surfaceMassBalance
  calvingLawClosed : I.calvingLaw

def IceSheetModelClosed (I : IceSheetModelPackage) : Prop :=
  I.basalCondition ∧ I.surfaceMassBalance ∧ I.calvingLaw

theorem ice_sheet_model_closed_from_evidence (I : IceSheetModelPackage)
    (E : IceSheetModelEvidence I) : IceSheetModelClosed I := by
  exact And.intro E.basalConditionClosed
    (And.intro E.surfaceMassBalanceClosed E.calvingLawClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse