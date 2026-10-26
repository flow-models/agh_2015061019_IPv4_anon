# Shared dataset pipeline rules — lives at the dataset root; each dataset
# Makefile includes it via a relative path.

# ROOT: repository root containing the flow_models package (dataset's ../..)
DS   := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
ROOT := $(abspath $(DS)/../..)
#
# Optional variables:
#   SORTED_SRC       input records for scan steps        (default $(OUT)/sorted)
#   FILTER           --filter-expr for scan steps        (subset selection)
#   CONVERT_SRC      build $(OUT)/sorted via convert from these records
#   CONVERT_FILTER   --filter-expr for the convert step
#   DORMS_FILTER     extra --filter-expr series into $(OUT)/series/dorms
#   FIT_<feature>_<weight>   fit flags, e.g. FIT_length_octets

OUT := ALL
.DEFAULT_GOAL := all
export PYTHONPATH := $(abspath $(ROOT))
.SECONDARY:
.SECONDEXPANSION:
.PHONY: all histograms mixtures plots summary series first_mirror sorted

FILTER_ARG := $(if $(FILTER),--filter-expr "$(FILTER)",)
SORTED_SRC ?= $(OUT)/sorted

# --- sorted -------------------------------------------------------------

ifdef CONVERT_SRC
$(OUT)/sorted: | $(CONVERT_SRC)
	python3 -m flow_models.convert -i binary -o binary -O $@ $(if $(CONVERT_FILTER),--filter-expr "$(CONVERT_FILTER)",) $(CONVERT_SRC)
	touch $@
sorted: $(OUT)/sorted
endif

# --- histograms (one pattern rule covers <feature>[_b0].csv) ------------

$(OUT)/histograms: $(OUT)/histograms/length.csv $(OUT)/histograms/length_b0.csv \
                   $(OUT)/histograms/size.csv $(OUT)/histograms/size_b0.csv
	true
	touch $@

$(OUT)/histograms/%.csv: | $(SORTED_SRC)
	mkdir -p $(OUT)/histograms
	nice pypy3 -m flow_models.hist -i binary -x $(word 1,$(subst _, ,$*)) \
	    -b $(if $(findstring _b0,$*),0,12) $(FILTER_ARG) $(SORTED_SRC) > $@.tmp && mv $@.tmp $@

# --- mixtures -----------------------------------------------------------

FIT_length_flows   ?= -i 400 -U 6 -L 4
FIT_length_packets ?= -i 400 -U 6 -L 4
FIT_length_octets  ?= -i 400 -U 6 -L 4
FIT_size_flows     ?= -i 400 -U 0 -L 8
FIT_size_packets   ?= -i 400 -U 0 -L 5
FIT_size_octets    ?= -i 400 -U 0 -L 5

$(OUT)/mixtures: | $(OUT)/mixtures/length $(OUT)/mixtures/size
	true
	touch $@

$(OUT)/mixtures/%: $(OUT)/histograms/%.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit $(FIT_$*_flows)   -y flows   ../../histograms/$*.csv
	cd $@; python3 -m flow_models.fit $(FIT_$*_packets) -y packets ../../histograms/$*.csv
	cd $@; python3 -m flow_models.fit $(FIT_$*_octets)  -y octets  ../../histograms/$*.csv
	touch $@

# --- plots --------------------------------------------------------------

$(OUT)/plots: $(OUT)/histograms/length.csv $(OUT)/histograms/size.csv \
              | $(OUT)/mixtures/length $(OUT)/mixtures/size
	mkdir -p $@/length $@/size
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format svg -x length ../../histograms/length.csv ../../mixtures/length
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format svg --single -x length ../../histograms/length.csv ../../mixtures/length
	cd $@/size;   python3 -m flow_models.plot -P points -P comp --format svg -x size   ../../histograms/size.csv   ../../mixtures/size
	cd $@/size;   python3 -m flow_models.plot -P points -P comp --format svg --single -x size   ../../histograms/size.csv   ../../mixtures/size
	touch $@

# --- summary ------------------------------------------------------------

$(OUT)/summary: $(OUT)/histograms/length_b0.csv $(OUT)/histograms/size_b0.csv
	mkdir -p $@
	python3 -m flow_models.summary       $(OUT)/histograms/length_b0.csv > $@/length.txt
	python3 -m flow_models.summary       $(OUT)/histograms/size_b0.csv   > $@/size.txt
	python3 -m flow_models.summary -f json $(OUT)/histograms/length_b0.csv > $@/length.json
	python3 -m flow_models.summary -f json $(OUT)/histograms/size_b0.csv   > $@/size.json
	touch $@

# --- series -------------------------------------------------------------

$(OUT)/series: | $(SORTED_SRC)
	nice pypy3 -m flow_models.series -i binary -O $@ $(FILTER_ARG) $(SORTED_SRC)
	cd $@; python3 -m flow_models.series_plot
ifdef DORMS_FILTER
	nice pypy3 -m flow_models.series -i binary -O $@/dorms --filter-expr '$(DORMS_FILTER)' $(SORTED_SRC)
	cd $@/dorms; python3 -m flow_models.series_plot
endif
	touch $@

# --- first_mirror -------------------------------------------------------

$(OUT)/first_mirror/%: | $(SORTED_SRC)
	nice pypy3 -m flow_models.first_mirror.simulate -i binary -O $@ --mirror $* $(FILTER_ARG) $(SORTED_SRC)
	touch $@

$(OUT)/first_mirror: | $(OUT)/first_mirror/1 $(OUT)/first_mirror/2 $(OUT)/first_mirror/3 \
                     $(OUT)/first_mirror/4 $(OUT)/first_mirror/8
	cd $@; python3 -m flow_models.first_mirror.plots --format svg --series ../series -O plots 1 2 3 4 8
	touch $@

# --- phony aliases ------------------------------------------------------

histograms: $(OUT)/histograms
mixtures: $(OUT)/mixtures
plots: $(OUT)/plots
summary: $(OUT)/summary
series: $(OUT)/series
first_mirror: $(OUT)/first_mirror
histograms/%: $(OUT)/histograms/% ;
mixtures/%: $(OUT)/mixtures/% ;
first_mirror/%: $(OUT)/first_mirror/% ;
