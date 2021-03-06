source ./config.sh
pushd ${SRC_DIR} && make; popd

  
if [ ! -e $VECTOR_DATA ]; then
  
  echo -----------------------------------------------------------------------------------------------------
  echo -- Training vectors...
  time $BIN_DIR/word2vec -train $TEXT_DATA -output $VECTOR_DATA -cbow 0 -size 200 -window 5 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1
  
fi

echo -----------------------------------------------------------------------------------------------------
echo -- distance...

# to compute accuracy with the full vocabulary, use: compute-accuracy $VECTOR_DATA < $DATA_DIR/questions-words.txt
set -x
$BIN_DIR/compute-accuracy $VECTOR_DATA 30000 < $DATA_DIR/questions-words.txt

