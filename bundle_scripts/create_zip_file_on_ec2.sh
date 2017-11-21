yes | sudo yum install gcc gcc-c++ libjpeg-devel zlib-devel libevent-devel libxml2-devel libxslt-devel libpng-devel
yes | sudo yum install python27-devel python27-pip

virtualenv env
source env/bin/activate
sudo /usr/bin/easy_install lxml
pip install newspaper

sed -i -e "s/DATA_DIRECTORY = '.newspaper_scraper'/DATA_DIRECTORY = '\/tmp\/.newspaper_scraper'/g" ./env/local/lib/python2.7/site-packages/newspaper/settings.py
sed -i -e "s/DATA_DIRECTORY = '.newspaper_scraper'/DATA_DIRECTORY = '\/tmp\/.newspaper_scraper'/g" ./env/local/lib64/python2.7/site-packages/newspaper/settings.py

zip -9 bundle.zip lambda_function.py
cd $VIRTUAL_ENV/lib/python2.7/site-packages
zip -r9 ~/bundle.zip *
cd $VIRTUAL_ENV/lib64/python2.7/site-packages
zip -r9 ~/bundle.zip *


