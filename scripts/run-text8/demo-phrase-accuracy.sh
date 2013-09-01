source ./config.sh
echo ----------------------------------------------------------------------------------------------------------------
echo Note that the accuracy and coverage of the test set questions is going to be low with this small training corpus
echo To achieve better accuracy, larger training set is needed
echo ----------------------------------------------------------------------------------------------------------------

pushd ${SRC_DIR} && make; popd

if [ ! -e $PHRASES_VECTOR_DATA ]; then
  if [ ! -e $PHRASES_DATA ]; then
    echo -----------------------------------------------------------------------------------------------------
    echo -- Creating phrases...
    time $BIN_DIR/word2phrase -train $TEXT_DATA -output $PHRASES_DATA -threshold 500 -debug 2-min-count 3
    
  fi

  echo -----------------------------------------------------------------------------------------------------
  echo -- Training vectors from phrases...
  time $BIN_DIR/word2vec -train $PHRASES_DATA -output $PHRASES_VECTOR_DATA -cbow 0 -size 300 -window 10 -negative 0 -hs 1 -sample 1e-3 -threads 12 -binary 1 -min-count 3
  
fi

echo -----------------------------------------------------------------------------------------------------
echo -- distance...

$BIN_DIR/compute-accuracy $PHRASES_VECTOR_DATA < $DATA_DIR/questions-phrases.txt
