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

