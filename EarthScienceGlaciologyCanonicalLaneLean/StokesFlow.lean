import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure StokesFlowPackage (I : IceSheetModelPackage) where
  stressTensor : Type u
  strainRateTensor : Type v
  viscosityField : Type w
  momentumEquation : Prop
  incompressibility : Prop
  boundaryConditions : Prop
  stressTensorDefined : stressTensor
  strainRateTensorDefined : strainRateTensor
  viscosityFieldDefined : viscosityField
  momentumEquationClosed : momentumEquation
  incompressibilityClosed : incompressibility
  boundaryConditionsClosed : boundaryConditions

structure StokesFlowEvidence {I : IceSheetModelPackage} (S : StokesFlowPackage I) where
  momentumEquationClosed : S.momentumEquation
  incompressibilityClosed : S.incompressibility
  boundaryConditionsClosed : S.boundaryConditions

def StokesFlowClosed {I : IceSheetModelPackage} (S : StokesFlowPackage I) : Prop :=
  S.momentumEquation ∧ S.incompressibility ∧ S.boundaryConditions

theorem stokes_flow_closed_from_evidence {I : IceSheetModelPackage}
    (S : StokesFlowPackage I) (E : StokesFlowEvidence S) : StokesFlowClosed S := by
  exact And.intro E.momentumEquationClosed
    (And.intro E.incompressibilityClosed E.boundaryConditionsClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse