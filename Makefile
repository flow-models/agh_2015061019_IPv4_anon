export PYTHONPATH = $(CURDIR)/../..
.SECONDARY:

sorted: ../agh_2015/sorted
	python3 -m flow_models.anonymize -i binary -o binary -O sorted --filter-expr "(16596*86400+19*3600 <= first) & (first < 16596*86400+20*3600) & (af == 2)" --key $$KEY ../agh_2015/sorted
