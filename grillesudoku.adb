package body grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      g : Type_Grille;
      i : Integer;
      j : Integer;
   begin
      i := 1;
      while i <= 9 loop
         j := 1;
         while j <= 9 loop
            g(i, j) := 0;
            j := j + 1;
         end loop;
         i := i + 1;
      end loop;

      return g;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille;
      c : in Type_Coordonnee)
      return Boolean
   is
      T : boolean;
      ligne,colonne : integer;
   begin
      ligne := obtenirLigne(c);
      colonne:= obtenirColonne(c);
      if g(ligne,colonne) = 0 then
         T := TRUE;
      else T:=False;
      end if;
      return T;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille;
      c : in Type_Coordonnee)
      return Integer
   is
      ligne, colonne : Integer;
   begin
      if caseVide(g, c) then
         raise OBTENIR_CHIFFRE_NUL;
      end if;

      ligne := obtenirLigne(c);
      colonne := obtenirColonne(c);

      return  g(ligne, colonne);
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      c:integer;
   begin
      --  Generated stub: replace with real body!
      c:=0;
      for i in 1..9  loop
         for j in 1..9 loop
            if not caseVide(g,construireCoordonnees(i,j)) then
               c := c+1;
            end if;
         end loop;
      end loop;

      return c ;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille;
      c : in     Type_Coordonnee;
      v : in     Integer)
   is
      ligne,colonne: Integer;
   begin
      if not caseVide(g, c) then
         raise  FIXER_CHIFFRE_NON_NUL;
      end if;

      ligne := obtenirLigne(c);
      colonne:= obtenirColonne(c);

      g(ligne, colonne) := v;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
      ligne, colonne : Integer;
   begin
      if caseVide(g,c) then
         raise VIDER_CASE_VIDE;
      end if;

      ligne := obtenirLigne(c);
      colonne:= obtenirColonne(c);

      g(ligne, colonne) := 0;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
      c:boolean;
   begin
      --  Generated stub: replace with real body!
      if nombreChiffres(g) = 81 then
         c := true;
      else
         c:= false;
      end if ;
      return c;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g        : in Type_Grille;
      numLigne : in Integer)
         return Type_Ensemble
   is
      i : Integer;
      e : Type_Ensemble;
   begin
      i := 1;

      e := construireEnsemble;

      while i <= 9 loop
         if g(numLigne, i) > 0 then
            ajouterChiffre(e, i);
         end if;
         i := i + 1;
      end loop;

      return e;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g          : in Type_Grille;
      numColonne : in Integer)
         return Type_Ensemble
   is
      i : Integer;
      e : Type_Ensemble;
   begin

      i := 1;

      e := construireEnsemble;

      while i <= 9 loop
         if g(i, numColonne) > 0 then
            ajouterChiffre(e, i-1);
         end if;
         i := i + 1;
      end loop;

      return e;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g        : in Type_Grille;
      numCarre : in Integer)
         return Type_Ensemble
   is
      i : Integer;
      j : Integer;
      e : Type_Ensemble;
      ligne : Integer;
      colonne : Integer;
      c : Type_Coordonnee;
      c_Carre : Type_Coordonnee;

   begin
      i:= 0;
      j:= 0;
      e := construireEnsemble;

      c_Carre := obtenirCoordonneeCarre(numCarre);

      colonne := obtenirColonne(c_Carre);
      ligne := obtenirLigne(c_Carre);

      i := 1;
      while i <= 9 loop
         c := construireCoordonnees(ligne, colonne);

         if g(ligne, colonne) > 0 then
            ajouterChiffre(e, i-1);
         end if;

         colonne := colonne + 1;

         if i mod 3 = 0 then
            ligne := ligne + 1;
            colonne := obtenirColonne(c_Carre);
         end if;

         i := i + 1;
      end loop;

      return e;
   end obtenirChiffresDUnCarre;

end grilleSudoku;
