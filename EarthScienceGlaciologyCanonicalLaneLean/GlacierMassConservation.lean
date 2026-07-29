import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGlaciologyCanonicalLaneLean

structure GlacierMassConservationPackage {I : IceSheetModelPackage}
    (S : StokesFlowPackage I) where
  continuityEquation : Prop
  accumulationTerm : Prop
  ablationTerm : Prop
  calvingTerm : Prop
  continuityEquationClosed : continuityEquation
  accumulationTermClosed : accumulationTerm
  ablationTermClosed : ablationTerm
  calvingTermClosed : calvingTerm

structure GlacierMassConservationEvidence {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (G : GlacierMassConservationPackage S) where
  continuityEquationClosed : G.continuityEquation
  accumulationTermClosed : G.accumulationTerm
  ablationTermClosed : G.ablationTerm
  calvingTermClosed : G.calvingTerm

def GlacierMassConservationClosed {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (G : GlacierMassConservationPackage S) : Prop :=
  G.continuityEquation ∧ G.accumulationTerm ∧ G.ablationTerm ∧ G.calvingTerm

theorem glacier_mass_conservation_closed_from_evidence {I : IceSheetModelPackage}
    {S : StokesFlowPackage I} (G : GlacierMassConservationPackage S)
    (E : GlacierMassConservationEvidence G) : GlacierMassConservationClosed G := by
  exact And.intro E.continuityEquationClosed
    (And.intro E.accumulationTermClosed
      (And.intro E.ablationTermClosed E.calvingTermClosed))

end EarthScienceGlaciologyCanonicalLaneLean
end HautevilleHouse