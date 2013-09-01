
source ./config.sh
pushd ${SRC_DIR} && make; popd

echo -----------------------------------------------------------------------------------------------------
echo Note that for the word analogy to perform well, the models should be trained on much larger data sets
echo Example input: paris france berlin
echo -----------------------------------------------------------------------------------------------------

if [ ! -e $VECTOR_DATA ]; then
  echo -----------------------------------------------------------------------------------------------------
  echo -- Training vectors...
  time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 0 -size 200 -window 5 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1
  
fi

echo -----------------------------------------------------------------------------------------------------
echo -- analogy...

$BIN_DIR/word-analogy $VECTOR_DATA
