CC=coffee
OUT=lib/inform-plugin-twilio-sms
IN=src/

all: lib/inform-plugin-twilio-sms
	${CC} -o ${OUT} -c ${IN}

lib/inform-plugin-twilio-sms:
	mkdir -p "${OUT}"

