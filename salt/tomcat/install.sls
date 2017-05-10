include:
  - jdk.install

tomcat-install:
  file.managed:
    - name: /usr/local/src/apache-tomcat-8.0.41.tar.gz
    - source: salt://tomcat/files/apache-tomcat-8.0.41.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar zxf apache-tomcat-8.0.41.tar.gz && mv apache-tomcat-8.0.41 /usr/local/tomcat && chown -R root:root /usr/local/tomcat
    - unless: test -d /usr/local/tomcat
    - require:
      - file: tomcat-install

tomcat-config:
  file.append:
    - name: /etc/profile
    - text:
      - export TOMCAT_HOME=/usr/local/tomcat
