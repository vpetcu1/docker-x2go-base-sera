#@echo off

export BASE_PATH="/work/ABATech20"

echo $BASE_PATH

export JAVA_HOME=/work/ABATech20/tools/Java/java-8-openjdk-amd64
export TOOL_PATH=$BASE_PATH/tools
export ECLIPSE_HOME=$TOOL_PATH/eclipse
export GLASSFISH_HOME=$TOOL_PATH/payara
#export ECLIPSE_WORKSPACE=$BASE_PATH/workspace
export M2_HOME=$TOOL_PATH/apache-maven
export M2_REPO=$BASE_PATH/.m2/repository
export PATH=$M2_HOME/bin:$PATH
export MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"
export REBEL_BASE=$HOME/sera/.jrebel

$ECLIPSE_HOME/eclipse -clean -data $HOME/sera/eclipse-workspace
