CC=coffee
OUT=lib/inform-plugin-example
IN=src/

all: lib/inform-plugin-example
	${CC} -o ${OUT} -c ${IN}

lib/inform-plugin-example:
	mkdir -p "${OUT}"

