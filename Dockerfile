FROM centos:7

MAINTAINER Bharat Goyal <bgoyalsapient.com>
RUN yum install -y java;yum clean all

RUN mkdir /home/jmeter
ADD apache-jmeter-3.0.rar /home/jmeter/
ADD CI_Unilever.jmx /home/jmeter/CI_Unilever.jmx

CMD cd /home/jmeter; tar -xzf /home/jmeter/apache-jmeter-3.0.rar
ADD jmeter.properties /home/jmeter/apache-jmeter-3.0/bin/
CMD /home/jmeter/apache-jmeter-3.0/bin/jmeter.sh -n -t /home/jmeter/CI_Unilever.jmx -l /home/jmeter/CI_Unilever_Results.jtl -JTEST_DURATION=$TEST_DURATION -JREPORT_DIR_PATH=./reports/ -q /home/jmeter/apache-jmeter-3.0/bin/jmeter.properties
