package body ensemble is

   ------------------------
   -- construireEnsemble --
   ------------------------

   function construireEnsemble return Type_Ensemble is
      e : Type_Ensemble;
      i : Integer;
   begin
      i := 1;
      while i <= 9 loop
         e(i) := False;
         i := i + 1;
      end loop;
      return e;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------

   function ensembleVide (e : in Type_Ensemble) return Boolean is
   i : Integer;
   begin
      i := 1;
      while i <= 9 loop
         if e(i) then
            return false;
         end if;
         i := i +1;
      end loop;
      return true;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------

   function appartientChiffre
     (e : in Type_Ensemble;
      v : in   Integer)
      return Boolean
   is
      i : Integer;
   begin
      i := 1;
      while i <= 9 loop
         if e(i) and v = i then
            return True;
         end if;
         i := i +1;
      end loop;
      return False;
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (e : in Type_Ensemble) return Integer is
      i : Integer;
      k : Integer;
   begin
      i := 1;
      k := 0;
      while i <= 9 loop
         if e(i) = true then
            k := k +1;
         end if;
         i := i +1;
      end loop;
      return k;

   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------

   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if e(v) then
         raise APPARTIENT_ENSEMBLE;
      end if;
      e(v) := True;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------

   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if not e(v) then
         raise NON_APPARTIENT_ENSEMBLE;
      end if;
      e(v) := false;
   end retirerChiffre;

end ensemble;
