# Volumio installer (workaround for plugins/fixes not in the Volumio repo) - download from forked repo
# $1 = author; $2 = category, $3 = plugin name, $4 = zip filename (optional)
echo "Downloading $2/$3"
echo "Zip filename  = $ZIPFILE"
if [ ! -d /home/volumio/$3 ];
then
	mkdir /home/volumio/$3
else
	rm -rf home/volumio/$3
	mkdir /home/volumio/$3
fi

echo "Downloading and extracting zip file..."
cd /home/volumio/$3

wget -O $4.zip https://github.com/$1/volumio-plugins/raw/master/plugins/$2/$3/$4.zip
miniunzip -xo $4.zip
rm $4.zip

echo "Installing plugin..."
volumio plugin install
echo "Plugin installed successfully!"
