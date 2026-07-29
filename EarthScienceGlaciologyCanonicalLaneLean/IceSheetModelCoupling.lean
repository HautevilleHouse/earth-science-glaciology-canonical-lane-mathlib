import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure IceSheetModelCouplingPackage where
  dynamicsModel : Type u
  flowLawModel : Type v
  boundaryConditionModel : Type w
  couplingConsistency : Prop
  timeStepping : Prop
  spatialDiscretization : Prop
  dynamicsDefined : dynamicsModel
  flowLawDefined : flowLawModel
  boundaryConditionDefined : boundaryConditionModel
  couplingConsistencyClosed : couplingConsistency
  timeSteppingClosed : timeStepping
  spatialDiscretizationClosed : spatialDiscretization

structure IceSheetModelCouplingEvidence (C : IceSheetModelCouplingPackage) where
  couplingConsistencyClosed : C.couplingConsistency
  timeSteppingClosed : C.timeStepping
  spatialDiscretizationClosed : C.spatialDiscretization

def IceSheetModelCouplingClosed (C : IceSheetModelCouplingPackage) : Prop :=
  C.couplingConsistency ∧ C.timeStepping ∧ C.spatialDiscretization

theorem ice_sheet_model_coupling_closed_from_evidence (C : IceSheetModelCouplingPackage) (E : IceSheetModelCouplingEvidence C) : IceSheetModelCouplingClosed C := by
  exact And.intro E.couplingConsistencyClosed (And.intro E.timeSteppingClosed E.spatialDiscretizationClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse
