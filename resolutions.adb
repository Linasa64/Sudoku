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
      elsif not appartientChiffre(obtenirChiffresDUneLigne(g, obtenirLigne(c)), v) OR not appartientChiffre(obtenirChiffresDUneColonne(g, obtenirLigne(c)), v) OR not appartientChiffre(obtenirChiffresDUnCarre(g, obtenirLigne(c)), v) then
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
      ligne : Type_Ensemble;
      colonne : Type_Ensemble;
      carre : Type_Ensemble;
      e : Type_Ensemble;
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;

      e := construireEnsemble;

      colonne := obtenirChiffresDUneColonne(g, obtenirColonne(c));
      ligne := obtenirChiffresDUneLigne(g, obtenirLigne(c));
      carre := obtenirChiffresDUnCarre(g, obtenirCarre(c));

      for i in Integer range 1..9 loop
         if not appartientChiffre(ligne, i) AND not appartientChiffre(colonne, i) AND not appartientChiffre(carre, i) then
            if appartientChiffre(e, I) = false then
               ajouterChiffre(e, i);
            end if;
         end if;
      end loop;

      return e;

   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
      n:Integer:=0;
   begin
      if nombreChiffres(resultats)>1 then
         raise PLUS_DE_UN_CHIFFRE;
      elsif nombreChiffres(resultats)=0 then
         raise ENSEMBLE_VIDE;
      else
         for i in 1..9 loop
            if appartientChiffre(resultats, i) then
               return i;
            end if;
         end loop;
         return 0;
      end if;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
      solPossibles: Type_Ensemble;
      solUnique: Integer;
   begin
      trouve:=false;

      while not trouve loop
         for l in 1..9 loop
            for c in 1..9 loop
               if caseVide(g, construireCoordonnees(l,c)) then
                  solPossibles := obtenirSolutionsPossibles(g, construireCoordonnees(l, c));
                  if nombreChiffres(solPossibles) = 1 then
                     solUnique := rechercherSolutionUniqueDansEnsemble(solPossibles);
                     if estChiffreValable(g, solUnique, construireCoordonnees(l, c)) then
                        fixerChiffre(g, construireCoordonnees(l, c), solUnique);
                     end if;
                  end if;
               end if;
            end loop;
         end loop;
            if estRemplie(g) then
               trouve:=True;
            end if;
      end loop;
   end resoudreSudoku;

end resolutions;
