FROM debian:jessie

MAINTAINER Hossam Hammady <github@hammady.net>

RUN apt-get update -qq && \
    apt-get install -y \
      texlive-latex-recommended texlive-latex-extra && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD output/comp/*.png /app/
ADD quran.tex /app/
ADD genpages.tex.sh /app/
ADD page.tex /app/
ADD partheader.tex /app/

CMD ./genpages.tex.sh > pages.tex && \
    pdflatex quran.tex && pdflatex quran.tex && \
    cp quran.pdf /output/
