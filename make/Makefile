# makefile which compiles all cpp files in the current directory
# and makes gcc generate dependency files.

cxx=g++
CXXFLAGS=-pipe -Wall -I.
LDFLAGS=

src=*.cpp
obj=$(patsubst %.cpp, %.o, $(wildcard $(src)))
target=a.out

all: $(target) ;

$(target): $(obj)
	$(cxx) -o $(target) $(obj)

%.o: %.cpp
	$(cxx) -c -MD $(CXXFLAGS) -o $@ $<

-include $(src:.cpp=.d)

.PHONY: all clean

clean:
	rm -f *.o *.a *.so *.gch *.d $(target)

