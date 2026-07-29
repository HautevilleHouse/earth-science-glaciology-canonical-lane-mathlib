import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierModelFoundationPackage where
  climateForcing : Type u
  surfaceMassBalance : Type v
  dynamicsCore : Prop
  iceGeometry : Prop
  numericalSolver : Prop
  
structure GlacierModelFoundationEvidence (P : GlacierModelFoundationPackage) where
  dynamicsCoreClosed : P.dynamicsCore
  iceGeometryClosed : P.iceGeometry
  numericalSolverClosed : P.numericalSolver

def GlacierModelFoundationClosed (P : GlacierModelFoundationPackage) : Prop :=
  P.dynamicsCore ∧ P.iceGeometry ∧ P.numericalSolver

theorem glacier_model_foundation_closed_from_evidence (P : GlacierModelFoundationPackage) (E : GlacierModelFoundationEvidence P) : GlacierModelFoundationClosed P := by
  exact And.intro E.dynamicsCoreClosed (And.intro E.iceGeometryClosed E.numericalSolverClosed)

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse