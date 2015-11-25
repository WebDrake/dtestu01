DTestU01
========

DTestU01 is a simple wrapper for the TestU01 collection of statistical tests
for uniform random number generators.

By design, it exposes in D only the minimal subset of TestU01 functionality
required to run the standard test batteries (SmallCrush, Crush, BigCrush,
Rabbit, Alphabit, pseudo-DIEHARD and FIPS 140-2) on D random number generators
implementing the API required by `std.random.isUniformRNG`.

TestU01 itself was developed by Pierre L'Ecuyer and colleagues at the Université
de Montréal, and can be downloaded from
http://www.iro.umontreal.ca/~simardr/testu01/tu01.html

The TestU01 user guide is available at
http://www.iro.umontreal.ca/~simardr/testu01/guideshorttestu01.pdf


Building
--------

DTestU01 requires libtestu01-dev to be installed.  If this is not packaged for
your system, you can download sources from the project homepage.
