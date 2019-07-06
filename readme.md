# Minecraft Infrastructure

Infrastructure Repostory for hosting a Minecraft Server at [hetzner.de](https://hetzner.de/cloud), used a combination of [Terraform](https://www.terraform.io), [Ansible](https://ansible.com) and [Vagrant](https://www.vagrantup.com).

[![Travis CI build status](https://travis-ci.org/nolte/minecraft-infrastructure.svg?branch=master)](https://travis-ci.org/nolte/minecraft-infrastructure) [![Chat on gitter.im](https://badges.gitter.im/noltes-minecraft-server/Lobby.svg)](https://gitter.im/noltes-minecraft-server/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![Chat on Discord](https://img.shields.io/discord/516299557412274209.svg)](https://discord.gg/tFZmkxW) [![Issues on GitHub](https://img.shields.io/github/issues/nolte/minecraft-infrastructure.svg)](https://github.com/nolte/minecraft-infrastructure/issues) [![Stars on GitHub](https://img.shields.io/github/stars/nolte/minecraft-infrastructure.svg?style=social&label=Star&maxAge=2592000)](https://github.com/nolte/minecraft-infrastructure/stargazers/)

## Montivation

We play Minecraft since many years, on the same world, mostly on the latest Spigot Version. Sometimes with more players, othertimes with not so many.
So we need a scalable environment with mininmal cost, at not used Time, lets go in the Cloud! ;).

## Features

* Provide Different Stages
  * a Local Test Environment, [Vagrant](https://www.vagrantup.com) based.
  * a Production Environment, controlled with [Terraform](https://www.terraform.io) and [Ansible](https://ansible.com), hosted at the [hetzner.de/cloud](https://hetzner.de/cloud)
* Reacreate the Server from existing Cold Storage like [Hetzner Volume](https://www.hetzner.com/cloud#features) or [backblaze Bucket](http://backblaze.com).
  * Minimize the Environment, at not used time like the Summer, so minimize the costs to the storage part.
* Combine different Ansible roles for os hardening, like (sshd, fail2ban, logrotate, restic).
* Install a ready to use Minecraft Server based on [nolte/ansible-minecraft](https://github.com/nolte/ansible-minecraft)

## Usage

For configuration we use a [Ansible Inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html) structure.

### Local (Vagrant)

For the Local usage you need a runnable Vagrant [Installation](https://www.vagrantup.com/docs/installation/).
The Local Vagrant part skip the [Terraform](https://www.terraform.io) installation tasks, like backup volumen handling etc. Only the Server Configuration Part ``provisioning/maintenance/master_playbook-mc-server.yml`` will executed, with the inventory ``provisioning/inventories/test``.

### Hetzner Cloud

As Provide for the Production we use [hetzner.de](https://hetzner.de/cloud), it exists a nice [RestAPI](https://docs.hetzner.cloud/), and a good [Terraform Provider](https://www.terraform.io/docs/providers/hcloud/index.html) for configure the Infrastructure, i love it ;).

## Advanced Informations

This Repository is part of the "Host your own Minecraft Server" Project, other parts of the project are [nolte/minecraft-gameserver](https://github.com/nolte/minecraft-gameserver) for public WebPresentation and [nolte/ansible-minecraft](https://github.com/nolte/ansible-minecraft) a Ansible Role for install and configure the Minecraft Server.
