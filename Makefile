COMPILER = g++
CFLAGS   = -g -Wall -O2
LDFLAGS  =
LIBS     =
INCLUDE  = -I./include 
TARGET   = ./bin/main

OBJDIR   = ./obj
SOURCES  = $(wildcard src/*.cpp)
OBJECTS  = $(addprefix $(OBJDIR)/,  $(notdir $(SOURCES:.cpp=.o)))

$(TARGET): $(OBJECTS) $(LIBS)
	$(COMPILER) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: src/%.cpp
	@[ -d $(OBJDIR) ]
	$(COMPILER) $(CFLAGS) $(INCLUDE) -o $@ -c $<

all: clean $(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)
