DATA_DIR=../../data
SRC_DIR=../../src
BIN_DIR=../../bin

TEXT_DATA=$DATA_DIR/corpus/text8
CLASSES_DATA=$DATA_DIR/classes/text8-class
CLASSES_SORTED_DATA=$DATA_DIR/classes/text8-class-sorted
VECTOR_DATA=$DATA_DIR/vectors/text8-vector.bin
PHRASES_DATA=$DATA_DIR/phrases/text8-phrases
PHRASES_VECTOR_DATA=$DATA_DIR/vectors/vectors-phrase.bin

if [ ! -e $TEXT_DATA ]; then
	wget http://mattmahoney.net/dc/text8.zip -O $DATA_DIR/corpus/text8.gz
	gzip -d $DATA_DIR/corpus/text8.gz -f
fi
