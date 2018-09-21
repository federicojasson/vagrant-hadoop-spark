#COMMAND = ARGV[0]

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.box_version = '201808.24.0'

  config.vm.network :forwarded_port, guest: 8088, host: 8088
  config.vm.network :forwarded_port, guest: 50070, host: 50070

  config.vm.provision :file, source: 'files/core-site.xml', destination: '/tmp/core-site.xml'
  config.vm.provision :file, source: 'files/hdfs-site.xml', destination: '/tmp/hdfs-site.xml'
  config.vm.provision :file, source: 'files/mapred-site.xml', destination: '/tmp/mapred-site.xml'
  config.vm.provision :file, source: 'files/yarn-site.xml', destination: '/tmp/yarn-site.xml'

  config.vm.provision :shell, path: 'scripts/install-requirements.sh'
  config.vm.provision :shell, path: 'scripts/install-hadoop.sh'
  config.vm.provision :shell, path: 'scripts/install-spark.sh'
end
