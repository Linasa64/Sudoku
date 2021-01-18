pragma Ada_2012;
package body ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
      e:Type_Ensemble;
   begin
      for i in 1..9 loop
         e(i) := false;
      end loop;
      return e;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
      b: Boolean;
      estVide: Type_Ensemble;
   begin
      estVide:=construireEnsemble; -- on construit un ensemble (vide de base)
      if e=estVide then -- si e en entrée est égal à estVide, alors il est vide
         b:=True;
      else -- sinon il n'est pas vide
         b:=False;
      end if;
      return b; -- retourne le booléen
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
   is
   begin -- vérifie si la case n°v est pleine
      if v>=1 AND v<=9 then -- si la case est comprise entre 1 et 9
         return e(v); -- oui non
      else
         return -- sinon faux car la case n'existe pas
           false;
      end if;
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
      n:Integer :=0;
   begin
      for i in 1..9 loop
         if e(i)=True then
            n:=n+1;
         end if;
      end loop;
      return n;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
         if appartientChiffre(e, v) then
            raise APPARTIENT_ENSEMBLE;
         elsif v>=1 AND v<=9 then
            e(v):=True;
         end if;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
         if not appartientChiffre(e, v) then
            raise NON_APPARTIENT_ENSEMBLE;
         elsif v>=1 AND v<=9 then
            e(v):=False;
         end if;
   end retirerChiffre;

end ensemble;
