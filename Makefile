OUT := ALL

all: $(OUT)/sorted

$(OUT)/sorted: | ../agh_2015/ALL/sorted
	python3 -m flow_models.anonymize -i binary -o binary -O $@ \
	    --filter-expr "(16596*86400+19*3600 <= first) & (first < 16596*86400+20*3600) & (af == 2)" \
	    --key $$KEY ../agh_2015/ALL/sorted
	touch $@
sorted: $(OUT)/sorted

DORMS_FILTER := ((sa3 >= 2510060545) & (sa3 < 2510060566)) | ((da3 >= 2510060545) & (da3 < 2510060566))

include pipeline.mk
