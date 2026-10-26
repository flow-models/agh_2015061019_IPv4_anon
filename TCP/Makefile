OUT := ALL

all: $(OUT)/histograms/length.csv

CONVERT_SRC := ../ALL/sorted
CONVERT_FILTER := prot == 6
FIT_length_flows := -i 500 -U 6 -L 4
FIT_length_packets := -i 500 -U 6 -L 4
FIT_length_octets := -i 400 -U 2 -L 4

include ../pipeline.mk
