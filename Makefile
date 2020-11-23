MODULE = $(notdir $(CURDIR))

CWD = $(CURDIR)
BIN = $(CWD)/bin

PY  = $(BIN)/python3
PIP = $(BIN)/pip3

.PHONY: all
all: $(PY) $(MODULE).py
	$^

.PHONY: install
install:
	sudo apt update
	sudo apt install -u `cat apt.txt`

MERGE  = Makefile README.md apt.txt .vscode
MERGE += $(MODULE).py test_$(MODULE).py requirements.pip
