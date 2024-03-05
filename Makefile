
SML := sml

build:
	echo "CM.make \"sources.cm\";" | $(SML)

clean:
	$(RM) -r .cm
