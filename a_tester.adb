-- bibliothèques d'entrée sortie
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- TAD
with Coordonnee;          use Coordonnee;
with ensemble;            use ensemble;
with grilleSudoku; use grilleSudoku;
with affichage; use affichage;
-- Résolutions de sudoku
with affichage;           use affichage;
with resolutions;         use resolutions;
with remplirGrille;       use remplirGrille;

package body a_tester is

   -----------------------
   -- tests coordonnees --
   -----------------------

   -- c : case;
   -- test obtenirLigne
   function test_Coordonnees_P1 return Boolean is
      c : Type_Coordonnee;
   begin
      c := construireCoordonnees (1, 2);
      return (obtenirLigne (c) = 1);
   end test_Coordonnees_P1;

   -- test obtenirColonne
   function test_Coordonnees_P2 return Boolean is
      c : Type_Coordonnee;
   begin
      c := construireCoordonnees (1, 2);
      return (obtenirColonne (c) = 2);
   end test_Coordonnees_P2;

   -- test obtenirCarre
   -- cas n° 1 : carre n°1
   function test_Coordonnees_P3a return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 1 .. 3 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 1) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3a;

   -- test obtenirCarre
   -- cas n° 2 : carre n°2
   function test_Coordonnees_P3b return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 1 .. 3 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 2) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3b;

   -- test obtenirCarre
   -- cas n° 3 : carre n°3
   function test_Coordonnees_P3c return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 1 .. 3 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 3) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3c;

   -- test obtenirCarre
   -- cas n° 4 : carre n°4
   function test_Coordonnees_P3d return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 4 .. 6 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 4) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3d;

   -- test obtenirCarre
   -- cas n° 5 : carre n°5
   function test_Coordonnees_P3e return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 4 .. 6 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 5) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3e;

   -- test obtenirCarre
   -- cas n° 6 : carre n°6
   function test_Coordonnees_P3f return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 4 .. 6 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 6) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3f;

   -- test obtenirCarre
   -- cas n° 7 : carre n°7
   function test_Coordonnees_P3g return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 7 .. 9 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 7) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3g;

   -- test obtenirCarre
   -- cas n° 8 : carre n°8
   function test_Coordonnees_P3h return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 7 .. 9 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 8) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3h;

   -- test obtenirCarre
   -- cas n° 9 : carre n°9
   function test_Coordonnees_P3i return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      for i in 7 .. 9 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 9) then
	       K := False;
	    end if;
	 end loop;
      end loop;
      return (K);
   end test_Coordonnees_P3i;

   -- test obtenirCarre
   function test_Coordonnees_P3 return Boolean is
      c : Type_Coordonnee;
      K : Boolean := True;
   begin
      -- carre 1
      for i in 1 .. 3 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 1) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 2
      for i in 1 .. 3 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 2) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 3
      for i in 1 .. 3 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 3) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 4
      for i in 4 .. 6 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 4) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 5
      for i in 4 .. 6 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 5) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 6
      for i in 4 .. 6 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 6) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 7
      for i in 7 .. 9 loop
	 for j in 1 .. 3 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 7) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 8
      for i in 7 .. 9 loop
	 for j in 4 .. 6 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 8) then
	       return False;
	    end if;
	 end loop;
      end loop;
      -- carre 9
      for i in 7 .. 9 loop
	 for j in 7 .. 9 loop
	    c := construireCoordonnees (i, j);
	    if (obtenirCarre (c) /= 9) then
	       return False;
	    end if;
	 end loop;
      end loop;
      return True;
   end test_Coordonnees_P3;

   -- test obtenirCoordonneesCarre
   function test_Coordonnees_P4 return Boolean is
      carre : Integer;
   begin
      -- iMin de carre 1
      for carre in 1 .. 3 loop
	 if (obtenirLigne (obtenirCoordonneeCarre (carre)) /= 1) then
	    return False;
	 end if;
      end loop;
      -- iMin de carre 2
      for carre in 4 .. 6 loop
	 if (obtenirLigne (obtenirCoordonneeCarre (carre)) /= 4) then
	    return False;
	 end if;
      end loop;
      -- iMin de carre 3
      for carre in 7 .. 9 loop
	 if (obtenirLigne (obtenirCoordonneeCarre (carre)) /= 7) then
	    return False;
	 end if;
      end loop;
      -- jMin des carre 1, 3 et 7
      carre := 1;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 1) then
	 return False;
      end if;
      carre := 4;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 1) then
	 return False;
      end if;
      carre := 7;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 1 ) then
	 return False;
      end if;
      -- jMin des carre 2, 5 et 8
      carre := 2;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 4) then
	 put_line("7");
	 return False;
      end if;
      carre := 5;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 4) then
	 put_line("8");
	 return False;
      end if;
      carre := 8;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 4) then
	 put_line("9");
	 return False;
      end if;
      -- jMin des carre 3, 6 et 9
      carre := 3;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 7) then
	 put_line("10");
	 return False;
      end if;
      carre := 6;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 7) then
	 put_line("11");
	 return False;
      end if;
      carre := 9;
      if (obtenirColonne (obtenirCoordonneeCarre (carre)) /= 7) then
	 put_line("12");
	 return False;
      end if;
      return True;
   end test_Coordonnees_P4;

   --------------------
   -- Tests Ensemble __
   --------------------

   -- test ensemble vide
   function test_Ensemble_P1 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return ensembleVide (e);
   end test_Ensemble_P1;

   -- test aucun element n'appartient a l'ensemble
   function test_Ensemble_P2 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return ensembleVide(e);
   end test_Ensemble_P2;

   -- test aucun element n'appartient a l'ensemble
   function test_Ensemble_P3 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      return nombreChiffres (e) = 0;
   end test_Ensemble_P3;

   -- test ensemble avec un element non vide
   function test_Ensemble_P4 return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return not ensembleVide (e);
   end test_Ensemble_P4;

   -- test appartenance element a un ensemble non vide
   -- cas n°1 : element existant
   function test_Ensemble_P5a return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return appartientChiffre (e, 9);
   end test_Ensemble_P5a;

   -- test appartenance element a un ensemble non vide
   -- cas n°2 : element non existant
   function test_Ensemble_P5b return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      return not appartientChiffre (e, 8);
   end test_Ensemble_P5b;

   -- test cardinal de l'ensemble s'accroit
   function test_Ensemble_P6 return Boolean is
      e             : Type_Ensemble;
      cardinalAvant : Integer;
      i             : Integer;
   begin
      e             := construireEnsemble;
      cardinalAvant := nombreChiffres (e);
      i             := 1;
      while i < 10 loop
         ajouterChiffre (e, i);
	 i := i + 1;
      end loop;
      return cardinalAvant = nombreChiffres (e) - i + 1;
   end test_Ensemble_P6;

   -- test retirerChiffre sur ensemble vide
   -- cas N°1 : un seul element dans l'ensemble
   function test_Ensemble_P7a return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      ajouterChiffre (e, 9);
      retirerChiffre (e, 9);
      return ensembleVide (e);
   end test_Ensemble_P7a;

   -- test retirerChiffre sur ensemble vide
   -- cas n°2 : plusieurs elements dans l'ensemble
   function test_Ensemble_P7b return Boolean is
      e : Type_Ensemble;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
         ajouterChiffre (e, i);
      end loop;
      retirerChiffre (e, 9);
      return not ensembleVide (e);
   end test_Ensemble_P7b;

   -- test cardinal de l'ensemble diminiue
   function test_Ensemble_P8 return Boolean is
      e             : Type_Ensemble;
      cardinalAvant : Integer;
   begin
      e := construireEnsemble;
      for i in 1 .. 9 loop
	 ajouterChiffre (e, i);
      end loop;
      cardinalAvant := nombreChiffres (e);
      retirerChiffre (e, 9);
      return cardinalAvant = nombreChiffres (e) + 1;
   end test_Ensemble_P8;

   -- test de l'exception 1
   -- impossible d'ajouter un element deja existant dans un ensemble
--     function test_Ensemble_Exception1 return Boolean is
--        e : Type_Ensemble;
--     begin
--        e := construireEnsemble;
--        ajouterChiffre(e,9);
--        ajouterChiffre(e,9);
--        return appartientChiffre(e,9);
--     exception
--        when appartient_ensemble =>
--  	 return True;
--        when others =>
--  	 return False;
--     end test_Ensemble_Exception1;

--     -- test de l'exception 2
--     -- impossible de retirer un element non existant dans un ensemble
--     function test_Ensemble_Exception2 return Boolean is
--        e : Type_Ensemble;
--     begin
--        e := construireEnsemble;
--        retirerChiffre(e,9);
--        return not appartientChiffre(e,9);
--     exception
--        when non_appartient_ensemble =>
--  	 return True;
--        when others =>
--  	 return False;
--     end test_Ensemble_Exception2;

   ------------------
   -- Tests Grille --
   ------------------

   -- creation grille
   -- verification cases vides
   function test_Grille_P1 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      for i in 1..9 loop
	 for j in 1..9 loop
	    c := construireCoordonnees (i,j);
	    if (not caseVide(g,c)) then
	       return false;
	    end if;
	 end loop;
      end loop;
      return true;
   end test_Grille_P1;

   -- creation grille
   -- verification  nombre de chiffres = 0
   function test_Grille_P2 return Boolean is
      g : Type_Grille;
   begin
      g := construireGrille;
      return nombreChiffres(g)=0;
   end test_Grille_P2;

   -- creation grille
   -- verification  estRempli est FAUX
   function test_Grille_P3 return Boolean is
      g : Type_Grille;
   begin
      g := construireGrille;
      return estRemplie(g)=False;
   end test_Grille_P3;

   -- creation grille
   -- verification lignes vides
   function test_Grille_P4 return Boolean is
      g : Type_Grille;
      ligne : Type_Ensemble ;
   begin
      g := construireGrille;
      for i in 1..9 loop
         ligne := obtenirChiffresDUneLigne(g, i);
	 -- afficherEnsemble(ligne);
         if not ensembleVide(ligne) then
	    return False;
         end if ;
      end loop;
      return true;
   end test_Grille_P4;

   -- creation grille
   -- verification colonnes vides
   function test_Grille_P5 return Boolean is
      g : Type_Grille;
      colonne : Type_Ensemble ;
   begin
      g := construireGrille;
      for j in 1..9 loop
	 colonne := obtenirChiffresDUneColonne(g, j);
	 if not ensembleVide(colonne) then
	    return False;
	 end if ;
      end loop;
      return true;
   end test_Grille_P5;

   -- creation grille
   -- verification colonnes vides
   function test_Grille_P6 return Boolean is
      g : Type_Grille;
      carre : Type_Ensemble ;
   begin
      g := construireGrille;
      for i in 1..9 loop
	 carre := obtenirChiffresDUnCarre(g, i);
	 if not ensembleVide(carre) then
	    return False;
	 end if ;
      end loop;
      return true;
   end test_Grille_P6;

   -- FixerChiffre
   -- case remplie devient non vide
   function test_Grille_P7a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g, c, 8);
      return not caseVide(g,c);
   end test_Grille_P7a;

   -- FixerChiffre
   -- autres cases non remplies restent vide
   function test_Grille_P7b return Boolean is
      g : Type_Grille;
      c1 : Type_Coordonnee;
      c2 : Type_Coordonnee;
   begin
      g := construireGrille;
      c1 := construireCoordonnees (9,9);
      fixerChiffre(g,c1,8);
      for i in 1..9 loop
	 for j in 1..9 loop
	    c2 := construireCoordonnees (i,j);
	    if c2 /= c1 and not caseVide(g,c2) then
	       return false ;
	    end if ;
	 end loop;
      end loop;
      return true;
   end test_Grille_P7b;

   -- FixerChiffre
   -- case remplie retourne la valeur entree
   function test_Grille_P8 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      return obtenirChiffre(g,c) = 8;
   end test_Grille_P8;

   -- FixerChiffre
   -- nombre de valeurs entree s'incremente de 1
   function test_Grille_P9 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      cardinalAvant : Integer;
   begin
      g := construireGrille;
      cardinalAvant := nombreChiffres(g);
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      return cardinalAvant = nombreChiffres(g) - 1;
   end test_Grille_P9;

   -- FixerChiffre
   -- ne modifie pas est remplie
   function test_Grille_P10a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      return not estRemplie(g);
   end test_Grille_P10a;

   -- FixerChiffre
   -- modifie est remplie
   function test_Grille_P10b return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      for i in 1..9 loop
	 for j in 1..9 loop
	    c := construireCoordonnees (i,j);
	    fixerChiffre(g,c,i);
	 end loop;
      end loop;
      return estRemplie(g);
   end test_Grille_P10b;

   -- FixerChifre
   -- modifie la ligne correspondante
   function test_Grille_P11 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      ligne : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre(g, c, 8);
      ligne := obtenirChiffresDUneLigne(g, obtenirLigne(c));

      return appartientChiffre(ligne, 8);
   end test_Grille_P11;

   -- FixerChifre
   -- modifie la colonne correspondante
   function test_Grille_P12 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      colonne : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      colonne := obtenirChiffresDUneColonne(g, obtenirColonne(c));
      return appartientChiffre(colonne,8);
   end test_Grille_P12;

   -- FixerChifre
   -- modifie la carre correspondante
   function test_Grille_P13 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      carre : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9, 9);
      fixerChiffre(g, c, 8);
      carre := obtenirChiffresDUnCarre(g, obtenirCarre(c));
      return appartientChiffre(carre, 8);
   end test_Grille_P13;

   -- ViderChiffre
   -- case remplie devient  vide
   function test_Grille_P14a return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      viderCase(g, c);
      return caseVide(g,c);
   end test_Grille_P14a;

   -- ViderChiffre
   -- autres cases non remplies restent vide
   function test_Grille_P14b return Boolean is
      g : Type_Grille;
      c1 : Type_Coordonnee;
      c2 : Type_Coordonnee;
   begin
      g := construireGrille;
      c1 := construireCoordonnees (9,9);
      fixerChiffre(g,c1,8);
      viderCase(g, c1);
      for i in 1..9 loop
	 for j in 1..9 loop
	    c2 := construireCoordonnees (i,j);
            if not caseVide(g,c2) then
	       return false ;
	    end if ;
	 end loop;
      end loop;
      return true;
   end test_Grille_P14b;

   -- ViderChiffre
   -- est remplie retourne FAUX
   function test_Grille_P15 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
   begin
      -- construction de la grille
      g := construireGrille;
      -- remplissage bidon de la grille
      for i in 1..9 loop
	 for j in 1..9 loop
	    c := construireCoordonnees (i,j);
	    fixerChiffre(g,c,8);
	 end loop;
      end loop;
      -- vidage d'une valeur de la grille
      c := construireCoordonnees (9,9);
      viderCase(g,c);
      return not estRemplie(g);
   end test_Grille_P15;

   -- VideChiffre
   -- nombre de valeurs entree ne se modifie pas
   function test_Grille_P16 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      cardinalAvant : Integer;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      cardinalAvant := nombreChiffres(g);
      viderCase(g,c);
      return cardinalAvant = nombreChiffres(g) + 1;
   end test_Grille_P16;

   -- ViderChifre
   -- modifie la ligne correspondante
   function test_Grille_P17 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      ligne : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      viderCase(g,c);
      ligne := obtenirChiffresDUneLigne(g, obtenirLigne(c));
      return not appartientChiffre(ligne,8);
   end test_Grille_P17;

   -- ViderChifre
   -- modifie la colonne correspondante
   function test_Grille_P18 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      colonne : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      viderCase(g,c);
      colonne := obtenirChiffresDUneColonne(g, obtenirColonne(c));
      return not appartientChiffre(colonne,8);
   end test_Grille_P18;

   -- ViderChifre
   -- modifie la carre correspondante
   function test_Grille_P19 return Boolean is
      g : Type_Grille;
      c : Type_Coordonnee;
      carre : Type_Ensemble ;
   begin
      g := construireGrille;
      c := construireCoordonnees (9,9);
      fixerChiffre(g,c,8);
      viderCase(g,c);
      carre := obtenirChiffresDUnCarre(g, obtenirCarre(c));
      return not appartientChiffre(carre,8);
   end test_Grille_P19;

--     -- Exception 1 : obtenirChiffre (g, c) est defini ssi non caseVide (g, c)
--     function test_Grille_Exception1 return Boolean is
--        g : Type_Grille;
--        c : Type_Coordonnee;
--     begin
--        g := construireGrille;
--        c := construireCoordonnees (9,9);
--        return obtenirChiffre(g,c) = 0;
--     exception
--        when obtenir_chiffre_nul =>
--  	 return True;
--        when others =>
--  	 return False;
--     end test_Grille_Exception1;
--
--     function test_Grille_Exception2 return Boolean is
--        g : Type_Grille;
--        c : Type_Coordonnee;
--     begin
--        g := construireGrille;
--        c := construireCoordonnees (9,9);
--        fixerChiffre(g,c,8);
--        fixerChiffre(g,c,1);
--        return obtenirChiffre(g,c) = 1;
--     exception
--        when fixer_chiffre_non_nul =>
--  	 return True;
--        when others =>
--  	 return False;
--     end test_Grille_Exception2;
--
--     function test_Grille_Exception3 return Boolean is
--        g : Type_Grille;
--        c : Type_Coordonnee;
--     begin
--        g := construireGrille;
--        c := construireCoordonnees (9,9);
--        viderCase(g,c);
--        return caseVide(g,c);
--     exception
--        when vider_case_vide =>
--  	 return True;
--        when others =>
--  	 return False;
--     end test_Grille_Exception3;

   -------------------------------
   -- tests resolution grille 1 --
   -------------------------------

   function test_Resolution_Grille_1 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin

      g := grille1TresTresFacileDuNouvelAn2018;
      resoudreSudoku  (g, trouve);
      put("a");
      return trouve;
   end test_Resolution_Grille_1;

   -------------------------------
   -- tests resolution grille 2 --
   -------------------------------
   function test_Resolution_Grille_2 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin
       g := grille2TresTresFacile;
      resoudreSudoku  (g, trouve);
      put("b");
      return trouve;
   end test_Resolution_Grille_2;

   -------------------------------
   -- tests resolution grille 3 --
   -------------------------------
   function test_Resolution_Grille_3 return Boolean is
      g : Type_Grille;
       trouve : Boolean;
   begin
      g := grille3TresFacile;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_3;

   -------------------------------
   -- tests resolution grille 4 --
   -------------------------------
   function test_Resolution_Grille_4 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin
      g := grille4Facile;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_4;

   -------------------------------
   -- tests resolution grille 6 --
   -------------------------------
   function test_Resolution_Grille_6 return Boolean is
      g : Type_Grille;
       trouve : Boolean;
   begin
      g := grille6Moyen;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_6;

   -------------------------------
   -- tests resolution grille 7 --
   -------------------------------
   function test_Resolution_Grille_7 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin
      g := grille7Difficile;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_7;

   -------------------------------
   -- tests resolution grille 8 --
   -------------------------------
   function test_Resolution_Grille_8 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin
      g := grille8Difficile;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_8;

   -------------------------------
   -- tests resolution grille 9 --
   -------------------------------
   function test_Resolution_Grille_9 return Boolean is
      g : Type_Grille;
      trouve : Boolean;
   begin
      g := grille9TresDifficile;
      resoudreSudoku  (g, trouve);
      return trouve;
   end test_Resolution_Grille_9;

begin
   null;
end a_tester;
