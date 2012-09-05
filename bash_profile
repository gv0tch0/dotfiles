#---------
# funcs
#---------

# emits '-' if the pwd is untracked, otherwise nothing
function git_pwd_is_tracked {
  [ $(git log -1 --pretty=oneline . 2> /dev/null | wc -l) -eq "1" ] || echo "---"
}

# Emits `*' if the current repository is `dirty' (untracked files or uncommited changes in the index)
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

# Emits the name of the current git branch or `---' if the pwd is untracked
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/($(git_pwd_is_tracked)\1$(parse_git_dirty))/"
}

#---------
# Env
#---------
export CVS_RSH=ssh
export CVSROOT=:ext:nkolev@cvs.hmsonline.com:/home/cvs
export PS1='[\[\033[1;34m\]\u@\h\[\033[0m\] \[\033[0;32m\]\w\[\033[0m\] \[\033[0;31m\]$(parse_git_branch)\[\033[0m\]]$ '
export PAGER=less
export EDITOR=vim
export SVN_EDITOR=vim
export GEMS_BIN=/usr/local/Cellar/ruby/1.9.2-p0/bin
export APACHE_HOME=/usr/local/apache2
export MVN_HOME=/usr/local/mvn
export MAVEN_HOME=/usr/local/maven
export MAVEN_OPTS="-Xms1024m -Xmx2048m -XX:MaxPermSize=384m -XX:+UseCompressedOops"
export ANT_HOME=/usr/local/ant
export CVS_RSH=ssh
#export MANPATH=${MANPATH}:/usr/local/man
export CLICOLOR=1
export ECLIPSE_HOME=/usr/local/eclipse
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
export UMLET_HOME=/usr/local/umlet
export NODE_PATH=/usr/local/lib/node_modules:${NODE_PATH}
export PATH=/usr/local/share/python:/usr/local/sbin:/usr/local/bin:${RVM_HOME}/bin:${ECLIPSE_HOME}:${GEMS_BIN}:${APACHE_HOME}/bin:${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${MVN_HOME}/bin:${ANT_HOME}/bin:${UMLET_HOME}:${PATH}

#----------
# Sourcing
#----------
source /usr/local/src/resty/resty

#---------
# Aliases
#---------
alias tidy='tidy -xml -qi -wrap 9999 2>/dev/null'
alias orange="xterm -bg black -fg orange -sb -sl 10000 -T orange &"
alias yellow="xterm -bg black -fg yellow -sb -sl 10000 -T yellow &"
alias red="xterm -bg black -fg red -sb -sl 10000 -T red &"
alias green="xterm -bg black -fg green -sb -sl 10000 -T green &"
alias blue="xterm -bg black -fg lightblue -sb -sl 10000 -T blue &"
alias pink="xterm -bg black -fg pink -sb -sl 10000 -T pink &"
alias purple="xterm -bg black -fg purple -sb -sl 10000 -T purple &"
alias white="xterm -bg black -fg white -sb -sl 10000 -T white &"
alias black="xterm -bg white -fg black -sb -sl 10000 -T black &"
alias eclipse="eclipse > /dev/null 2>&1 &"
alias cet="mvn -o -P test -DdownloadSources=true -DdownloadJavadocs=true eclipse:clean eclipse:eclipse"
alias cb="echo \"running 'mvn -o clean install'\"; mvn -o clean install"
alias cbont="echo \"running 'mvn -D maven.test.skip=true clean install'\"; mvn -D maven.test.skip=true clean install"
alias cbnt="echo \"running 'mvn -o -D maven.test.skip=true clean install'\"; mvn -o -D maven.test.skip=true clean install"
alias cbo="echo \"running 'mvn clean install'\"; mvn clean install"
alias cbd="echo \"running 'mvn -o clean install ear-deployer:deploy-ear'\"; mvn -o clean install ear-deployer:deploy-ear"
alias cbdo="echo \"running 'mvn clean install ear-deployer:deploy-ear'\"; mvn clean install ear-deployer:deploy-ear"
alias cbf="echo \"running 'mvn -o -P functests clean install ear-deployer:deploy-ear'\"; mvn -o -P functests clean install ear-deployer:deploy-ear"
alias cbfo="echo \"running 'mvn -P functests clean install ear-deployer:deploy-ear'\"; mvn -P functests clean install ear-deployer:deploy-ear"
alias clc="echo \"running 'mvn -o -P functests clean compiler:compile compiler:testCompile'\"; mvn -o -P functests clean compiler:compile compiler:testCompile"
alias curl="curl -u boomidev:p -w '\nrepsonse-code=%{http_code}\n'"
alias start_mysql='cd /usr/local/Cellar/mysql/5.5.15 && /usr/local/Cellar/mysql/5.5.15/bin/mysqld_safe &'
alias stop_mysql='kill `cat /usr/local/var/mysql/drunkard.*.pid`'
