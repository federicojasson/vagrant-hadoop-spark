# Hadoop + Spark - Vagrant Box

Vagrant box containing Hadoop and Spark ecosystem packages.


## Packages

- Hadoop 2.8.4
- Spark 2.3.1


## Usage


Usage with Vagrant:
```
Vagrant.configure("2") do |config|
  config.vm.box = "federicojasson/hadoop-spark"
  config.vm.box_version = "2018.09.20.1"
end
```

Or you can quickly spin up an instance by running:
```
mkdir -p hadoop-spark && cd hadoop-spark
vagrant init --box-version '2018.09.20.1' federicojasson/hadoop-spark
vagrant up && vagrant ssh
```


## Releases

Releases of this box are hosted in the [Vagrant Cloud](https://app.vagrantup.com/federicojasson/boxes/hadoop-spark).
