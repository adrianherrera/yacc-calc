.PHONY: calc clean

calc: lex.calc.c calc.tab.c
	$(CC) $(CFLAGS) $? -o $@

lex.calc.c: calc.l
	lex -o $@ $<

calc.tab.c: calc.y
	yacc -d -o $@ $<

clean:
	rm -f lex.calc.c calc.tab.c calc.tab.h calc
