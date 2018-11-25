Minecraft Server As a Service
==================================================

Ziel ist es eine Server Struktur aufzubauen bei der die Betriebskosten möglichst gering sind,
die Verfügbarkeit und die usability sollte allerdings mit einem Anblieter wie `nitrado.com <https:\\www.nintrado.com>`_ vergleichbar sein.

**services**
  - Automatisches Backup
  - Prüfen der Welten mit region fixer
  - Scriptgesteuerte vollständiege Bereitstellung

Genutzte Projekte
-------------------------------

Für die unterschiedlichen Services werden weitere OpenSource Projekte verwendet.

+-----------------------------------------------------------------------------------------------+--------------------------------------+
| Projekte                                                                                      | description                          |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `minecraft-plugin-archivator <https://github.com/nolte/minecraft-plugin-archivator>`_         | Minecraft Java Plugin                |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `ansible-minecraft <https://github.com/nolte/ansible-minecraft>`_                             | Ansible Role to Controll the Server  |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `ansible-minecraft-region-fixer <https://github.com/nolte/ansible-minecraft-region-fixer>`_   | Ansible Role für den region Fixer    |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `itzg/rcon-cli <https://github.com/itzg/rcon-cli>`_                                           | Go Rcon Commandline Interface        |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `ansiblebit/oracle-java <https://github.com/ansiblebit/oracle-java>`_                         | Ansible Role for install Oracle Java |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `geerlingguy/ansible-role-certbot <https://github.com/geerlingguy/ansible-role-certbot>`_     | Ansible Role for LetsEncrypt CertBot |
+-----------------------------------------------------------------------------------------------+--------------------------------------+
| `geerlingguy/ansible-role-nginx <https://github.com/geerlingguy/ansible-role-nginx>`_         | Ansible Role for handle the nginx    |
+-----------------------------------------------------------------------------------------------+--------------------------------------+



Getting Started
---------------

.. toctree::
   :maxdepth: 2

   plugins/index
   environment/index
   server/index


.. uml::

   actor player as "Player"

   cloud voiceserverenv {
     component voiceserver as "Voice Server"
     player -- voiceserver
   }


   cloud minecraftcloud {
     component bungeecordmirror as "Bungeecord Server Mirror"
     component minecraft1131 as "Minecraft 1.13.1 Node"
     component minecraftFTBNode as "Minecraft FTB Node"

     bungeecordmirror -- minecraft1131
     bungeecordmirror -- minecraftFTBNode
     player -- bungeecordmirror
   }

   cloud serverbackupenv {
     folder backuparchive as "Backup Archive"
     note left
     External <b>Backup Storage</b>
     for WorldBackup Data like,
       * World Data
       * Plugin Config
     end note

   }

   cloud sourcecodemanagement {
     folder  git as "Config Management"
   }

   cloud monitoringenv as "Monitoring and Utils" {
      component backupscheduler as "Backup Scheduler Service"
   }

   sourcecodemanagement --> minecraftcloud
   sourcecodemanagement --> serverbackupenv
   sourcecodemanagement --> voiceserverenv

   bungeecordmirror --> backupscheduler
   minecraftFTBNode --> backupscheduler
   minecraft1131 --> backupscheduler

   backupscheduler --> backuparchive
   backupscheduler --> backuparchive
   backupscheduler --> backuparchive
