export PYTHONPATH = $(CURDIR)/../..
.SECONDARY:

sorted: ../agh_2015/sorted
	python3 -m flow_models.anonymize -i binary -o binary -O sorted --filter-expr "(16596*86400+19*3600 <= first) & (first < 16596*86400+20*3600) & (af == 2)" --key $$KEY ../agh_2015/sorted

histograms/all/length.csv: sorted
	mkdir -p histograms/all
	nice pypy3 -m flow_models.hist -i binary -x length -b 12 sorted > $@

histograms/all/length_b0.csv: sorted
	mkdir -p histograms/all
	nice pypy3 -m flow_models.hist -i binary -x length -b 0 sorted > $@

histograms/all/size.csv: sorted
	mkdir -p histograms/all
	nice pypy3 -m flow_models.hist -i binary -x size -b 12 sorted > $@

histograms/all/size_b0.csv: sorted
	mkdir -p histograms/all
	nice pypy3 -m flow_models.hist -i binary -x size -b 0 sorted > $@

histograms/tcp/length.csv: sorted
	mkdir -p histograms/tcp
	nice pypy3 -m flow_models.hist -i binary -x length -b 12 --filter-expr "prot==6" sorted > $@

histograms/tcp/length_b0.csv: sorted
	mkdir -p histograms/tcp
	nice pypy3 -m flow_models.hist -i binary -x length -b 0 --filter-expr "prot==6" sorted > $@

histograms/tcp/size.csv: sorted
	mkdir -p histograms/tcp
	nice pypy3 -m flow_models.hist -i binary -x size -b 12 --filter-expr "prot==6" sorted > $@

histograms/tcp/size_b0.csv: sorted
	mkdir -p histograms/tcp
	nice pypy3 -m flow_models.hist -i binary -x size -b 0 --filter-expr "prot==6" sorted > $@

histograms/udp/length.csv: sorted
	mkdir -p histograms/udp
	nice pypy3 -m flow_models.hist -i binary -x length -b 12 --filter-expr "prot==17" sorted > $@

histograms/udp/length_b0.csv: sorted
	mkdir -p histograms/udp
	nice pypy3 -m flow_models.hist -i binary -x length -b 0 --filter-expr "prot==17" sorted > $@

histograms/udp/size.csv: sorted
	mkdir -p histograms/udp
	nice pypy3 -m flow_models.hist -i binary -x size -b 12 --filter-expr "prot==17" sorted > $@

histograms/udp/size_b0.csv: sorted
	mkdir -p histograms/udp
	nice pypy3 -m flow_models.hist -i binary -x size -b 0 --filter-expr "prot==17" sorted > $@

.SECONDEXPANSION:

histograms/%: histograms/$$*/length.csv histograms/$$*/length_b0.csv histograms/$$*/size.csv histograms/$$*/size_b0.csv
	true

mixtures/all/length: histograms/all/length.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 400 -U 6 -L 4 -y flows ../../../histograms/all/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 6 -L 4 -y packets ../../../histograms/all/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 6 -L 4 -y octets ../../../histograms/all/length.csv
	touch $@

mixtures/all/size: histograms/all/size.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 8 -y flows ../../../histograms/all/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y packets ../../../histograms/all/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y octets ../../../histograms/all/size.csv
	touch $@

mixtures/tcp/length: histograms/tcp/length.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 500 -U 6 -L 4 -y flows ../../../histograms/tcp/length.csv
	cd $@; python3 -m flow_models.fit -i 500 -U 6 -L 4 -y packets ../../../histograms/tcp/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 2 -L 4 -y octets ../../../histograms/tcp/length.csv
	touch $@

mixtures/tcp/size: histograms/tcp/size.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 8 -y flows ../../../histograms/tcp/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y packets ../../../histograms/tcp/size.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 0 -L 5 -y octets ../../../histograms/tcp/size.csv
	touch $@

mixtures/udp/length: histograms/udp/length.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 400 -U 4 -L 9 -y flows ../../../histograms/udp/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 7 -L 5 -y packets ../../../histograms/udp/length.csv
	cd $@; python3 -m flow_models.fit -i 400 -U 7 -L 5 -y octets ../../../histograms/udp/length.csv
	touch $@

mixtures/udp/size: histograms/udp/size.csv
	mkdir -p $@
	cd $@; python3 -m flow_models.fit -i 200 -U 0 -L 9 -y flows ../../../histograms/udp/size.csv
	cd $@; python3 -m flow_models.fit -i 200 -U 0 -L 9 -y packets ../../../histograms/udp/size.csv
	cd $@; python3 -m flow_models.fit -i 200 -U 0 -L 9 -y octets ../../../histograms/udp/size.csv
	touch $@

mixtures/%: mixtures/$$*/length mixtures/$$*/size
	true

plots/%: histograms/$$*/length.csv histograms/$$*/size.csv mixtures/$$*/length mixtures/$$*/size
	mkdir -p $@/length
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format pdf -x length ../../../histograms/$*/length.csv ../../../mixtures/$*/length
	cd $@/length; python3 -m flow_models.plot -P points -P comp --format pdf --single -x length ../../../histograms/$*/length.csv ../../../mixtures/$*/length
	mkdir -p $@/size
	cd $@/size; python3 -m flow_models.plot -P points -P comp --format pdf -x size ../../../histograms/$*/size.csv ../../../mixtures/$*/size
	cd $@/size; python3 -m flow_models.plot -P points -P comp --format pdf --single -x size ../../../histograms/$*/size.csv ../../../mixtures/$*/size

summary/%: histograms/$$*/length_b0.csv histograms/$$*/size_b0.csv
	mkdir -p $@
	python3 -m flow_models.summary histograms/$*/length_b0.csv > summary/$*/length.tex
	python3 -m flow_models.summary histograms/$*/size_b0.csv > summary/$*/size.tex

series/all: sorted
	nice pypy3 -m flow_models.series -i binary -O series/all sorted
	cd series/all;	python3 -m flow_models.series_plot

series/tcp: sorted
	nice pypy3 -m flow_models.series -i binary -O series/tcp --filter-expr "prot==6" sorted
	cd series/tcp;	python3 -m flow_models.series_plot

series/udp: sorted
	nice pypy3 -m flow_models.series -i binary -O series/udp --filter-expr "prot==17" sorted
	cd series/udp;	python3 -m flow_models.series_plot

series/dorms: sorted
	nice pypy3 -m flow_models.series -i binary -O series/dorms --filter-expr '((sa3 >= 2510060545) & (sa3 < 2510060566)) | ((da3 >= 2510060545) & (da3 < 2510060566))' sorted
	cd series/dorms; python3 -m flow_models.series_plot

first_mirror/all/%: sorted
	nice pypy3 -m flow_models.first_mirror.simulate -i binary -O first_mirror/all/$* --mirror $* sorted

first_mirror/tcp/%: sorted
	nice pypy3 -m flow_models.first_mirror.simulate -i binary -O first_mirror/tcp/$* --mirror $* --filter-expr "prot==6" sorted

first_mirror/udp/%: sorted
	nice pypy3 -m flow_models.first_mirror.simulate -i binary -O first_mirror/udp/$* --mirror $* --filter-expr "prot==17" sorted

first_mirror/%: first_mirror/$$*/1 first_mirror/$$*/2 first_mirror/$$*/3 first_mirror/$$*/4 first_mirror/$$*/8
	true

