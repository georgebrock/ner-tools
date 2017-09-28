# Stanford Named Entity Recognition

Tools for training a Stanford NER model,
based on the example in the [Stanford NER FAQ][FAQ].

[FAQ]: https://nlp.stanford.edu/software/crf-faq.shtml#a

## Setup

0. Install Java.
1. Download Stanford NER from
   <https://nlp.stanford.edu/software/CRF-NER.shtml#Download>
2. Extract it to a directory named `stanford-ner` in this directory.

## Usage

1. Provide two sets of examples in `train.txt` and `test.txt` with one example
   on each line.
2. Run `make sources` to produce `train.tsv` and `test.tsv`.
3. Edit `train.tsv` and `test.tsv`, replacing `O` with entity names where
   appropriate. This may take some time.
4. Run `make model` to produce the model, in `ner-model.ser.gz`.
5. Run `make check` to test the model against the examples from `test.txt`.
