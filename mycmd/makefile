# Builds keypress.exe, necessary for about.bat
# Compiled using MinGW/MSYS environment
CC=g++
FLAGS=-Wall -Wfatal-errors
EXE=keypress.exe

all: $(EXE)

keypress.exe: keypress.cc
	$(CC) $(FLAGS) -o $@ keypress.cc

clean:
	rm -rf $(EXE)
