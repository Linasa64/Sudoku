pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
      c: Type_Coordonnee;

   begin

      c.ligne := ligne;
      c.colonne := colonne;

      return c;


   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin

      return c.ligne;


   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin

      return c.colonne;

   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is

      numCarre : Integer;

   begin

      if 1 <= c.ligne and c.ligne <= 3 and 1 <= c.colonne and c.colonne <= 3 then
         numCarre:=1;

      end if;

      if 1 <= c.ligne and c.ligne <= 3 and 4 <= c.colonne and c.colonne <= 6 then
         numCarre:=2;

      end if;

      if 1 <= c.ligne and c.ligne <= 3 and 7 <= c.colonne and c.colonne <= 9 then
         numCarre:=3;

      end if;

      if 4 <= c.ligne and c.ligne <= 6 and 1 <= c.colonne and c.colonne <= 3 then
         numCarre:=4;

      end if;

      if 4 <= c.ligne and c.ligne <= 6 and 4 <= c.colonne and c.colonne <= 6 then
         numCarre:=5;

      end if;

      if 4 <= c.ligne and c.ligne <= 6 and 7 <= c.colonne and c.colonne <= 9 then
         numCarre:=6;

      end if;

      if 7 <= c.ligne and c.ligne <= 9 and 1 <= c.colonne and c.colonne <= 3 then
         numCarre:=7;

      end if;

      if 7 <= c.ligne and c.ligne <= 9 and 4 <= c.colonne and c.colonne <= 6 then
         numCarre:=8;

      end if;

      if 7 <= c.ligne and c.ligne <= 9 and 7 <= c.colonne and c.colonne <= 9 then
         numCarre:=9;

      end if;

   return numCarre;


   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
      ac: Type_Coordonnee;
   begin

      if numCarre = 1 then
         ac.ligne := 1;
         ac.colonne := 3;
      end if;

      if numCarre = 2 then
         ac.ligne := 1;
         ac.colonne := 6;
      end if;

      if numCarre = 3 then
         ac.ligne := 1;
         ac.colonne := 9;
      end if;

      if numCarre = 4 then
         ac.ligne := 4;
         ac.colonne := 3 ;
      end if;

      if numCarre = 5 then
         ac.ligne := 4;
         ac.colonne := 6;
      end if;

      if numCarre = 6 then
         ac.ligne := 4;
         ac.colonne := 9;
      end if;

      if numCarre = 7 then
         ac.ligne := 7;
         ac.colonne := 3;
      end if;

      if numCarre = 8 then
         ac.ligne := 7;
         ac.colonne := 6;
      end if;

      if numCarre = 9 then
         ac.ligne := 7;
         ac.colonne := 9;
      end if;

      return ac;

   end obtenirCoordonneeCarre;

end Coordonnee;
