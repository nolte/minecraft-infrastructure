Development
**************************************************

.. toctree::
   :maxdepth: 1
   :glob:

   tools
   local_development


Project Structure
==================================================

This Git Repository is Structured in different folders, the :ref:`ref-project-structure-documentation-directory` and the :ref:`ref-project-structure-provision-directory` with the Infrastructure Providing Code.


.. _ref-project-structure-documentation-directory:

Documentation Directory
---------------------------------------------------

The :term:`Sphinx` Documentation is located at the ``docs`` subdirectory.

.. _ref-project-structure-provision-directory:

Provision Directory
---------------------------------------------------

The Scripts for configure the :ref:`ref-architecture-env-local-test` and :ref:`ref-architecture-env-public` are structured under ``provisioning``.

.. _ref-project-structure-provision-infrastructure-directory:

Infrastructure Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/infrastructure``

.. _ref-project-structure-provision-maintenance-directory:

Maintenance Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/maintenance``


Maintenance Test Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/maintenance-test``


.. _ref-project-structure-provision-inventories-directory:

Inventories Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``provisioning/inventories``

Plugindata
"""""""""""""""""""""""""""""""""""""""""""""""""""

``provisioning/inventories/pluginconfigs``

Test Inventory
"""""""""""""""""""""""""""""""""""""""""""""""""""

The Inventory Structure under ``provisioning/inventories/test``, will be used for creating the :term:`Vagrant` box. 

Prod Inventory
"""""""""""""""""""""""""""""""""""""""""""""""""""

``provisioning/inventories/prod``


Naming Strategy
==================================================


.. list-table:: naming patterns
   :widths: 25 15 60
   :header-rows: 1

   * - Naming
     - Example
     - description
   * - ``playbook-{title}.yml``
     - ``playbook-execute-backup.yml``
     - Name of Classic Playbooks
   * - ``master_playbook-{title}.yml``
     - ``master_playbook-mc-server.yml``
     - Name of :term:`Ansile Master Playbooks`
