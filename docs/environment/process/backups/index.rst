.. _ref-env-backup:

Ablauf Backup Prozess
========================

Zum erstellen von Backups wird `restic <https://restic.net/>`_ verwendet. Der Lokale Cron wird durch die
Ansible Role `paulfantom/ansible-restic <https://github.com/paulfantom/ansible-restic>`_ konfiguriert.


Backups
------------------------------------------

Die Konfiguration der Backups findet über die :ref:`ref-env-provision-prod-configuration` der entsprechenden Stage statt.

Hotstorage Repositories
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Als Regelmäßiges Backupsystem wurde ein 20GB (``~0,95 €/Mo``) Volumen an die Produktive Instanze gemounted.

Coldstorage Repositories
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Zusätzlich zu dem Volumen, werden die Daten regelmäßig bei `backblaze.com <https://www.backblaze.com/b2/cloud-storage.html>`_ archiviert.

Als Colstorage Buckets dienen ``b2:mcbackup-plugindata`` und ``b2:mcbackup-worlddata``.

+----------------------------+----------------+------------------+--------------------+-----------------------------------------------------------+
| Bucket                     | Initiale Größe | Kosten Pro Monat | Kosten Pro Restore | Beschreibung                                              |
+----------------------------+----------------+------------------+--------------------+-----------------------------------------------------------+
| ``b2:mcbackup-plugindata`` | 1.3 Gb         |                  |                    | Hier liegen alle Plugindaten und Konfigurationen,         |
|                            |                |                  |                    | aktuell auch noch die Dynmap daher die größe ...          |
+----------------------------+----------------+------------------+--------------------+-----------------------------------------------------------+
| ``b2:mcbackup-worlddata``  | 3.9 Gb         |                  |                    | In diesem Bucket werden alle Weltinformationen Archiviert |
+----------------------------+----------------+------------------+--------------------+-----------------------------------------------------------+
| **Summe**                  | ~5.2 Gb        | ~ 0,026$         | ~0,052$            |                                                           |
+----------------------------+----------------+------------------+--------------------+-----------------------------------------------------------+


**Weblinks:**

* `Restic Integration <https://help.backblaze.com/hc/en-us/articles/115002880514-How-to-configure-Backblaze-B2-with-Restic-on-Linux>`_
* `How To <https://www.grzegorowski.com/restic-backblaze-b2-backups/>`_



Restic
------------------------------------------

.. code-block:: shell

  export B2_ACCOUNT_ID="" && \
  export B2_ACCOUNT_KEY="" && \
  export RESTIC_REPOSITORY="b2:mcbackup-worlddata"
  restic -r b2:mcbackup-worlddata init
  restic -r b2:mcbackup-worlddata --exclude="logs/*" backup /opt/minecraft/server/shared


Listen aller snapshots
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: shell

    restic -r /tmp/resticrepo snapshots


Cron
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: shell

   [vagrant@localhost ~]$ sudo cat /etc/cron.d/restic-localbackup
   # vi: ft=jinja.crontab
   #
   # Ansible managed
   #
   MAILTO="root"
   SHELL=/bin/sh
   PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
   RESTIC_REPOSITORY=/tmp/resticrepo
   RESTIC_PASSWORD=dolphins

   # Apply retention policy
   17 5 * * * root restic forget --prune --keep-last 2 --keep-tag special
   # Check repository
   17 4 * * * root restic check
   # Do an actual backup
   0 1  * * * root restic backup /opt/minecraft/server/shared



.. uml:: backup-remote-node-process.plantuml


.. uml:: process-diagramm.plantuml


.. uml:: hotstorage.plantuml
