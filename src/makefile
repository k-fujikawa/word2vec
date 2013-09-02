SCRIPTS_DIR=../scripts
BIN_DIR=../bin

CC = gcc
#The -Ofast might not work with older versions of gcc; in that case, use -O2
CFLAGS = -lm -pthread -O2 -Wall -funroll-loops 

all: word2vec word2phrase distance distance-arg word-analogy word-analogy-arg compute-accuracy

word2vec : word2vec.c
	$(CC) word2vec.c -o ${BIN_DIR}/word2vec $(CFLAGS)
word2phrase : word2phrase.c
	$(CC) word2phrase.c -o ${BIN_DIR}/word2phrase $(CFLAGS)
distance : distance.c
	$(CC) distance.c -o ${BIN_DIR}/distance $(CFLAGS)
distance-arg : distance.c
	$(CC) distance-arg.c -o ${BIN_DIR}/distance-arg $(CFLAGS)
word-analogy : word-analogy.c
	$(CC) word-analogy.c -o ${BIN_DIR}/word-analogy $(CFLAGS)
word-analogy-arg : word-analogy-arg.c
	$(CC) word-analogy-arg.c -o ${BIN_DIR}/word-analogy-arg $(CFLAGS)
compute-accuracy : compute-accuracy.c
	$(CC) compute-accuracy.c -o ${BIN_DIR}/compute-accuracy $(CFLAGS)
	chmod -R +x ${SCRIPTS_DIR}/*

clean:
	pushd ${BIN_DIR} && rm -rf word2vec word2phrase distance distance-arg word-analogy word-analogy-arg compute-accuracy; popd
