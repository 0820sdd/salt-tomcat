jdk-install:
  file.managed:
    - name: /usr/local/src/jdk-8u40-linux-x64.gz
    - source: salt://jdk/files/jdk-8u40-linux-x64.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /usr/local/src && tar xf jdk-8u40-linux-x64.gz && mv jdk1.8.0_40 /usr/local/jdk && chown -R root:root /usr/local/jdk
    - unless: test -d /usr/local/jdk
    - require:
      - file: jdk-install

jdk-config:
  file.append:
    - name: /etc/profile
    - text:
      - export JAVA_HOME=/usr/local/jdk
      - export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
      - export CLASSPATH=.$CLASSPATH:$JAVA_HOME/lib/:$JAVA_HOME/jre/lib:$JAVA_HOME/lib/tools.jar

