MODULE  = $(notdir $(CURDIR))
OS     ?= $(shell uname -s)

CWD = $(CURDIR)
BIN = $(CWD)/bin

PY  = $(BIN)/python3
PIP = $(BIN)/pip3

.PHONY: all
all: $(PY) $(MODULE).py
	$^

.PHONY: install
install: $(OS)_install
	$(MAKE) $(PIP)

.PHONY: update
update: $(OS)_update
	$(MAKE) $(PIP)

.PHONY: Linux_install Linux_update
Linux_install Linux_update:
	sudo apt update
	sudo apt install -u `cat apt.txt`

$(PY) $(PIP):
	python3 -m venv .
	$(PIP) install -U pip autopep8
	$(PIP) install -U -r  requirements.pip

MERGE  = Makefile README.md apt.txt .gitignore .vscode 
MERGE += $(MODULE).py test_$(MODULE).py requirements.pip

.PHONY: main
main:
	git checkout $@
	git pull -v
	git checkout shadow -- $(MERGE)

.PHONY: shadow
shadow:
	git checkout $@
	git pull -v
