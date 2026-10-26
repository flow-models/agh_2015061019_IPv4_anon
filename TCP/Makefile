OUT := ALL
.DEFAULT_GOAL := all
.PHONY: all sorted histograms mixtures plots summary series first_mirror

all: $(OUT)/sorted

export PYTHONPATH = $(CURDIR)/../../..
.SECONDARY:

$(OUT)/sorted: ../ALL/sorted
	python3 -m flow_models.convert -i binary -o binary -O $(OUT)/sorted --filter-expr "prot == 6" ../ALL/sorted

$(OUT)/histograms/length.csv: $(OUT)/sorted
	mkdir -p $(OUT)/histograms
	nice pypy3 -m flow_models.hist -i binary -x length -b 12 $(OUT)/sorted > $@

$(OUT)/histograms/length_b0.csv: $(OUT)/sorted
	mkdir -p $(OUT)/histograms
	nice pypy3 -m flow_models.hist -i binary -x length -b 0 $(OUT)/sorted > $@

$(OUT)/histograms/size.csv: $(OUT)/sorted
	mkdir -p $(OUT)/histograms
	nice pypy3 -m flow_models.hist -i binary -x size -b 12 $(OUT)/sorted > $@

$(OUT)/histograms: $(OUT)/histograms/length.csv $(OUT)/histograms/length_b0.csv $(OUT)/histograms/size.csv $(OUT)/histograms/size_b0.csv
	true

$(OUT)/histograms/size_b0.csv: $(OUT)/sorted
	mkdir -p $(OUT)/histograms
	nice pypy3 -m flow_models.hist -i binary -x size -b 0 $(OUT)/sorted > $@

$(OUT)/mixtures: $(OUT)/mixtures/length $(OUT)/mixtures/size
	true

$(OUT)/mixtures/length: $(OUT)/histograms/length.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 500 -U 6 -L 4 -y flows ../../histograms/length.csv
	cd $@; python3 -m flow_models.fit -i 500 -U 6 -L 4 -y packets ../../histograms/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 2 -L 4 -y octets ../../histograms/length.csv
	touch $@

$(OUT)/mixtures/size: $(OUT)/histograms/size.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 8 -y flows ../../histograms/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y packets ../../histograms/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y octets ../../histograms/size.csv
	touch $@

$(OUT)/plots: $(OUT)/histograms/length.csv $(OUT)/histograms/size.csv $(OUT)/mixtures/length $(OUT)/mixtures/size
	mkdir -p $@/length
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format svg -x length ../../histograms/length.csv ../../mixtures/length
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format svg --single -x length ../../histograms/length.csv ../../mixtures/length
	mkdir -p $@/size
	cd $@/size; python3 -m flow_models.plot -P points -P comp --format svg -x size ../../histograms/size.csv ../../mixtures/size
	cd $@/size; python3 -m flow_models.plot -P points -P comp --format svg --single -x size ../../histograms/size.csv ../../mixtures/size

$(OUT)/summary: $(OUT)/histograms/length_b0.csv $(OUT)/histograms/size_b0.csv
	mkdir -p $@
	python3 -m flow_models.summary $(OUT)/histograms/length_b0.csv > $(OUT)/summary/length.tex
	python3 -m flow_models.summary $(OUT)/histograms/size_b0.csv > $(OUT)/summary/size.tex
	python3 -m flow_models.summary -f json $(OUT)/histograms/length_b0.csv > $(OUT)/summary/length.json
	python3 -m flow_models.summary -f json $(OUT)/histograms/size_b0.csv > $(OUT)/summary/size.json

$(OUT)/series: $(OUT)/sorted
	nice pypy3 -m flow_models.series -i binary -O $(OUT)/series $(OUT)/sorted
	cd $(OUT)/series;	python3 -m flow_models.series_plot

$(OUT)/first_mirror/%: $(OUT)/sorted
	nice pypy3 -m flow_models.first_mirror.simulate -i binary -O $(OUT)/first_mirror/$* --mirror $* $(OUT)/sorted

$(OUT)/first_mirror: $(OUT)/first_mirror/1 $(OUT)/first_mirror/2 $(OUT)/first_mirror/3 $(OUT)/first_mirror/4 $(OUT)/first_mirror/8
	cd $(OUT)/first_mirror; python3 -m flow_models.first_mirror.plots --format svg -O plots --series ../series 1 2 3 4 8

sorted: $(OUT)/sorted
histograms: $(OUT)/histograms
mixtures: $(OUT)/mixtures
plots: $(OUT)/plots
summary: $(OUT)/summary
series: $(OUT)/series
first_mirror: $(OUT)/first_mirror
histograms/%: $(OUT)/histograms/% ;
mixtures/%: $(OUT)/mixtures/% ;
first_mirror/%: $(OUT)/first_mirror/% ;
