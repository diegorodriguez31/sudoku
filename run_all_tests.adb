with a_tester; use a_tester;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure run_All_Tests is
begin
   -- execution automatique des tests
   for i in les_Tests'Range loop
      resultats(i) := les_Tests(i).function_Of_Test.all;
--        put("test ");
--        put(i,0);
--        put(" = ");
--        if resultats(i) then
--           put("OK");
--        else
--           put("Non OK");
--        end if;
--        New_Line;
   end loop;

   -- affichage des resultats
   New_Line;
   if (for all i in resultats'Range => resultats(i)) then
      put_line ("Tous les tests OK");
   else
      put_line ("***** ATTENTION *****");
      for i in resultats'Range loop
         if not resultats(i) then
            put_line (to_String(les_Tests(i).error_Test));
         end if;
      end loop;
   end if;
   New_Line;

end run_All_Tests;
