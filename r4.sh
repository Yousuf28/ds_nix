apt-get update
apt-get remove r-base-core -y


R_VERSION_MAJOR=4
R_VERSION_MINOR=3
R_VERSION_PATCH=1

CONFIGURE_OPTIONS="--with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
CRAN_MIRROR=$CRAN_MIRROR
apt-get update && apt-get install -y --no-install-recommends \
    apt-utils\
    gfortran \
    # git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    locales \
    openjdk-8-jdk \
    # screen \
    texinfo \
    # texlive \
    # texlive-fonts-extra \
    vim \
    wget \
    xvfb \
    tzdata \
    # sudo\
    # jq\
    curl\
    libgit2-dev \
    libmagick++-dev \
    make \
    tmux \
    python3-launchpadlib \
    python3.10-dev \
    python3.10-venv \
    python3-pip \
    lsof \
    && rm -rf /var/lib/apt/lists/*

wget https://cran.rstudio.com/src/base/R-${R_VERSION_MAJOR}/R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

tar zxvf R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

rm R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}.tar.gz

cd R-${R_VERSION_MAJOR}.${R_VERSION_MINOR}.${R_VERSION_PATCH}
./configure ${CONFIGURE_OPTIONS} && \
	make && \
	make install
