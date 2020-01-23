FROM debian:buster
MAINTAINER Alexis BIZON
LABEL	name="imta_latex" \
	version="v2.0"

ENV	OUTPUT_PDF_FILENAME=out.pdf \
	ENTRYPOINT_LATEX_FILE=in.tex \
	DEBIAN_FRONTEND=noninteractive

RUN     apt-get -y update

RUN     apt-get -y install python && \
        apt-get -y install python-pygments && \
	apt-get -y install python3-pygments

RUN	apt-get -y install texlive-latex-base && \
	apt-get -y install texlive-lang-all && \
	apt-get -y install texlive-full && \
	apt-get -y install texlive-latex-extra && \
	apt-get -y install cmake && \
	apt-get -y install make

RUN	mkdir /latex

COPY	imta/* /latex/
COPY	dependencies/* /latex/
COPY	entrypoint.sh /

VOLUME	["/latex/user_content"]

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
