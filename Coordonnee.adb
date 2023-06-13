package body Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne   : Integer;
      colonne : Integer)
      return Type_Coordonnee
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
      a : integer;
      b : integer;
   begin
      a := (c.ligne - 1) / 3;
      b := (c.colonne - 1) / 3;
      return ((3 * a + b) + 1);
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre
     (numCarre : Integer)
      return Type_Coordonnee

   is
      c : Type_Coordonnee;
   begin
      c.ligne := ((numCarre - 1) / 3) * 3 + 1;
      c.colonne := ((numCarre - 1) mod 3) * 3 + 1;
      return c;
   end obtenirCoordonneeCarre;

end Coordonnee;
