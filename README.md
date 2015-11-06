## Vagrant Base Boxes

This repo contains Packer templates to build Vagrant Boxes

The naming convention for a box and its Packer template is a important.
```
<distro>-<distro version>-<arch>-[desktop]-[<vm.provider>]-[<provisioner>]
```

## Usage

To be able to build Vagrant boxes from this repo you need the following software:

1.  VirtualBox - http://www.virtualbox.org/
1.  Vagrant - http://www.vagrantup.com/
1.  Packer - http://www.packer.io

To build a Vagrant box with Centos 7 64-bit with VirtualBox and Puppet.
```sh
cd centos-7
./build.sh ./centos-7-x86_64-vbox-puppet.json
```

When the build is done you probably want to test it in Vagrant.  

1.  Import the Vagrant box.  
    ```sh
    vagrant box add builds/centos-7-x86_64-vbox-puppet-v20151106.box  --name centos-7-x86_64-vbox-puppet --force
    ```

1.  Create a Vagrant project.  
    ```sh
    vagrant init centos-7-x86_64-vbox-puppet
    ```

1.  Boot up the Vagrant box.  
    ```sh
    vagrant up
    ```

1.  Login and inspect the box  
    ```sh
    vagrant ssh
    ```

## Contributors

All contributions are greatly appreciated and welcome! Do you have a feature request, bug report, or patch? Great! See [contributing](CONTRIBUTING.md) for information on what you can do about that. All your hard work must be donated under the same license as this project.


## License

This project is licensed under the terms of the [Apache License, Version 2.0](LICENSE).
