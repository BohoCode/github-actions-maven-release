#!/usr/bin/env bash
set -e

echo "MAVEN_LOCAL_REPO_PATH is $MAVEN_LOCAL_REPO_PATH"

echo "JAVA_HOME = $JAVA_HOME"
JAVA_HOME="/usr/local/openjdk-11/"
echo "M2_HOME is $M2_HOME"

# Setup maven local repo
if [[ -n "$MAVEN_LOCAL_REPO_PATH" ]]; then
     MAVEN_REPO_LOCAL="-Dmaven.repo.local=$MAVEN_LOCAL_REPO_PATH"
fi

echo "MAVEN_REPO_LOCAL is $MAVEN_REPO_LOCAL"
mvn help:evaluate -Dexpression=settings.localRepository | grep -v '\[INFO\]'
# Do the copyright verification
mvn $MAVEN_REPO_LOCAL -ntp $*
