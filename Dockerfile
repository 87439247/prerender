FROM centos:7

MAINTAINER 87439247@qq.com

USER root

EXPOSE 3000

COPY google-chrome.repo /etc/yum.repos.d/

RUN yum -y install google-chrome-stable --nogpgcheck

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -

RUN yum install -y nodejs

RUN mkdir -p /opt/prerender

WORKDIR /opt/prerender
#
COPY package.json /opt/prerender/

RUN npm install

COPY . /opt/prerender/
##
RUN chmod +x /opt/prerender/entry.sh

RUN yum install -y mkfontscale

RUN wget http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm && yum install -y nux-dextop-release-0-5.el7.nux.noarch.rpm

RUN yum -y update

RUN yum install -y freetype-infinality

#RUN ln -s /etc/fonts/infinality/conf.d /etc/fonts/infinality/styles.conf.avail/osx

CMD /opt/prerender/entry.sh