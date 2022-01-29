Getting Started
**************************************************

.. note::
  | For all steps (Development,starting the Server and executing tests) the User must accept the `Minecraft EULA <https://account.mojang.com/documents/minecraft_eula>`__, by own configured property!
  | by example setting a envierment property like ``export mc_accept_eula=true``

For A Better Python Depenendency Mananagement it is recommended to configure a own :term:`Virtualenv`.

.. code-block:: shell
   :caption: Configure Python Virtual Env
   :name: example-virtual-env

    virtualenv -p python3 ~/venvs/ansible-vagrant
    source ~/venvs/ansible-vagrant/bin/activate
    pip install -r requirements.txt
    pre-commit install

.. _ref-getting-started-preconditions:

Preconditions
==================================================

For a full configuration you need some "Commons Scripts" from other Repositories, for example the `nolte/ansible_playbook-baseline-online-server <https://github.com/nolte/ansible_playbook-baseline-online-server.git>`_ Project.
The Dependencies will be managed by :term:`vendir` and can be installed with the ``overlay`` command.

.. code-block:: shell
   :caption: Install required Dependencies
   :name: example-vagrant-start

    vendir sync


The Configuration file for the Dependencies is the ``vendir.yml``.

.. literalinclude:: ../../vendir.yml
   :language: yaml


.. _ref-getting-started-environment-local:

Local Environment
==================================================

For local Usage you can use the ``Vagrant`` file, located at the :ref:`ref-project-structure-provision-maintenance-directory`.

.. code-block:: shell
   :caption: Start the Local Vagrant Machine
   :name: example-vagrant-start

    cd local
    vagrant up

The Vagrant Box are configured with a minimal set of features, from the :ref:`ref-project-structure-provision-inventories-test-directory`.
After successfull starting you can join the server at ``localhost:25567``

.. note::
    The original gameport will mapped in the Vagrant file from ``25565`` to ``25567``.

**Usefull Commands**

* ``vagrant ssh`` (SSH Connect to the Local Vagrant Box)
* ``vagrant provision`` (Reexecute the Installation Steps)
* ``vagrant global-status``
* ``vagrant ssh-config``

.. _ref-getting-started-environment-public:

Public Environment
==================================================

The Public Env will be hosted at :term:`Hetzner Cloud`. For Rollout the public environment, you must execute the :term:`Terraform` and the :term:`Ansible` sources.

.. code-block:: shell
   :caption: Required Environment Variables
   :name: example-cmd-configure-env-vars

    export PASSWORD_STORE_DIR=~/.password-store && \
      export HCLOUD_TOKEN_STORAGE_PROJECT=$(pass internet/hetzner.com/projects/personal_storage/token) && \
      export HCLOUD_TOKEN=$(pass internet/hetzner.com/projects/minecraft/terraform-token) && \
      export AWS_ACCESS_KEY_ID=$(pass internet/project/mystoragebox/minio_access_key) && \
      export AWS_SECRET_ACCESS_KEY=$(pass internet/project/mystoragebox/minio_secret_key) && \
      export AWS_S3_ENDPOINT=https://$(curl -s -H "Authorization: Bearer $HCLOUD_TOKEN_STORAGE_PROJECT" 'https://api.hetzner.cloud/v1/servers?name=storagenode' | jq -r '.servers[0].public_net.ipv4.dns_ptr')


.. _ref-getting-started-environment-public-infrastructure:

Infrastructure
---------------------------------------------------

For the Terraform State File, we use a Self Hosted Remote S3 Bucket, :term:`Personal Storage`.

.. _ref-getting-started-environment-public-infrastructure-longterm:

Long Term Elements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :ref:`ref-project-structure-provision-infrastructure-long-term-directory`, are Ressources like SSH Key, or the Backup Volume. Keep this Part from the Infrastructure, for restore some backup costs *~1€/mon*.

.. warning::
    Be carefull with ``terraform destroy``, you will be lost all your :term:`restic` Backups!

The Ressources from ``provisioning/infrastructure/longterm`` will be handled in a seperated Terraform State File.


.. _ref-getting-started-environment-public-infrastructure-computing:

Computing Elements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The :ref:`ref-project-structure-provision-infrastructure-computing-directory`, are Ressources like Attatch Volume and Create the Server.

.. note::
    Do ``terraform destroy``, to save money *(~5,83€/mon)*, or when the Server makes Problems! You can use the Last Backup from the :ref:`ref-project-structure-provision-infrastructure-long-term-directory` for restoring, look :ref:`ref-maintenance-jobs-backup-task-restore-on-create`.
    So it makes fun to destroy the Ressources from ``provisioning/infrastructure/computing``.


Configure the Server
---------------------------------------------------

For this we use the :term:`Ansible` Playbooks from the :ref:`ref-project-structure-provision-maintenance-directory` and the dependencies from the :ref:`ref-getting-started-preconditions`.

.. code-block:: shell
   :caption: Install Ansible Galaxy Dependencies
   :name: example-getting-started-maintenance-ansible-roles

   ansible-galaxy install -r provisioning/ext_debs/ansible_playbook-baseline-online-server/requirements.yml && \
    ansible-galaxy install -r provisioning/maintenance/requirements.yml

When you use a external Inventory Folder, define the Environment Variable: ``export ANSIBLE_INVENTORY=$(pwd)/storagebox/prod/``, now you can execute the Master Playbook:

.. code-block:: shell
   :caption: Execute the full Installation
   :name: example-getting-started-maintenance-master-playbook

    ansible-playbook provisioning/maintenance/master-configure-system.yml

After the successfull configuration execute the :ref:`example-cmd-maintenance-testing`.
