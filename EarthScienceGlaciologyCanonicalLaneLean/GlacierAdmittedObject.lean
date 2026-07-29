import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GlacierAdmittedObject where
  space : GlacierSpace
  iceSheetGeometry : Prop
  dynamicsModelValid : Prop
  paleoclimateRecordClosed : Prop
  seaLevelBudgetClosed : Prop
  conclusion : dynamicsModelValid ∧ paleoclimateRecordClosed ∧ seaLevelBudgetClosed

def GlacierWitnessClosed (O : GlacierAdmittedObject) : Prop :=
  O.dynamicsModelValid ∧ O.paleoclimateRecordClosed ∧ O.seaLevelBudgetClosed

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse