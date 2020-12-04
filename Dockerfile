FROM frolvlad/alpine-glibc

COPY texlive-profile.txt /tmp/

# set up packages
RUN apk add --no-cache wget perl xz bash && \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    install-tl-20*/install-tl --profile=/tmp/texlive-profile.txt && \
    rm -rf install-tl-*

ENV PATH=/usr/local/texlive/bin/x86_64-linuxmusl:$PATH

RUN tlmgr update --self

# base
RUN tlmgr install \
  collection-latexrecommended \
  latex \ 	
  latex-bin \
  ltxmisc 

# ADS PhD template
RUN tlmgr install \
  oberdiek \
  iftex \
  xcolor \
  kvoptions \
  etoolbox \
  showlabels \
  datatool \
  listings \
  framed \
  setspace \
  hyperref \
  geometry \
  graphics \
  crop \
  textpos \
  placeins \ 
  psnfss \
  microtype \
  tools \
  nomencl \
  glossaries \
  booktabs \
  sectsty \
  fancyhdr \
  tocloft \
  tracklang \
  mfirstuc \
  zref \
  needspace \
  natbib \
  subfiles \
  import \
  harvard \
  dpfloat \
  xstring
  
# fonts
RUN tlmgr install \
  cochineal \
  newtx \
  lato \
  latex-fonts \
  collection-fontsrecommended \
  collection-fontsextra 

# math and algo
RUN tlmgr install \
  mathtools \
  amsmath \
  amscls 

# languages
RUN tlmgr install \
  babel-english \
  babel-dutch

# graphical
RUN tlmgr install \
  pgf \
  pgfplots \
  mdframed
  
# other
RUN tlmgr install \
  preprint \
  float \
  caption
