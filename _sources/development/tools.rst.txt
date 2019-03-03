Tools
========================================

For Handle the Environment we use different OpenSource Tools, :term:`Terraform` and :term:`Ansible` for provisioning and configuration.

.. list-table:: used projects
   :widths: 25 15 60
   :header-rows: 1

   * - Projekte
     - Type
     - description
   * - `nolte/ansible-minecraft <https://github.com/nolte/ansible-minecraft>`_
     - *Ansible Role*
     - Controll the Server
   * - `nolte/ansible-minecraft-region-fixer <https://github.com/nolte/ansible-minecraft-region-fixer>`_
     - *Ansible Role*
     - für den :term:`Minecraft Region Fixer`
   * - `itzg/rcon-cli <https://github.com/itzg/rcon-cli>`_
     - *commandline tool*
     - Go :term:`RCon` Commandline Interface
   * - `dev-sec/ansible-os-hardening <https://github.com/dev-sec/ansible-os-hardening>`_
     - *Ansible Role*
     - Harder the OS, set file permissions.
   * - `ypsman/ansible-sshd-config <https://github.com/ypsman/ansible-sshd-config>`_
     - *Ansible Role*
     - Harder the SSH Service, disable password login etc.
   * - `geerlingguy.java <https://github.com/geerlingguy/ansible-role-java>`_
     - *Ansible Role*
     - Used for install a :term:`Open JDK`
   * - `robertdebock.bootstrap <https://github.com/robertdebock/ansible-role-bootstrap>`_
     - *Ansible Role*
     -
   * - `robertdebock.epel <https://github.com/robertdebock/ansible-role-epel>`_
     - *Ansible Role*
     - used for activate the :term:`Extra Packages for Enterprise Linux` repository
   * - `robertdebock.fail2ban <https://github.com/robertdebock/ansible-role-fail2ban>`_
     - *Ansible Role*
     - used for configure :term:`fail2ban`
   * - `paulfantom.restic <https://github.com/paulfantom/ansible-restic>`_
     - *Ansible Role*
     - used for configure the :term:`restic` backups
   * - `arillso.logrotate <https://github.com/arillso/ansible.logrotate>`_
     - *Ansible Role*
     - used for handle the :term:`logrotate` configuration
   * - `passwordstore <https://www.passwordstore.org/>`_
     - *commandline tool*
     - :term:`pass` is a Commandline Passwordstore
   * - `camptocamp/terraform-provider-pass <https://github.com/camptocamp/terraform-provider-pass>`_
     - *Terraform Provider*
     - Used for :term:`pass` secret lookups.
   * - `fboender/ansible-cmdb <https://github.com/fboender/ansible-cmdb>`_
     - *Ansible Extention*
     - Generate a Simple system Overview, see: :ref:`ref-maintenance-process-cmdb`
