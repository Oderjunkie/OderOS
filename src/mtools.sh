git clone https://github.com/jncronin/mkgpt.git
cd mkgpt
automake --add-missing
autoreconf
./configure
make
make install
