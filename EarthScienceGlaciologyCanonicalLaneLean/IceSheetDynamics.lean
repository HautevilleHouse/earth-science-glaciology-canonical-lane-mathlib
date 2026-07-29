import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceSheetDynamicsPackage where
  iceSheetGeometry : Type u
  basalTopography : Type v
  temperatureField : Type w
  stressField : Type x
  basalSlippage : Prop
  surfaceMassBalance : Prop
  deformation : Prop
  geometryDefined : iceSheetGeometry
  topographyDefined : basalTopography
  temperatureDefined : temperatureField
  stressDefined : stressField
  basalSlippageClosed : basalSlippage
  surfaceMassBalanceClosed : surfaceMassBalance
  deformationClosed : deformation

structure IceSheetDynamicsEvidence (D : IceSheetDynamicsPackage) where
  basalSlippageClosed : D.basalSlippage
  surfaceMassBalanceClosed : D.surfaceMassBalance
  deformationClosed : D.deformation

def IceSheetDynamicsClosed (D : IceSheetDynamicsPackage) : Prop :=
  D.basalSlippage ∧ D.surfaceMassBalance ∧ D.deformation

theorem ice_sheet_dynamics_closed_from_evidence (D : IceSheetDynamicsPackage) (E : IceSheetDynamicsEvidence D) : IceSheetDynamicsClosed D := by
  exact And.intro E.basalSlippageClosed (And.intro E.surfaceMassBalanceClosed E.deformationClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse
