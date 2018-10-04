#!/bin/sh
# Author: Geoff Thornton (winguru)
# Description: A short script to merge all *.pdb and *.xml files into a new patterndb.xml file

if [ -e patterndb.xml ]; then rm -f patterndb.xml; fi
if [ -d tmpdb ]; then rm -rf tmpdb; fi
mkdir tmpdb
pdbtool merge -r -D . -G *.pdb -p tmpdb/pdbfiles.tmpdb
pdbtool merge -r -D . -G *.xml -p tmpdb/xmlfiles.tmpdb
pdbtool merge -r -D tmpdb -G *.tmpdb -p patterndb.xml
