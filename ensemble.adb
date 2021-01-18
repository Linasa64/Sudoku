pragma Ada_2012;
package body ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "construireEnsemble unimplemented");
      return
        raise Program_Error with "Unimplemented function construireEnsemble";
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ensembleVide unimplemented");
      return raise Program_Error with "Unimplemented function ensembleVide";
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "appartientChiffre unimplemented");
      return
        raise Program_Error with "Unimplemented function appartientChiffre";
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "nombreChiffres unimplemented");
      return raise Program_Error with "Unimplemented function nombreChiffres";
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ajouterChiffre unimplemented");
      raise Program_Error with "Unimplemented procedure ajouterChiffre";
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "retirerChiffre unimplemented");
      raise Program_Error with "Unimplemented procedure retirerChiffre";
   end retirerChiffre;

end ensemble;
