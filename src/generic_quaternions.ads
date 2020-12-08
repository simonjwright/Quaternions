generic
   type Real is digits <>;
package Generic_Quaternions is

   type Quaternion is record
      W : Real;
      X : Real;
      Y : Real;
      Z : Real;
   end record;

   function "-" (Q : Quaternion) return Quaternion;

   function "+" (L, R : Quaternion) return Quaternion;

   function "-" (L, R : Quaternion) return Quaternion;

   function "*" (L : Quaternion; R : Real) return Quaternion;

   function "*" (L : Real; R : Quaternion) return Quaternion;

   function "*" (L : Quaternion; R : Quaternion) return Quaternion;

   function "/" (L : Quaternion; R : Real) return Quaternion;

   function Conjugate (Q : Quaternion) return Quaternion;

   function Norm (Q : Quaternion) return Real;

   function Normalize (Q : Quaternion) return Quaternion;

end Generic_Quaternions;
