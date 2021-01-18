pragma Ada_2012;
package body grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      g: Type_Grille;
   begin
      for l in 1..9 loop
         for c in 1..9 loop
            g(l, c):=0;
         end loop;
      end loop;
      return g;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      if g(obtenirLigne(c), obtenirColonne(c))=0 then
         return True;
      else
         return False;
      end if;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if caseVide(g, c) then
         raise OBTENIR_CHIFFRE_NUL;
      else
         return g(obtenirLigne(c), obtenirColonne(c));
      end if;
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      n:Integer :=0;
   begin
      for l in 1..9 loop
         for c in 1..9 loop
            if not caseVide(g, construireCoordonnees(l, c)) then
               n:=n+1;
            end if;
         end loop;
      end loop;
      return n;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer)
   is
   begin
      if not caseVide(g, c) then
         raise FIXER_CHIFFRE_NON_NUL;
      elsif v>=1 AND v<=9 then
         g(obtenirLigne(c), obtenirColonne(c)):=v;
      end if;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if caseVide(g, c) then
         raise VIDER_CASE_VIDE;
      else
         g(obtenirLigne(c), obtenirColonne(c)):=0;
      end if;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      return nombreChiffres(g)=81;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      e:Type_Ensemble;
   begin
      e:=construireEnsemble;
      for i in 1..9 loop
         if g(numLigne, i) /= 0 then
            ajouterChiffre(e, g(numLigne, i));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
   e:Type_Ensemble;
   begin
      e:=construireEnsemble;
      for i in 1..9 loop
         if g(i, numColonne) /= 0 then
            ajouterChiffre(e, g(i, numColonne));
         end if;
      end loop;
      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      e:Type_Ensemble;
   begin
      if numCarre=1 then
         for l in 1..3 loop
            for c in 1..3 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=2 then
         for l in 1..3 loop
            for c in 4..6 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=3 then
         for l in 1..3 loop
            for c in 6..9 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=4 then
         for l in 4..6 loop
            for c in 1..3 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=5 then
         for l in 4..6 loop
            for c in 4..6 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=6 then
         for l in 4..9 loop
            for c in 7..9 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=7 then
         for l in 7..9 loop
            for c in 1..3 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=8 then
         for l in 7..9 loop
            for c in 4..6 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      elsif numCarre=9 then
         for l in 7..9 loop
            for c in 7..9 loop
               if g(l, c) /= 0 then
                  ajouterChiffre(e, g(l, c));
               end if;
            end loop;
         end loop;
      end if;
      return e;
   end obtenirChiffresDUnCarre;

end grilleSudoku;
