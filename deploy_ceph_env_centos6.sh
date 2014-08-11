#!/bin/sh

# Install dependent package
yum install libuuid-devel libblkid-devel libudev-devel fuse-devel libedit-devel libatomic_ops-devel

# Install leveldb
wget https://leveldb.googlecode.com/files/leveldb-1.14.0.tar.gz
tar zxvf leveldb-1.14.0.tar.gz
cd leveldb-1.14.0
make
cp libleveldb.* /usr/lib
cp -r include/leveldb /usr/local/include/
cd ..

# Install tcmalloc
#need libunwind first
wget http://download.savannah.gnu.org/releases/libunwind/libunwind-0.99-beta.tar.gz
tar zxvf libunwind-0.99-beta.tar.gz
cd libunwind-0.99-beta
./configure
make && make install
cd ..

#than gperftools
wget https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/gperftools-2.2.1.tar.gz
tar zxvf gperftools-2.2.1.tar.gz
cd gperftools-2.2.1
./configure
make  
make install
cd ..

# Install lz4
svn checkout http://lz4.googlecode.com/svn/trunk/ lz4
cd lz4/
make
cp liblz4.* /usr/lib
cd ..

# Install argparse 
git clone https://github.com/AlfredChenxf/useful_script
cd useful_script
python ez_setup.py
easy_install pip
pip install argparse
cd ..

# Install fdf-ceph
svn co http://svn.schoonerinfotech.net/svn/schooner-trunk/ht_delivery/qa/fdf-ceph
cd fdf-ceph
./autogen.sh
./configure
make


