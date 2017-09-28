JAVA=java -cp stanford-ner/stanford-ner.jar
model=ner-model.ser.gz
train_file=train.tsv
test_file=test.tsv

.PHONY: model check

check: $(model)
	$(JAVA) edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier $< -testFile $(test_file)

model: $(model)

$(model): train.prop
	$(JAVA) edu.stanford.nlp.ie.crf.CRFClassifier -trainFile $(train_file) -serializeTo $@ -prop train.prop

sources: $(train_file) $(test_file)

%.tsv: %.tok
	perl -ne 'chomp; $$_ =~ /^$$/ ? print "\n" : print "$$_\tO\n"' $< > $@

%.tok: %.txt
	echo "" > $@; \
	while read line; do \
	  echo $$line | $(JAVA) edu.stanford.nlp.process.PTBTokenizer >> $@; \
	  echo >> $@; \
	done < $<
