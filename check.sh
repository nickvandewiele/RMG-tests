#!/bin/bash

target=$1

echo 'Travis Build Dir: '$TRAVIS_BUILD_DIR

SOURCE_FOLDER=$TRAVIS_BUILD_DIR/testing/$target/chemkin/

echo 'Source folder: '$SOURCE_FOLDER

# check generated models:
# core:
python $TRAVIS_BUILD_DIR/checkModels.py $target $SOURCE_FOLDER/chem_annotated.inp $SOURCE_FOLDER/species_dictionary.txt
grep "checkModels" $target.log > $target.core
echo core for $target:
cat $target.core

# edge:
python $TRAVIS_BUILD_DIR/checkModels.py $target $SOURCE_FOLDER/chem_edge_annotated.inp $SOURCE_FOLDER/species_edge_dictionary.txt
grep "checkModels" $target.log > $target.edge
echo edge for $target:
cat $target.edge
