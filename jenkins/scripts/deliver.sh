#!/usr/bin/env bash
export JAVA_HOME='/Library/Java/Home'
export M2_HOME='/Volumes/Karthik/Devops/softwares/apache-maven-3.6.3'
export M2='$M2_HOME/bin'
set -x
/Volumes/Karthik/Devops/softwares/apache-maven-3.6.3/bin/mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`/Volumes/Karthik/Devops/softwares/apache-maven-3.6.3/bin/mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`/Volumes/Karthik/Devops/softwares/apache-maven-3.6.3/bin/mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
java -jar target/${NAME}-${VERSION}.jar
