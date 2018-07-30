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
##
#COPY ./*.TTC /usr/share/fonts/myfonts/

CMD /opt/prerender/entry.sh