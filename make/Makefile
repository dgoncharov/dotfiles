# A makefile template which compiles all cpp files in the current directory
# and makes gcc generate dependency files.

cxx = g++
CXXFLAGS = -pipe -Wall -I.
LDFLAGS =

src = *.cpp
obj = $(patsubst %.cpp, %.o, $(wildcard $(src)))
target = dp

all: $(obj)
	$(cxx) -o $(target) $(obj)

%.o: %.cpp
	$(cxx) -c -MD -MF $(patsubst %.o, %.d, $@) \
	$(CXXFLAGS) -o $@ $<

-include $(src:.cpp=.d)

clean:
	rm -f *.o *.a *.so *.gch *.d $(target)

