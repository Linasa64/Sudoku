pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "construireCoordonnees unimplemented");
      return
        raise Program_Error
          with "Unimplemented function construireCoordonnees";
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirLigne unimplemented");
      return raise Program_Error with "Unimplemented function obtenirLigne";
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirColonne unimplemented");
      return raise Program_Error with "Unimplemented function obtenirColonne";
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirCarre unimplemented");
      return raise Program_Error with "Unimplemented function obtenirCarre";
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirCoordonneeCarre unimplemented");
      return
        raise Program_Error
          with "Unimplemented function obtenirCoordonneeCarre";
   end obtenirCoordonneeCarre;

end Coordonnee;
