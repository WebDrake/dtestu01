/**
 * Simple application to apply the TestU01 SmallCrush test battery to all
 * uniform random number generators defined in std.random
 *
 * Copyright: Copyright © 2015 Joseph Rushton Wakeling
 *
 * License:   This program is free software: you can redistribute it and/or modify
 *            it under the terms of the GNU General Public License as published by
 *            the Free Software Foundation, either version 3 of the License, or
 *            (at your option) any later version.
 *
 *            This program is distributed in the hope that it will be useful,
 *            but WITHOUT ANY WARRANTY; without even the implied warranty of
 *            MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *            GNU General Public License for more details.
 *
 *            You should have received a copy of the GNU General Public License
 *            along with this program.  If not, see $(LINK http://www.gnu.org/licenses/).
 *
 * Credits:   TestU01 is available from
 *            $(LINK http://www.iro.umontreal.ca/~simardr/testu01/tu01.html)
 */
module dtestu01.app;


/**
 * Runs SmallCrush statistical test battery on all std.random
 * uniform random number generators
 */
void main ()
{
    import std.random;
    import std.typetuple : TypeTuple;
    import dtestu01.battery : applyBattery;
    import testu01.bbattery : bbattery_SmallCrush;
    import testu01.unif01 : unif01_Gen;

    auto testBattery = function void (unif01_Gen* testU01Gen)
    {
        bbattery_SmallCrush(testU01Gen);
    };

    foreach (RNG; TypeTuple!(MinstdRand0, MinstdRand, Mt19937,
                             Xorshift32, Xorshift64, Xorshift96,
                             Xorshift128, Xorshift160, Xorshift192))
    {
        RNG gen;
        gen.seed(unpredictableSeed);
        gen.applyBattery(testBattery);
    }
}
