package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille;
      v :    Integer;
      c :    Type_Coordonnee)
      return Boolean
   is
      ligne : Integer;
      colonne : Integer;
      i : Integer;
      numCarre : Integer;

      co : Type_Coordonnee;
      c_Carre : Type_Coordonnee;
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;

      ligne := obtenirLigne(c);
      colonne := obtenirColonne(c);

      i := 1;

      while i <= 9 loop
         co := construireCoordonnees(ligne, i);
         if not caseVide(g, co) and then obtenirChiffre(g, co) = v then
            return false;
         end if;
         i := i + 1;
      end loop;

      i := 1;
      while i <= 9 loop
         co := construireCoordonnees(i, colonne);
         if not caseVide(g, co) and then obtenirChiffre(g, co) = v then
            return false;
         end if;
         i := i + 1;
      end loop;

      numCarre := obtenirCarre(c);
      c_Carre := obtenirCoordonneeCarre(numCarre);

      colonne := obtenirColonne(c_Carre);
      ligne := obtenirLigne(c_Carre);

      i := 1;
      while i <= 9 loop
         co := construireCoordonnees(ligne, colonne);

         if not caseVide(g, co) and then obtenirChiffre(g, co) = v then
            return false;
         end if;

         colonne := colonne + 1;

         if i mod 3 = 0 then
            ligne := ligne + 1;
            colonne := obtenirColonne(c_Carre);
         end if;

         i := i + 1;
      end loop;

      return true;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille;
      c : in Type_Coordonnee)
         return Type_Ensemble
   is
      e : Type_Ensemble;
      i : Integer;
   begin
      if not caseVide(g, c) then
         raise CASE_NON_VIDE;
      end if;

      e := construireEnsemble;

      i := 1;
      while i <= 9 loop
         if estChiffreValable(g, i, c) and not appartientChiffre(e, i) then
            ajouterChiffre(e, i);
         end if;
         i := i + 1;
      end loop;

      return e;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble)
         return Integer
   is
      i : Integer;
   begin
      if nombreChiffres(resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      end if;

      if ensembleVide(resultats) then
         raise ENSEMBLE_VIDE;
      end if;

      i := 1;
      while i <= 9 loop
         if appartientChiffre(resultats, i) then
            return i;
         end if;
         i := i + 1;
      end loop;

      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku
     (g      : in out Type_Grille;
      trouve :    out Boolean)
   is
      i : Integer;
      j : Integer;
      v : Integer;
      cpt : Integer;

      c : Type_Coordonnee;

      a : Integer;
   begin
      trouve := false;
      a := 1;
      while a <= 20 loop
         i := 1;
         while i <= 9 loop
            j := 1;
            while j <= 9 loop
               v := 1;
               cpt := 0;

               c := construireCoordonnees(i, j);

               while v <= 9 and caseVide(g, c) loop
                  if estChiffreValable(g, v, c) then
                     fixerChiffre(g, c, v);
                     cpt := cpt + 1;
                  end if;
                  v := v + 1;
               end loop;

               if cpt > 1 then
                  viderCase(g, c);
               end if;

               j := j + 1;
            end loop;
            i := i + 1;
         end loop;
         a := a + 1;
      end loop;

      if estRemplie(g) then
         trouve := true;
      end if;

   end resoudreSudoku;

end resolutions;
