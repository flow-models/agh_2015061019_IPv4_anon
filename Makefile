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

