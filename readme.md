# Minecraft Infrastructure

Infrastructure Repostory for hosting a Minecraft Server at [hetzner.de](https://hetzner.de/cloud), used a combination of [Terraform](https://www.terraform.io), [Ansible](https://ansible.com) and [Vagrant](https://www.vagrantup.com).

[![Travis CI build status](https://travis-ci.org/nolte/minecraft-infrastructure.svg?branch=master)](https://travis-ci.org/nolte/minecraft-infrastructure) [![Chat on gitter.im](https://badges.gitter.im/noltes-minecraft-server/Lobby.svg)](https://gitter.im/noltes-minecraft-server/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![Chat on Discord](https://img.shields.io/discord/516299557412274209.svg)](https://discord.gg/tFZmkxW) [![Issues on GitHub](https://img.shields.io/github/issues/nolte/minecraft-infrastructure.svg)](https://github.com/nolte/minecraft-infrastructure/issues) [![Stars on GitHub](https://img.shields.io/github/stars/nolte/minecraft-infrastructure.svg?style=social&label=Star)](https://github.com/nolte/minecraft-infrastructure/stargazers/)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fnolte%2Fminecraft-infrastructure.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fnolte%2Fminecraft-infrastructure?ref=badge_shield)

## Motivation

We play Minecraft since many years, on the same world, mostly on the latest Spigot Version. Sometimes with more players, othertimes with not so many.
So we need a scalable environment with mininmal cost, at not used Time, lets go in the Cloud! ;).

## Features

* Install a ready to use Minecraft Server based on [nolte/ansible-minecraft](https://github.com/nolte/ansible-minecraft)
* Provide Different Stages
  * a Reuseable [Vagrant Box](https://www.vagrantup.com) with build with [Packer](https://www.packer.io).
  * a Local Test Environment, [Vagrant](https://www.vagrantup.com) based.
  * a Production Environment, controlled with [Terraform](https://www.terraform.io) and [Ansible](https://ansible.com), hosted at the [hetzner.de/cloud](https://hetzner.de/cloud)
* Handle different Type of Backup Solutions
    * [restic](https://restic.readthedocs.io), for [local](https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#local) or remote Backups to destinations like [minio-server](https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#minio-server), [amazon-s3](https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#amazon-s3) etc. _(Useable for Restore Servers)_
    * archive as tar, and optional downloading or publish to GDrive.
* Minimize the Environment, at not used time like the Summer, so minimize the costs to the storage part _(~0,90€/Mon)_.
* Combine different Ansible roles for os hardening, like (sshd, fail2ban, logrotate, restic) ([nolte/ansible_playbook-baseline-online-server](https://github.com/nolte/ansible_playbook-baseline-online-server)). 


## Usage

This Repository can be used to Provide your Server on two different Platforms Vagrant and Hetzner Cloud. For more information take al kook to the Documentation [nolte.github.io/minecraft-infrastructure](https://nolte.github.io/minecraft-infrastructure/index.html).

### Local (Vagrant)

For the Local usage you need a runnable Vagrant [Installation](https://www.vagrantup.com/docs/installation/).
The Local Vagrant part skip the [Terraform](https://www.terraform.io) installation tasks, like backup volumen handling etc. Only the Server Configuration Part ``provisioning/maintenance/master_playbook-configure-system.yml`` will executed, with the inventory ``provisioning/inventories/test``.

### Hetzner Cloud

As Cloud Provide for the Production we use [hetzner.de](https://hetzner.de/cloud), it exists a nice [RestAPI](https://docs.hetzner.cloud/), and a good [Terraform Provider](https://www.terraform.io/docs/providers/hcloud/index.html) for configure the Infrastructure, i love it ;).

## Advanced Informations

This Repository is part of the "Host your own Minecraft Server" Project, other parts of the project are [nolte/minecraft-gameserver](https://github.com/nolte/minecraft-gameserver) for public WebPresentation and [nolte/ansible-minecraft](https://github.com/nolte/ansible-minecraft) a Ansible Role for install and configure the Minecraft Server.

The reuseable Base is extracted to [nolte/ansible_playbook-baseline-online-server/](https://nolte.github.io/ansible_playbook-baseline-online-server/) and [nolte/terraform-infrastructure-modules](https://nolte.github.io/terraform-infrastructure-modules/).

Our Production Ansible Inventory is located add a private GitRepository, for protecting Player Informations.


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fnolte%2Fminecraft-infrastructure.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fnolte%2Fminecraft-infrastructure?ref=badge_large)
