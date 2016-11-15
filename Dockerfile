FROM centos:7

MAINTAINER Mukul Sharma <mukulsapient.com>

RUN yum update -y
RUN yum install -y wget
RUN yum install -y java
RUN yum clean all

RUN mkdir /home/jmeter
RUN cd /home/jmeter/

RUN wget http://apache-mirror.rbc.ru/pub/apache/jmeter/binaries/apache-jmeter-3.0.tgz

RUN tar -xzf apache-jmeter-3.0.tgz
RUN rm -rf apache-jmeter-3.0.tgz

ADD CI_Unilever.jmx /home/jmeter/CI_Unilever.jmx

EXPOSE 1099

CMD /apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/CI_Unilever.jmx -l /home/jmeter/CI_Unilever_Result.csv
