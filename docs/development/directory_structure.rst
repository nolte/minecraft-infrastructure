Directory Structure
==================================================

This Git Repository is Structured in different folders, the :ref:`ref-project-structure-documentation-directory` and the :ref:`ref-project-structure-provision-directory` with the Infrastructure Providing Code.

.. toctree::
   :maxdepth: 6

   project_structure


.. _ref-project-structure-documentation-directory:

Documentation Directory
---------------------------------------------------

The :term:`Sphinx` Documentation is located at the ``docs`` subdirectory.

.. _ref-project-structure-local-directory:

Local Directory
---------------------------------------------------

Working Directory for local Vagrant Box, more information at :ref:`ref-getting-started-environment-local`.

.. _ref-project-structure-provision-directory:

Provision Directory
---------------------------------------------------

The Scripts for configure the :ref:`ref-architecture-env-local-test` and :ref:`ref-architecture-env-public` are structured under ``provisioning``.

.. _ref-project-structure-provision-infrastructure-directory:

Infrastructure Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/infrastructure``


.. _ref-project-structure-provision-infrastructure-long-term-directory:

Long Term Infrastructure Elements
____________________________________________________

``provisioning/infrastructure/longterm``

.. _ref-project-structure-provision-infrastructure-computing-directory:


Computing Infrastructure Elements
____________________________________________________

``provisioning/infrastructure/computing``


.. _ref-project-structure-provision-maintenance-directory:


Maintenance Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/maintenance``


.. _ref-project-structure-provision-maintenance-build-directory:

Maintenance Build Directory
____________________________________________________

``provisioning/maintenance/build``


Maintenance Test Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/maintenance-test``


.. _ref-project-structure-provision-inventories-directory:

Inventories Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/inventories``

Plugindata
____________________________________________________

``provisioning/inventories/pluginconfigs``


.. _ref-project-structure-provision-inventories-test-directory:

Test Inventory
____________________________________________________

The Inventory Structure under ``provisioning/inventories/test``, will be used for creating the :term:`Vagrant` box.

.. literalinclude:: ../../provisioning/inventories/test/group_vars/minecraftgameserver.yml
   :caption: Test Infrastructure Server Config
   :name: config-inventory-test-minecraftgameserver


Prod Inventory
____________________________________________________

Not a Part of this Repostiory, moved to an private GithHub Project.
