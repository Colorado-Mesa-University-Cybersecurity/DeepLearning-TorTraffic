#!bin/bash

downloadFunction() {
	mkdir ../CICDataSet-TOR
	perl -e 'print "="x100; print "\n"'
	echo "Data Set will be downloaded in the parent folder named CICDataSet-TOR"
	perl -e 'print "="x100; print "\n"'
	URL=http://205.174.165.80/CICDataset/ISCX-Tor-NonTor-2017/Dataset/
	zipFile1=TorCSV.zip
	zipFile2=TorPcaps.zip
	perl -e 'print "="x50; print "\n"'
	echo "Downloading TorCSV CIC Dataset........."
	perl -e 'print "="x50; print "\n"'
	curl -o ../CICDataSet-TOR/$zipFile1 $URL$zipFile1
	perl -e 'print "="x50; print "\n"'
	echo "Downloading TorPcaps CIC Dataset........."
	perl -e 'print "="x50; print "\n"'
	curl -o ../CICDataSet-TOR/$zipFile2 $URL$zipFile2
	perl -e 'print "="x50; print "\n"'
	echo "Unzipping the file ${zipFile1}........."
	perl -e 'print "="x50; print "\n"'
	cd ../CICDataSet-TOR
	unzip -o $zipFile1
	perl -e 'print "="x50; print "\n"'
	echo "Unzipping the file ${zipFile2}........."
	perl -e 'print "="x50; print "\n"'
	unzip -o $zipFile2
	perl -e 'print "="x50; print "\n"'
	echo "Deleting Zip files after extracting........"
	perl -e 'print "="x50; print "\n"'
	rm $zipFile1
	rm $zipFile2
	perl -e 'print "="x50; print "\n"'
	echo "Download and extraction complete.........."
	perl -e 'print "="x50; print "\n"'
}

downloadFunction
