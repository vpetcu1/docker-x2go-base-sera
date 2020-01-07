# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export SERA_SOFTWARE_BASE_PATH="/work/ABATech20"

export TOOL_PATH=$SERA_SOFTWARE_BASE_PATH/tools
export ECLIPSE_HOME=$TOOL_PATH/eclipse
export GLASSFISH_HOME=$TOOL_PATH/glassfish3
export ECLIPSE_WORKSPACE=$HOME/sera/eclipse-workspace
export M2_HOME=$TOOL_PATH/apache-maven
export M2_REPO=$SERA_SOFTWARE_BASE_PATH/.m2/repository
export PATH=$M2_HOME/bin:$SERA_SOFTWARE_BASE_PATH/bin:$PATH
export MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true"
