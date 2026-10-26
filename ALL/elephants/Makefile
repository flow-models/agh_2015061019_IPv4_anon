export PYTHONPATH = $(CURDIR)/../../../..
PY ?= $(CURDIR)/../../../../.venv/bin/python3
.SECONDARY:

.SECONDEXPANSION:

N       ?= 2000000
ROUNDS  ?= 3
SEED    ?= 0
PPS     ?=
TIMEOUT ?= 15
FPS     ?= 1810
STRIDE  ?= 1

PPS_ARG := $(if $(PPS),--pps $(PPS) --timeout $(TIMEOUT),)

# real-times occupancy results require complete sorted flow records
SORTED_RECORDS := $(wildcard ../sorted/first.I ../sorted/last.I ../sorted/packets.Q ../sorted/octets.Q)
REAL_RESULTS := $(if $(filter 4,$(words $(SORTED_RECORDS))),simulate_real/all/length simulate_real/all/size,)

# prefer unbinned histograms (_b0.csv) when present, else binned
hist_src = $(firstword $(wildcard ../histograms/$1_b0.csv ../histograms/$1.csv))

# cap generated flows at the real histogram max so unbounded mixture tails
# cannot produce phantom mega-flows
xmax = $(shell $(PY) -c "import pandas as pd; print(int(pd.read_csv('$(call hist_src,$1)',index_col=0).bin_hi.max()))")

calculate_mix/%: ../mixtures/$$(*F)
	mkdir -p $@
	cd $@; $(PY) -m flow_models.elephants.boundaries.calculate -x $(*F) $(PPS_ARG) --save $(CURDIR)/../mixtures/$(*F)

calculate_data/%: $$(call hist_src,$$(*F))
	mkdir -p $@
	cd $@; $(PY) -m flow_models.elephants.boundaries.calculate -x $(*F) $(PPS_ARG) --save $(CURDIR)/$(call hist_src,$(*F))

simulate_mix/%: ../mixtures/$$(*F)
	mkdir -p $@
	cd $@; $(PY) -m flow_models.elephants.boundaries.simulate -x $(*F) -n $(N) -r $(ROUNDS) --seed $(SEED) $(PPS_ARG) --max-x $(call xmax,$(*F)) --save $(CURDIR)/../mixtures/$(*F)

simulate_data/%: $$(call hist_src,$$(*F))
	mkdir -p $@
	cd $@; $(PY) -m flow_models.elephants.boundaries.simulate -x $(*F) -n $(N) -r $(ROUNDS) --seed $(SEED) $(PPS_ARG) --save $(CURDIR)/$(call hist_src,$(*F))

ifneq (,$(REAL_RESULTS))
simulate_real/all/%: $(SORTED_RECORDS)
	mkdir -p $@
	cd $@; $(PY) -m flow_models.elephants.boundaries.simulate --real $(CURDIR)/../sorted -x $(*F) -r $(ROUNDS) --seed $(SEED) --timeout $(TIMEOUT) --real-fps $(FPS) --real-stride $(STRIDE) --save
endif

RESULTS := calculate_mix/all/length calculate_mix/all/size calculate_data/all/length calculate_data/all/size \
           simulate_mix/all/length simulate_mix/all/size simulate_data/all/length simulate_data/all/size

results: $(RESULTS) $(REAL_RESULTS)

plots: results
	$(PY) -m flow_models.elephants.boundaries.plot --format svg --one -O plots calculate_mix/all/length calculate_mix/all/size calculate_data/all/length calculate_data/all/size simulate_mix/all/length simulate_mix/all/size simulate_data/all/length simulate_data/all/size $(REAL_RESULTS)

.PHONY: results plots
