Nitrado
========================


.. uml::

   actor player as "Player"

   cloud nitrado.de {
     component gameserver as "MC Server"
     interface gameserverftp as "ftp"
     interface mcport as "25565"

     database gameserverdb as "Database MySQL"
     interface databaseport as "3306"

     gameserver -- gameserverftp
     gameserver -- mcport
     gameserverdb -- databaseport
     gameserver -- databaseport

   }

   cloud backupserviceenv {

      component backupservice as "Backup Service"

      node backuparchiveenv as "Archive Storage" {
        folder backuparchive as "Backup Archive"
      }

      backupservice -- gameserverftp
      backupservice -- databaseport
      backupservice --> backuparchiveenv
   }

   player -- mcport




Erfahrungen
---------------------

 - (-) der zugriff über ftp verlangsamt backups und ist allgemein sehr hinderlich ...
 - (+) Recht Stabiel !
 - (+) MySQL inklusive
 - (-) ausschließlich bukkit server
