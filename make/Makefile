CXX = g++
CXXFLAGS = -pipe -Wall -I.
LDFLAGS =

SRC = *.cpp
OBJ = $(patsubst %.cpp, %.o, $(wildcard $(SRC)))
TARGET = dp

all: $(OBJ)
	$(CXX) -o $(TARGET) $(OBJ)

%.o: %.cpp
	$(CXX) -c -MD -MF $(patsubst %.o, %.d, $@) \
	$(CXXFLAGS) -o $@ $<

-include $(SRC:.cpp=.d)

clean:
	rm -f *.o *.a *.so *.gch *.d $(TARGET)

