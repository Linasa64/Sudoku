pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
   begin
      if not caseVide(g, c ) then
         raise CASE_NON_VIDE;
      elsif not appartientChiffre(obtenirChiffresDUneLigne(g, v), v) AND not appartientChiffre(obtenirChiffresDUneColonne(g, v), v) AND not appartientChiffre(obtenirChiffresDUnCarre(g, v), v) then
         return true;
      else
         return false;
      end if;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      e: Type_Ensemble;
      i: Integer := 1;
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      else
         e:=construireEnsemble;
         for i in 1..9 loop
            if estChiffreValable(g, i, c) then
              ajouterChiffre(e, i);
            end if;
         end loop;
      end if;
      return e;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
      n:Integer:=0;
      sol: Integer;
   begin
      for i in 1..9 loop
         if appartientChiffre(resultats, i) then
            n:= n+1;
            sol:=i;
         end if;
      end loop;
      if n=0 then
         raise ENSEMBLE_VIDE;
      elsif n>1 then
         raise PLUS_DE_UN_CHIFFRE;
      else
         return sol;
      end if;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
   begin
      while not estRemplie(g) loop
         for l in 1..9 loop
            for c in 1..9 loop
               if not caseVide(g, construireCoordonnees(l,c)) then
                  null;
               else
                  fixerChiffre(g, construireCoordonnees(l,c), rechercherSolutionUniqueDansEnsemble(obtenirSolutionsPossibles(g, construireCoordonnees(l,c))));
               end if;
            end loop;
         end loop;
      end loop;
      if estRemplie(g) then
         trouve:=True;
      else
         trouve := false;
      end if;
   end resoudreSudoku;

end resolutions;
