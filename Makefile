DMD ?= dmd
DFLAGS ?= -O -inline -release -noboundscheck
testU01_src = source/testu01/bbattery.d source/testu01/unif01.d
dtestU01_src = source/dtestu01/app.d source/dtestu01/battery.d

dtestu01: $(dtestU01_src) $(testU01_src)
	$(DMD) $(DFLAGS) -I./source -L-ltestu01 -of$@ $^

.PHONY: clean

clean:
	rm -f dtestu01 *.o
