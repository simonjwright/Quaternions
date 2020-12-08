with Ada.Numerics.Generic_Elementary_Functions;

package body Generic_Quaternions is

   package Elementary_Functions
   is new Ada.Numerics.Generic_Elementary_Functions (Real);
   use Elementary_Functions;

   function "-" (Q : Quaternion) return Quaternion
   is (-Q.W, -Q.X, -Q.Y, -Q.Z);

   function "+" (L, R : Quaternion) return Quaternion
   is (L.W + R.W, L.X + R.X, L.Y + R.Y, L.Z + R.Z);

   function "-" (L, R : Quaternion) return Quaternion
   is (L.W - R.W, L.X - R.X, L.Y - R.Y, L.Z - R.Z);

   function "*" (L : Quaternion; R : Real) return Quaternion
   is (L.W * R, L.X * R, L.Y * R, L.Z * R);

   function "*" (L : Real; R : Quaternion) return Quaternion
   is (L * R.W, L * R.X, L * R.Y, L * R.Z);

   --  See https://en.wikipedia.org/wiki/Quaternion#Hamilton_product
   function "*" (L : Quaternion; R : Quaternion) return Quaternion
   is (W => L.W * R.W - L.X * R.X - L.Y * R.Y - L.Z * R.Z,
       X => L.W * R.X + L.X * R.W + L.Y * R.Z - L.Z * R.Y,
       Y => L.W * R.Y - L.X * R.Z + L.Y * R.W + L.Z * R.X,
       Z => L.W * R.Z + L.X * R.Y - L.Y * R.X + L.Z * R.W);

   function "/" (L : Quaternion; R : Real) return Quaternion
   is (L.W / R, L.X / R, L.Y / R, L.Z / R);

   function Conjugate (Q : Quaternion) return Quaternion
   is (Q.W, -Q.X, -Q.Y, -Q.Z);

   function Norm (Q : Quaternion) return Real
   is (Sqrt (Q.W ** 2 + Q.X ** 2 + Q.Y**2 + Q.Z**2));

   function Normalize (Q : Quaternion) return Quaternion
   is (Q / Norm (Q));

end Generic_Quaternions;
