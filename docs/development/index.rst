Development
==================================================

.. toctree::
   :maxdepth: 1
   :glob:

   tools
   directory_structure
   local_development



Naming Strategy
**************************************************


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


.. _ref-development-local-docs-generate:

Generate the Docs
**************************************************

For the Docs we use :term:`Sphinx` with the :term:`reStructuredText`. The simpleste way for generate, is using the :term:`tox` Build framework.

.. code-block:: shell
   :caption: Execute create Docs
   :name: cmd-development-local-docs-generat

    tox -e docs
