.. include:: ../readme.rst


Ziel ist es eine Server Struktur aufzubauen bei der die Betriebskosten möglichst gering sind,
die Verfügbarkeit und die usability sollte allerdings mit einem Anblieter wie `nitrado.com <https:\\www.nintrado.com>`_ vergleichbar sein.

**services**
  - Automatisches Backup
  - Prüfen der Welten mit region fixer
  - Scriptgesteuerte vollständiege Bereitstellung

Anfragen können über `discordapp.com <https://discord.gg/tFZmkxW>`_ oder als Pull Request erfolgen.

Getting Started
---------------

.. toctree::
   :maxdepth: 4

   gameworld/index
   plugins/index
   environment/index



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
