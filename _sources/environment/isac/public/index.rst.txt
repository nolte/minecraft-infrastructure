Public Stage
==================================================

Für die vollständiges Einrichtung (:ref:`ref-env-provision-infrastructure` & :ref:`ref-env-provision-service`) der Produktiven Umgebung wird eine Kombination von :ref:`ref-env-process-terraform` und :ref:`ref-env-process-ansible` verwendet.

Die Terraform Scripte sind stark Cloud Anbieter spezifisch, und stellen die reine Infrastruktur bereit.
Mit Hilfe von Ansible wird das die eigentliche Instance verwaltet, Patch management, SSH Userverwaltung usw...
Ansible verwendet eine Kobination aus Dynamischen und Statischen inventory.

.. code-block:: shell

   cd ./provisioning
   ./setup-env.sh


Required
------------------------------------------------------

.. code-block:: shell

   TF_VAR_private_access_pass_path
   TF_VAR_machine_access_pass_path
   PASSWORD_STORE_DIR
   HCLOUD_TOKEN


.. _ref-env-provision-prod-configuration:

Konfiguration
--------------------------------------------------

Als Konfigurations Grundlage dient ``provisioning/inventories/prod/group_vars/minecraftgameserver.yml``


.. literalinclude:: ./../../../provisioning/inventories/prod/group_vars/minecraftgameserver.yml
   :language: yaml


.. _ref-env-provision-infrastructure:

Infrastruktur
--------------------------------------------------

Als aktueller Betreiber der Infrastruktur wird :ref:`ref-env-provider-hetzner` verwendet.

Bestandteile der Infrastruktur sind ``voluems``, ``ecs instances``, ``public project ssh keys`` und ``floating ip``.
Für die die verwaltung wird ein Terraform Provider verwendet, siehe :ref:`ref-env-provider-hetzner-integration-terraform`.
Die Terraform Scripte werden aufgrund des wunsches nach einem geziehlten Rollback und Destroy workflow in unterschiedliche scripte aufgeteilt.



Projekt Konfiguration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Allgemeine Projekt Konfigurationen werden unter ``provisioning/infrastructure/hetzner_project`` verwaltet, hierzu gehören z.B. die ``public project ssh keys``, für das initiale verbinden.

Server HotStorage
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Der HotStorage Part (siehe ``provisioning/infrastructure/hetzner_hotstorage``) regelt das verwalten von Kurzzeit Backups (``0,0476 €/GB/Monat``).


ECS Gameserver Instance
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

:ref:`ref-env-provision-infrastructure-details`


.. _ref-env-provision-service:

Service Konfiguration
--------------------------------------------------

:ref:`ref-env-backup`



https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-centos-7


Für die Ersteinrichtung wird ein Ansible Playbook verwendet,

.. code-block:: shell

   ansible-playbook provision-minecraft-master.yml -i ./inventories/prod

destroy

.. code-block:: shell

    ansible-playbook -i inventories/prod infrastructure/ansible_playbook-destroy-infrastructure.yml


Evaluierte Anbieter
--------------------------------------------------

.. toctree::
   :maxdepth: 1
   :glob:

   publisher/*/index
