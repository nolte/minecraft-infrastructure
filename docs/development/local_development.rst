Local Development
**************************************************

For the Local develop process we use a combination of :term:`Molecule` and :term:`Vagrant` it is recommendet to manage the dependencies in a own :term:`Virtualenv`.


.. code-block:: shell
   :caption: Configure a virtual env
   :name: example-testing-molecule-virtualenv

    virtualenv -p python3 ~/venvs/develop-ansible_role-vagrant/
    source ~/venvs/develop-ansible_role-vagrant/bin/activate
    pip install requirementsDev.txt


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



Package a new Vagrant Box
==============================


.. code-block:: shell
   :caption: build a reuseable box with packer
   :name: example-package-vagrant-box

   packer build minecraft_box.json


.. code-block:: shell
   :caption: Import the Box
   :name: example-vagrant-import-box

    vagrant box add mc-gameserver-spigot file:///$(pwd)/output-vagrant/package.box --force