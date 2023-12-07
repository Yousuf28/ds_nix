#apt-get remove r-base-core -y

apt-get update && apt-get install -y --no-install-recommends \
	libxml2-dev

R_VERSION_MAJOR=4
R_VERSION_MINOR=3
R_VERSION_PATCH=1

wget https://cran.rstudio.com/src/base/R-${R_VERSION_MAJOR}/R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

tar zxvf R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

rm R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

cd R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}
./configure --with-x=no && \
	make && \
	make install

Rscript -e "install.packages('xml2', repos = c('https://r-lib.r-universe.dev', 'https://cloud.r-project.org'))"
Rscript -e "install.packages('languageserver', repos = c('https://reditorsupport.r-universe.dev', 'https://cloud.r-project.org'))"
