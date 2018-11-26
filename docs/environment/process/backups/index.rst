.. _ref-env-backup:

Ablauf Backup Prozess
========================

Zum erstellen von Backups wird `restic <https://restic.net/>`_ verwendet. Der Lokale Cron wird durch die
Ansible Role `paulfantom/ansible-restic <https://github.com/paulfantom/ansible-restic>`_ konfiguriert.


Restic World Repository
------------------------------------------

Die Konfiguration der Backups findet über die :ref:`ref-env-provision-prod-configuration` der entsprechenden Stage statt.


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
