# Quaternions #

For information on quaternions, see the [Wikipedia page](https://en.wikipedia.org/wiki/Quaternion).

This library supports standard operations:

  * addition,
  * subtraction,
  * multiplication (by a real or by another quaternion, the second of which gives the [Hamilton product](https://en.wikipedia.org/wiki/Quaternion#Hamilton_product)), and
  * division (by a real)).

It also provides conjugation, the norm, and normalization (to a unit quaternion).

It's supplied as

* a generic, to be instantiated with the floating-point type of your choice, and
* an instantiantion using the standard `Float`.

The implementation uses Ada 2012 [expression functions](http://www.ada-auth.org/standards/rm12_w_tc1/html/RM-6-8.html).

For GNAT, build by `gprbuild -P quaternions.gpr`.

