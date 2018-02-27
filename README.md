# ClearOS 6 Vagrant box with Packer

**Current ClearOS Version Used**: 6.9

**Pre-built Vagrant Box**:

  - [`vagrant init edgej25/clearos`](https://app.vagrantup.com/edgej25/boxes/clearos)

This build configuration installs and configures ClearOS 6.9 x86_64 and generates a VirtualBox Vagrant box file.


## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)

## Usage

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

    $ packer build clearos6.json

After a few minutes, Packer should tell you the box was generated successfully.


## Testing built boxes

There's an included Vagrantfile that allows quick testing of the built Vagrant boxes. From this same directory, run one of the following commands after building the boxes:

    $ vagrant up

## License

MIT license.

## Author Information

Created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).
Modified for use with building ClearOS in 2018 by John Edge
