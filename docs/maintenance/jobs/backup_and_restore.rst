.. _ref-maintenance-jobs-backup:

Backub and Restore
=========================================================

We splitting the Backup in two different parts, the :ref:`ref-maintenance-jobs-backup-worlddata` and the :ref:`ref-maintenance-jobs-backup-plugindata`. The Structure configuration is located at ``/provisioning/vars/facts_mc_node.yml``.

.. literalinclude:: ../../../provisioning/vars/facts_mc_node.yml
   :caption: Static Backup Config
   :name: config-backup-static-structure

You will find the implementation at a **ugly** but **functional** Ansible Role, located at ``provisioning/maintenance/roles/backup``.

.. _ref-maintenance-jobs-backup-worlddata:


World Data Backups
----------------------------------------------------------


.. _ref-maintenance-jobs-backup-plugindata:

Plugins Data Backups
----------------------------------------------------------


.. _ref-maintenance-jobs-backup-task:

Working with Backups
----------------------------------------------------------

.. _ref-maintenance-jobs-backup-task-daily:


Daily Backups
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. literalinclude:: ../../../provisioning/maintenance/roles/backup/templates/minecraft_backup_script.sh.j2
   :language: bash


You can controll the the Jobs by define Variabels at the Inventory:

.. code-block:: yaml
   :caption: Configure Backup Jobs
   :name: config-backup-daily

    backup_dests:
      - "s3"
      - "local"
    backup_parts:
      - "plugins"
      - "worlddata"


.. _ref-maintenance-jobs-backup-task-adhoc:

Adhoc Backups
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can execute :ref:`ref-maintenance-jobs-backup-task-adhoc-restic` when you destroying the :ref:`ref-getting-started-environment-public-infrastructure-computing`, and will be safe that all gamedata saved!
Or You can use the :ref:`ref-maintenance-jobs-backup-task-adhoc-archive` function to share your Server over GDrive, or a local archive. For executing be ensure that you have set the :ref:`example-cmd-configure-env-vars`.


.. _ref-maintenance-jobs-backup-task-adhoc-restic:

Adhoc Restic Backup
*********************************************************

The :ref:`ref-maintenance-jobs-backup-task-adhoc-restic` are usefull for store the current state before you change any configruations.

.. code-block:: yaml
   :caption: Start Restic Adhoc Backup
   :name: cmd-backup-task-adhoc-restic

   ansible-playbook maintenance/playbook-execute-backup.yml --extra-vars '{"backup_dests":["s3","local"]}' --extra-vars '{"backup_parts":["plugins","worlddata"]}'


when you Call the playbook ``playbook-execute-backup.yml`` without any ``--extra-vars`` we use the configuration from, :ref:`config-backup-daily`.

.. _ref-maintenance-jobs-backup-task-adhoc-archive:

Adhoc Archiving Backup
*********************************************************


Local Archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: yaml
   :caption: Start Restic Adhoc Backup
   :name: cmd-backup-task-adhoc-restic

   ansible-playbook maintenance/playbook-execute-backup.yml --extra-vars 'backup_type=archive' --extra-vars 'backup_adhoc_publish=local'


Gdrive Upload
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For Upload to GDrive you must define your ``gdrive_refresh_token`` as Variable.




.. _ref-maintenance-jobs-backup-task-restore-on-create:

Restore on Create
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

At the moment you can only use :term:`restic` *(local or remote)* Repositories for automatical restore.


  .. code-block:: yaml
     :caption: Restore Configuration Attributes.
     :name: config-backup-init-server

      minecraft_restore_src: "s3"
      minecraft_restore_elements:
        - "worlddata"
      #  - "plugins"


The Values must match with entries from the :ref:`config-backup-static-structure`.
