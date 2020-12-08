with AUnit.Reporter.Text;
with AUnit.Run;

with Test.Test_Suite;

procedure Test.Main is

   procedure Run is new AUnit.Run.Test_Runner (Test_Suite.Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;

begin
   Run (Reporter);
end Test.Main;
