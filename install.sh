#!/bin/bash
set -e

sudo yum -y install git

#download and install scala
wget http://downloads.typesafe.com/scala/2.11.2/scala-2.11.2.tgz
tar -xvf scala-2.11.2.tgz
sudo mv scala-2.11.2 /usr/local/share/scala

#set path scala
echo '''SCALA_HOME=/usr/local/share/scala
PATH=$PATH:$SCALA_HOME/bin
export PATH''' >> $HOME/.bash_profile

#cleanup scala
rm -rf scala-*

#download and install sbt
wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.6/sbt-0.13.6.tgz
tar -xvf sbt-0.13.6.tgz
sudo mv sbt /usr/local/share/sbt

#set sbt
echo '''SBT_HOME=/usr/local/share/sbt
PATH=$PATH:$SBT_HOME/bin
export PATH''' >> $HOME/.bash_profile

#sbt cleanup
rm -rf sbt-*

source $HOME/.bash_profile

git clone https://github.com/twitter/scalding.git
cd scalding

sbt update
sbt package
sudo ln -s /home/cloudera/scalding/scripts/scald.rb /usr/local/bin/

#download movie scimilairities to ratings.tsv
wget http://files.grouplens.org/datasets/movielens/ml-100k/u.data -o ratings.tsv

