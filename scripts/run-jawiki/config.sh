DATA_DIR=../../data
SRC_DIR=../../src
BIN_DIR=../../bin

TEXT_DATA=$DATA_DIR/corpus/jawiki
CLASSES_DATA=$DATA_DIR/classes/jawiki-class
CLASSES_SORTED_DATA=$DATA_DIR/jawiki-class-sorted
VECTOR_DATA=$DATA_DIR/vectors/jawiki-vector.bin
PHRASES_DATA=$DATA_DIR/phrases/jawiki-phrases
PHRASES_VECTOR_DATA=$DATA_DIR/vectors/jawiki-phrase.bin

if [ ! -e $TEXT_DATA ]; then
	wget http://www.fz-qqq.net/dataset/jawiki.zip -O $DATA_DIR/corpus/jawiki.gz
	gzip -d $DATA_DIR/corpus/jawiki.gz -f
fi
