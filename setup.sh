

download_dir=`pwd`
install_dir=~/local


added='n'
while [ $added != "y" ]; do
  echo 'make sure '$install_dir/lib' is added to LD_LIBRARY_PATH' and $install_dir/bin' is added to PATH (y/n)'
  read added
done

##########################################################
####################### netcdf etc #######################
##########################################################
cd $dwonload_dir

dextract(){
  cd $download_dir
  ofile=tmp.tar.gz
  wget $1  -O $ofile
  tar -xzf tmp.tar.gz
  folder=`find . -name '*'$2'*' -cmin -1 -mindepth 1 -maxdepth 1 -type d | head -1`
  echo $folder
  cd $folder
}

zlib_link='http://www.zlib.net/zlib-1.2.11.tar.gz'
szip_link='https://support.hdfgroup.org/ftp/lib-external/szip/2.1.1/src/szip-2.1.1.tar.gz'
hdf5_link='https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.1.tar.gz'
curl_link='https://curl.haxx.se/download/curl-7.54.0.tar.gz'
netcdf_c='ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4.4.1.1.tar.gz'
netcdf_fortran='ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-4.4.4.tar.gz'
netcdf_cxx='https://github.com/Unidata/netcdf-cxx4/archive/v4.3.0.tar.gz'
jasper_link='http://www.ece.uvic.ca/~frodo/jasper/software/jasper-2.0.12.tar.gz'
grib_api='https://software.ecmwf.int/wiki/download/attachments/3473437/grib_api-1.21.0-Source.tar.gz?api=v2'
proj4='http://download.osgeo.org/proj/proj-4.9.3.tar.gz'
boost='https://dl.bintray.com/boostorg/release/1.64.0/source/:boost_1_64_0.tar.gz' 
libgd='https://github.com/libgd/libgd/releases/download/gd-2.2.4/libgd-2.2.4.tar.gz'
magics='https://software.ecmwf.int/wiki/download/attachments/3473464/Magics-2.32.0-Source.tar.gz?api=v2'
cdo='https://code.zmaw.de/attachments/download/14387/cdo-current.tar.gz'
nccmp='http://prdownloads.sourceforge.net/nccmp/nccmp-1.8.2.1.tar.gz?download'


dextract $zlib_link zlib
./configure --prefix=$install_dir
make && make install
cd ..

dextract $szip_link szip
./configure --prefix=$install_dir
make && make install
cd ..

dextract $hdf5_link hdf
./configure --enable-fortran --enable-cxx --with-zlib=$install_dir --with-szlib=$install_dir --prefix=$install_dir
make && make install
cd ..

dextract $curl_link curl
./configure --with-pic --with-zlib=$install_dir --prefix=$install_dir
make && make install
cd ..

dextract $netcdf_c netcdf
CPPFLAGS=-I${install_dir}/include LDFLAGS=-L${install_dir}/lib ./configure --prefix=${install_dir}
make && make install
netcdf_dir=`pwd`
cd ..

dextract $nccmp nccmp
CFLAGS=-I${install_dir}/include LDFLAGS=-L${install_dir}/lib ./configure --prefix=${install_dir} --with-netcdf=$netcdf_dir
make && make install
cd ..


dextract $jasper_link jasper
CFLAGS=-fPIC ./configure --prefix=$install_dir
make && make install
cd ..

dextract $grib_api grib
CFLAGS=-fPIC ./configure --prefix=$install_dir --with-netcdf=$install_dir --with-jasper=$install_dir --disable-jpeg
make && make install
cd ..

dextract $proj4 proj
CFLAGS=-fPIC ./configure –prefix=$install_dir --enable-static=yes --enable-shared=no
make && make install
cd ..

dextract $netcdf_cxx netcdf-c
CPPFLAGS=-I${install_dir}/include LDFLAGS=-L${install_dir}/lib ./configure --prefix=${install_dir}
make check install
cd ..

dextract $netcdf_fortran netcdf-f
CPPFLAGS=-I${install_dir}/include LDFLAGS=-L${install_dir}/lib ./configure --prefix=${install_dir}
make check install
cd ..

conda install swig numpy pango

dextract $boost boost
./bootstrap.sh --with-python=$CONDA_ROOT/bin/python --prefix=$install_dir
cd ..


dextract $libgd libgd
./configure --prefix=$install_dir
make && make install
cd ..


dextract $magics magics
LDFLAGS=-L${install_dir}/lib CFLAGS=-fPIC ./configure --prefix=$install_dir --enable-python --enable-grib --enable-proj4 --enable-netcdf --with-boost=$install_dir --with-grib-api=$install_dir --with-proj4=$install_dir --with-netcdf=$install_dir
make && make install
cd ..

dextract $cdo cdo
./configure --prefix=$install_dir  --with-szlib=$install_dir --with-netcdf=$install_dir --with-jasper=$install_dir --with-hdf5=$install_dir --with-grib_api=$install_dir --with-magics=$install_dir --with-proj=$install_dir
make && make install
cd ..



##########################################################
####################### set up git #######################
##########################################################
git config --global user.name "Michael Ou"
git config --global user.email "ougengxin@gmail.com"
git config --global apply.whitespace nowarn
#git config --global alias.co checkout
git config --global credential.helper osxkeychain
if [ -f ~/.gitconfig ]; then
  echo '[color]' >> ~/.gitconfig
  echo 'found ~/.gitconfig'
else
  echo '[color]' >  ~/.gitconfig
fi

echo '    branch = auto' >> ~/.gitconfig
echo '    diff = auto' >> ~/.gitconfig
echo '    status = auto' >> ~/.gitconfig
echo '[color "branch"]' >> ~/.gitconfig
echo '    current = yellow reverse' >> ~/.gitconfig
echo '    local = yellow' >> ~/.gitconfig
echo '    remote = green' >> ~/.gitconfig
echo '[color "diff"]' >> ~/.gitconfig
echo '    meta = yellow bold' >> ~/.gitconfig
echo '    frag = magenta bold' >> ~/.gitconfig
echo '    old = red bold' >> ~/.gitconfig
echo '    new = green bold' >> ~/.gitconfig
echo '[color "status"]' >> ~/.gitconfig
echo '    added = yellow' >> ~/.gitconfig
echo '    changed = green' >> ~/.gitconfig
echo '    untracked = cyan' >> ~/.gitconfig


echo '.DS_Store' > ~/.gitexcludes

