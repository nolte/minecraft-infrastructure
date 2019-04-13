Maintenance
**************************************************

Handle The Environment
==================================================


Create the Environment
--------------------------------------------------

.. code-block:: shell
   :caption: Create the Environment
   :name: example-cmd-env-create

   ansible-playbook  -i inventories/prod  master_playbook-setup-env.yml --extra-vars "mc_accept_eula=true"



Destroy the Environment
--------------------------------------------------

.. code-block:: shell
   :caption: destroy the Environment
   :name: example-cmd-env-destroy

   ansible-playbook -i inventories/prod infrastructure/playbook-destroy-infrastructure.yml --tags "backupnode"


Backup and Recovery
==================================================

Manual Starting Backups

  .. code-block:: shell
     :caption: Manual execute a backup.
     :name: example-cmd-backup-start-manual

      cd  provisioning
      ansible-playbook -i inventories/prod maintenance/playbook-execute-backup.yml --extra-vars "backup_destination=backblaze"


  .. ansibleautotask:: Basic lookup. Fails if backblaze secrects doesn't exist
     :playbook: ../provisioning/maintenance/playbook-execute-backup.yml


.. _ref-maintenance-process-cmdb:

Ansible CMDB
==================================================

Be sure that you have prepared your local :ref:`Ansible <ref-getting-started-configure-ansible>`.

.. code-block:: shell
   :caption: Create A System HTML Overview
   :name: example-cmd-cmdb-create

   mkdir out
   ansible -i inventories/prod/ -m setup --tree out/ all
   ansible-cmdb -i inventories/prod out > output.html


Open Scap scan
==================================================

.. code-block:: shell
  :caption: destroy the Environment
  :name: example-cmd-env-destroy

  ansible-playbook -i inventories/prod maintenance/playbook-execute-security-open-scap-scan.yml
