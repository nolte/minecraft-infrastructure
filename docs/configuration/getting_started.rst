Getting Started
**************************************************

.. note::
  | For all steps (Development,starting the Server and executing tests) the User must accept the `Minecraft EULA <https://account.mojang.com/documents/minecraft_eula>`__, by own configured property!
  | by example setting a envierment property like ``export mc_accept_eula=true``


Local Usage
==================================================

For local Usage you can use the ``Vagrant`` file, located at the :ref:`ref-project-structure-provision-directory`.

.. code-block:: shell
   :caption: Start the Local Vagrant Machine
   :name: example-vagrant-start

    cd provisioning
    vagrant up

After successfull starting you can join the server at ``localhost:25567``

.. note::
    The original gameport will mapped in the Vagrant file from ``25565`` to ``25567``.

.. code-block:: shell
   :caption: connect the Local Vagrant Machine
   :name: example-vagrant-connect

      vagrant ssh


.. code-block:: shell
   :caption: reinit the Local Vagrant Machine
   :name: example-vagrant-recreate

      vagrant rsync && \
      vagrant provision



Advanced Environment Configuration
==================================================

For usage with :term:`Hetzner Cloud` you must prepare you system a little bit more.

.. code-block:: shell

    export HCLOUD_TOKEN=$(pass internet/hetzner.com/projects/minecraft/terraform-token)


.. _ref-getting-started-configure-ansible:

Configure Ansible
--------------------------------------------------

.. code-block:: shell
    :caption: configure ansible python Environment
    :name: example-setup-python-env

    virtualenv -p python3 ~/venvs/usage-ansible
    source ~/venvs/usage-ansible/bin/activate
    pip install -r requirementsDev.txt
    ansible-galaxy install -f -r maintenance/requirements.yml


You must set your used ``private_key_file`` and some SSH Extra args ``-o IdentitiesOnly=yes``, otherwise the :term:`fail2ban` process will block your IP!.

.. code-block:: ini
    :caption: example ansible.cfg
    :name: example-config-ansible-cfg

    [defaults]
    validate_certs=False
    private_key_file=~/.ssh/id_ed25519

    [ssh_connection]
    ssh_extra_args=-o IdentitiesOnly=yes


Configure your Local Secrets
--------------------------------------------------

Infrastructure as Code is a nice stuff but it is not a good idea to publish all stuff at github.

.. list-table:: Title
   :widths: 25 25 50
   :header-rows: 1

   * - Environment Variable
     - Default Pass Path
     - Description
   * - Row 1, column 1
     -
     - Row 1, column 3
   * - Row 2, column 1
     - Row 2, column 2
     - Row 2, column 3
