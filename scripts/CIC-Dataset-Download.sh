#!bin/bash

downloadFunction() {
	mkdir ../CICDataSet-TOR
	echo "Data Set will be downloaded in the parent folder named CICDataSet-TOR"
	perl -e 'print "="x50; print "\n"'
	echo "Downloading Tor/ Non-Tor CIC Dataset........."
	perl -e 'print "="x50; print "\n"'
	URL=http://205.174.165.80/CICDataset/ISCX-Tor-NonTor-2017/Dataset/
	zipFile=TorCSV.zip
	curl -o ../CICDataSet-TOR/$zipFile $URL$zipFile
	echo "Unzipping the file ${zipFile}........."
	perl -e 'print "="x50; print "\n"'
	cd ../CICDataSet-TOR
	unzip -o $zipFile
	perl -e 'print "="x50; print "\n"'
	echo "Deleting Zip file after extracting........"
	perl -e 'print "="x50; print "\n"'
	rm $zipFile
	perl -e 'print "="x50; print "\n"'
	echo "Download and extraction complete.........."
	perl -e 'print "="x50; print "\n"'
}

downloadFunction
