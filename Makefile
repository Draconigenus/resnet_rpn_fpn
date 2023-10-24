# AUTOPILOT_ROOT :=/tools/software/xilinx/Vitis_HLS/2021.1/
 OPENCV_ROOT :=../build/install

ASSEMBLE_SRC_ROOT := .
TB_ROOT := .
# IFLAG += -I "${AUTOPILOT_ROOT}/include"
# IFLAG += -I "${ASSEMBLE_SRC_ROOT}"
# IFLAG += -I "${ASSEMBLE_SRC_ROOT}"
# IFLAG += -I "${OPENCV_ROOT}/include/opencv4"
# IFLAG += -I "${TB_ROOT}"
# IFLAG += -I "/usr/include/x86_64-linux-gnu"
# IFLAG += -D__SIM_FPO__ -D__SIM_OPENCV__ -D__SIM_FFT__ -D__SIM_FIR__ -D__SIM_DDS__ -D__DSP48E1__
 
# IFLAG += -I "/nethome/ctalley7/Senior_Design/mingw64/usr/lib/gcc/x86_64-w64-mingw32/7.2.0/include"

# IFLAG +=  -g 
# CFLAG += -fPIC -std=c++11 -O3 -mcmodel=large #-fsanitize=address
# CFLAG += -fPIC -03 -std=c++11 -mcmodel=large #-fsanitize=address



CFLAG += -fno-PIC -std=c++11 -O0 -mcmodel=large #-fsanitize=address


CC      = g++ -g
# CC = ../mingw64/usr/bin/x86_64-w64-mingw32-g++

# LFLAG += -L "${OPENCV_ROOT}/lib64"
# LFLAG += -L "/nethome/ctalley7/Senior_Design/mingw64/usr/x86_64-w64-mingw32/sys-root/mingw/lib"

 CVFLAG += `pkg-config --cflags --libs opencv4`
# CVLIBS += -lopencv_core -lopencv_imgproc -lopencv_highgui

ALLOUT+= csim.out

all: $(ALLOUT) 
##TO BE MODIFIED START

resnet_batchnorm.o:./resnet_batchnorm.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
resnet_conv_1x1.o:./resnet_conv_1x1.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
resnet_conv_3x3.o:./resnet_conv_3x3.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
resnet_conv_7x7.o:./resnet_conv_7x7.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
resnet_top.o:./resnet_top.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)

fpn_conv_3x3.o:./fpn_conv_3x3.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_conv_1x1.o:./fpn_conv_1x1.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_fpn_3.o:./fpn_tiled_conv_fpn_3.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_fpn_2.o:./fpn_tiled_conv_fpn_2.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_fpn_1.o:./fpn_tiled_conv_fpn_1.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_fpn_0.o:./fpn_tiled_conv_fpn_0.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_lateral_3.o:./fpn_tiled_conv_lateral_3.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_lateral_2.o:./fpn_tiled_conv_lateral_2.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_lateral_1.o:./fpn_tiled_conv_lateral_1.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_tiled_conv_lateral_0.o:./fpn_tiled_conv_lateral_0.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_utils.o:./fpn_utils.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
fpn_top.o:./fpn_top.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)

rpn_conv_1x1.o:./rpn_conv_1x1.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
rpn_conv_3x3.o:./rpn_conv_3x3.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)
rpn_top.o:./rpn_top.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)

test_top.o: ./test_top.cpp
	$(CC) $(GCOV)  $(CFLAG)  -o $@ -c $^    -MMD $(IFLAG)

##TO BE MODIFIED END

IP_DEP+=resnet_conv_1x1.o
IP_DEP+=resnet_conv_3x3.o
IP_DEP+=resnet_conv_7x7.o
IP_DEP+=resnet_batchnorm.o
IP_DEP+=resnet_top.o

IP_DEP+=fpn_conv_3x3.o
IP_DEP+=fpn_conv_1x1.o
IP_DEP+=fpn_tiled_conv_fpn_3.o
IP_DEP+=fpn_tiled_conv_fpn_2.o
IP_DEP+=fpn_tiled_conv_fpn_1.o
IP_DEP+=fpn_tiled_conv_fpn_0.o
IP_DEP+=fpn_tiled_conv_lateral_3.o
IP_DEP+=fpn_tiled_conv_lateral_2.o
IP_DEP+=fpn_tiled_conv_lateral_1.o
IP_DEP+=fpn_tiled_conv_lateral_0.o
IP_DEP+=fpn_utils.o
IP_DEP+=fpn_top.o

IP_DEP+=rpn_conv_1x1.o
IP_DEP+=rpn_conv_3x3.o
IP_DEP+=rpn_top.o

IP_DEP+=test_top.o

main.o:./tb_test_top.cpp
	$(CC) $(GCOV)  $(CFLAG)  -I "${ASSEMBLE_SRC_ROOT}" -o $@  -c $^   -MMD $(IFLAG)

csim.out: main.o $(IP_DEP)
	$(CC)  $(GCOV)  $(CFLAG) -MMD $(IFLAG)  -o $@  $^ && ./csim.out


opencv_test.out: export PKG_CONFIG_PATH=${OPENCV_ROOT}/lib/pkgconfig:/usr/lib/pkgconfig
opencv_test.out: export LD_LIBRARY_PATH:=$(LD_LIBRARY_PATH):${OPENCV_ROOT}/lib
opencv_test.out: ./opencv_test.cpp
	$(CC) $(GCOV) $(CFLAG) -MMD $^ $(IFLAG) $(LFLAG) -o $@ $(CVFLAG)
	./opencv_test.out

basic_test.out: ./basic_test.cpp
	$(CC) $(GCOV) $(CFLAG) -MMD $^ $(IFLAG) $(LFLAG) -o $@ $(CVFLAG)
	./basic_test.out
#	@$(MAKE) -s clean

# opencv_test: ./opencv_test.cpp
# 	export PKG_CONFIG_PATH=${OPENCV_ROOT}/lib64/pkgconfig:/usr/lib64/pkgconfig
# 	$(CC) opencv_test.cpp `pkg-config --cflags --libs --static opencv4` `pkg-config --cflags --libs gtk+-3.0`
#   $(CC) opencv_test.cpp -I "${OPENCV_ROOT}/include/opencv4" -L "${OPENCV_ROOT}/lib64" -lopencv_imgproc -lopencv_highgui -lopencv_core -o opencv_test `pkg-config --cflags --libs --static opencv4`

jpg_test.out: export PKG_CONFIG_PATH=${OPENCV_ROOT}/lib/pkgconfig:/usr/lib/pkgconfig
jpg_test.out: ./tb_test_jpg.cpp
	$(CC) $(GCOV) $(CFLAG) -MMD -c $^ $(IFLAG) -I "${ASSEMBLE_SRC_ROOT}" -o $@

jpg.out: export PKG_CONFIG_PATH=${OPENCV_ROOT}/lib/pkgconfig:/usr/lib/pkgconfig
jpg.out: export LD_LIBRARY_PATH:=$(LD_LIBRARY_PATH):${OPENCV_ROOT}/lib
jpg.out: jpg_test.out $(IP_DEP)
	$(CC)  $(GCOV)  $(CFLAG) -MMD $^ $(IFLAG) -o $@ $(CVFLAG) 
	./jpg.out
	@$(MAKE) -s clean

synth:
	vitis_hls script.tcl

clean:
	rm -f -r csim.d 
	rm -f *.out *.gcno *.gcda *.txt *.o *.d
