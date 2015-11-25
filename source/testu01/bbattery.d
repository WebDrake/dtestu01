/**
 * Wrapper module for TestU01's testu01/bbattery.h header
 *
 * Copyright: TestU01 is Copyright © 2002 Pierre L'Ecuyer
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
module testu01.bbattery;

import testu01.unif01 : unif01_Gen;


extern (C):

void bbattery_SmallCrush (unif01_Gen* gen);

void bbattery_Crush (unif01_Gen* gen);

void bbattery_BigCrush (unif01_Gen* gen);

void bbattery_Rabbit (unif01_Gen* gen, double nb);

void bbattery_Alphabit (unif01_Gen* gen, double nb, int r, int s);

void bbattery_BlockAlphabit (unif01_Gen* gen, double nb, int r, int s);

void bbattery_pseudoDIEHARD (unif01_Gen* gen);

void bbattery_FIPS_140_2 (unif01_Gen* gen);
