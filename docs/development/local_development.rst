.. _ref-development-local:

Local Development
**************************************************

For the Local develop process we use a combination of :term:`Molecule` and :term:`Vagrant` it is recommendet to manage the dependencies in a own :term:`Virtualenv`.


.. code-block:: shell
   :caption: Configure a virtual env
   :name: example-testing-molecule-virtualenv

    virtualenv -p python3 ~/venvs/develop-ansible_role-vagrant/
    source ~/venvs/develop-ansible_role-vagrant/bin/activate
    pip install requirementsDev.txt

.. _ref-development-local-vagrant-box:

Starting a local Vagrant Box
==============================

:term:`Molecule` handle the :term:`Vagrant` box and execute the :term:`Ansible` playbooks.

.. code-block:: shell
   :caption: Execute a full Tests Cycle
   :name: example-testing-molecule-test

   molecule test


for reexecuting the playbook use the ``converge`` command.

.. code-block:: shell
   :caption: Starting a and configure a Vagrant Box
   :name: example-testing-molecule-converge

   molecule converge

.. _ref-development-local-vagrant-box-packer:

Package a new Vagrant Box
==============================

For creating new :term:`Vagrant` box Versions we use :term:`Packer`.
Navigate to the :ref:`ref-project-structure-provision-maintenance-build-directory` (``provisioning/maintenance/build``) for packaging a new box.

.. code-block:: shell
   :caption: build a reuseable box with packer
   :name: example-package-vagrant-box

   packer build minecraft_box.json

this will be need some minutes, but you got a reuseable and shareable :term:`Vagrant` box, with a preconfigured ready to used Server.

.. code-block:: shell
   :caption: Import the Box
   :name: example-vagrant-import-box

    vagrant box add mc-gameserver-spigot file:///$(pwd)/output-vagrant/package.box --force


know when you have imported the new box Version, got to the :ref:`ref-project-structure-provision-maintenance-directory` (``provisioning/maintenance``) Directory and create the Virtual Machine.


.. code-block:: shell
   :caption: Import the Box
   :name: example-vagrant-import-box

    vagrant up


.. code-block:: shell
   :caption: Ping the Box
   :name: example-vagrant-ping


   export ANSIBLE_INVENTORY=$(pwd)/inventories/test/
   ansible all -m ping
