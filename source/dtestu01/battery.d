/**
 * Functionality to apply TestU01 test batteries to uniform random number
 * generators implementing the D API required by std.random.isUniformRNG
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
module dtestu01.battery;

import std.random : isUniformRNG;

import testu01.unif01;


/**
 * Apply a TestU01 test battery to a uniform random number generator
 *
 * Params:
 *     gen     = uniform random number generator instance
 *     battery = test battery to apply
 */
void applyBattery (UniformRNG) (ref UniformRNG gen,
                                void function (unif01_Gen*) battery)
    if (isUniformRNG!UniformRNG)
{
    extern (C) static double getU01 (void* param, void* state)
    {
        import std.random : uniform;
        UniformRNG* urng = cast(UniformRNG*) state;
        return uniform!"[)"(0.0, 1.0, *urng);
    }

    extern(C) static uint getBits (void* param, void* state)
    {
        UniformRNG* urng = cast(UniformRNG*) state;
        urng.popFront();
        return urng.front;
    }

    extern (C) static void writeState (void* state)
    {
    }

    unif01_Gen testU01Gen =
    {
        state: &gen,
        param: null,
        name: cast(char*) UniformRNG.stringof,
        GetU01: &getU01,
        GetBits: &getBits,
        Write: &writeState
    };

    battery(&testU01Gen);
}
