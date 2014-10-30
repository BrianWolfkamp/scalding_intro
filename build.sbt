name := "scala-map-reduce"

version := "1.0"

scalaVersion := "2.10.0"

libraryDependencies ++= Seq(
  "com.twitter" %% "scalding-core" % "0.11.1",
  "org.apache.hadoop" % "hadoop-core" % "1.2.1" % "provided")

resolvers ++= Seq(
  "Local Maven Repository" at "file://"+Path.userHome.absolutePath+"/.m2/repository",
  "Conjars" at "http://conjars.org/repo",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots",
  "Cloudera CHH4 Maven Repository" at "https://repository.cloudera.com/artifactory/cloudera-repos/"
)