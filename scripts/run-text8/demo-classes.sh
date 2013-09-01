source ./config.sh
pushd ${SRC_DIR} && make; popd

  
if [ ! -e $CLASSES_DATA ]; then
  echo -----------------------------------------------------------------------------------------------------
  echo -- Training vectors...
  time $BIN_DIR/word2vec -train $TEXT_DATA -output $CLASSES_DATA -cbow 0 -size 200 -window 5 -negative 0 -hs 1 -sample 1e-3 -threads 12 -classes 500
  
fi

sort $CLASSES_DATA -k 2 -n > $CLASSES_SORTED_DATA
echo The word classes were saved to file $CLASSES_SORTED_DATA
