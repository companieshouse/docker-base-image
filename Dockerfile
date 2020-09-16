FROM centos:7

ARG plenv_root=/opt/plenv
ARG plenv_version=2.3.1
ARG plenv_perlbuild_version=1.31

ARG perl_version=5.18.2
ARG perl_build_args=-Dusethreads

# Install required packages

RUN yum -y install git patch make gcc \
    && yum clean all

# Install plenv

RUN mkdir -p ${plenv_root} \
    && git clone --branch ${plenv_version} https://github.com/tokuhirom/plenv.git ${plenv_root} \
    && git clone --branch ${plenv_perlbuild_version} https://github.com/tokuhirom/Perl-Build.git ${plenv_root}/plugins/perl-build
ENV PATH ${plenv_root}/bin:${plenv_root}/plugins/perl-build/bin:$PATH

# Install perl

RUN plenv install ${perl_version} ${perl_build_args} \
    && plenv global ${perl_version} \
    && plenv rehash

# Prepare application

WORKDIR /app

CMD [ "sh", "-c", "PERL5LIB=local/lib/perl5 plenv exec perl script/start_app daemon" ]

ONBUILD COPY . .
