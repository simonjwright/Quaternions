with AUnit.Assertions; use AUnit.Assertions;
with AUnit.Test_Cases; use AUnit.Test_Cases;

package body Test.Test_Suite is

   use Quaternions;

   function Image (Q : Quaternion) return String
   is ("("
         & Q.W'Image
         & ","
         & Q.X'Image
         & ","
         & Q.Y'Image
         & ","
         & Q.Y'Image
         & ")");

   type Case_1 is new Test_Case with null record;
   overriding
   function Name (C : Case_1) return AUnit.Message_String
   is (new String'("quaternions"));
   overriding
   procedure Register_Tests (C : in out Case_1);

   function Suite return AUnit.Test_Suites.Access_Test_Suite
   is
      Result : constant AUnit.Test_Suites.Access_Test_Suite
        := new AUnit.Test_Suites.Test_Suite;
   begin
      pragma Warnings (Off, "use of an anonymous access type allocator");
      AUnit.Test_Suites.Add_Test (Result, new Case_1);
      pragma Warnings (On, "use of an anonymous access type allocator");
      return Result;
   end Suite;

   procedure Unary_Minus (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Addition (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Subtraction (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Multiplication (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Division (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Conjugate (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Norm (Dummy : in out AUnit.Test_Cases.Test_Case'Class);
   procedure Normalize (Dummy : in out AUnit.Test_Cases.Test_Case'Class);

   procedure Register_Tests (C : in out Case_1)
   is
   begin
      Registration.Register_Routine
        (C,
         Unary_Minus'Access,
         "unary minus");
      Registration.Register_Routine
        (C,
         Addition'Access,
         "addition");
      Registration.Register_Routine
        (C,
         Subtraction'Access,
         "subtraction");
      Registration.Register_Routine
        (C,
         Multiplication'Access,
         "multiplication");
      Registration.Register_Routine
        (C,
         Division'Access,
         "division");
      Registration.Register_Routine
        (C,
         Conjugate'Access,
         "conjugate");
      Registration.Register_Routine
        (C,
         Norm'Access,
         "norm");
      Registration.Register_Routine
        (C,
         Normalize'Access,
         "normalize");
   end Register_Tests;

   procedure Unary_Minus (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : Quaternion;
   begin
      Q2 := -Q1;
      Assert (Q2 = (-1.0, -2.0, -3.0, -4.0), "-q1");
   end Unary_Minus;

   procedure Addition (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : constant Quaternion := (-1.0, 0.0, -1.0, 0.0);
      Q3 : Quaternion;
   begin
      Q3 := Q1 + Q2;
      Assert (Q3 = (0.0, 2.0, 2.0, 4.0), "q1+q2");
   end Addition;

   procedure Subtraction (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : constant Quaternion := (-1.0, 0.0, -1.0, 0.0);
      Q3 : Quaternion;
   begin
      Q3 := Q1 - Q2;
      Assert (Q3 = (2.0, 2.0, 4.0, 4.0), "q1-q2");
   end Subtraction;

   procedure Multiplication (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : Quaternion;
      Q3 : Quaternion;
   begin
      Q2 := Q1 * 2.0;
      Assert (Q2 = (2.0, 4.0, 6.0, 8.0), "q1*r");
      Q3 := 3.0 * Q1;
      Assert (Q3 = (3.0, 6.0, 9.0, 12.0), "r*q1");
      Q3 := Q1 * Q2;
      pragma Style_Checks (Off);  -- line length > 79
      --  From https://www.euclideanspace.com/maths/algebra/realNormedAlgebra/other/dualQuaternion/calculator/index.htm
      pragma Style_Checks (On);
      Assert (Q3 = (-56.0, 8.0, 12.0, 16.0), "q1*q2" & ", got " & Image (Q3));
   end Multiplication;

   procedure Division (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : Quaternion;
   begin
      Q2 := Q1 / 2.0;
      Assert (Q2 = (0.5, 1.0, 1.5, 2.0), "q1/r");
   end Division;

   procedure Conjugate (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (1.0, 2.0, 3.0, 4.0);
      Q2 : Quaternion;
   begin
      Q2 := Conjugate (Q1);
      Assert (Q2 = (1.0, -2.0, -3.0, -4.0), "conjugate(q1)");
   end Conjugate;

   procedure Norm (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (3.0, 0.0, 0.0, 4.0);
      R : Float;
   begin
      R := Norm (Q1);
      Assert (R = 5.0, "norm(q1)");
   end Norm;

   procedure Normalize (Dummy : in out AUnit.Test_Cases.Test_Case'Class)
   is
      Q1 : constant Quaternion := (3.0, 0.0, 0.0, 4.0);
      Q2 : Quaternion;
   begin
      Q2 := Normalize (Q1);
      Assert (Q2 = (0.6, 0.0, 0.0, 0.8), "normalize(q1)");
   end Normalize;

end Test.Test_Suite;
