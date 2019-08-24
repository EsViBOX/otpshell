# MAKEFILE: Use tab

IFLAGS= --group=root --owner=root --mode=755 --preserve-timestamps
PRO := /usr/local/bin

.PHONY: uninstall install required

all: required install

install:
	install $(IFLAGS) otpshell $(PRO)

required:
	apt update
	apt install openssl oathtool -y

uninstall:
	rm -f $(PRO)/otpshell

