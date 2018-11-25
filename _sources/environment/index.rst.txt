Server Umgebung
==================================================

.. toctree::
   :maxdepth: 1
   :glob:

   */index


Nützliche befehle
---------------------------------------------------


+----------------------------------------------------------+-------------------+
| command                                                  | description       |
+----------------------------------------------------------+-------------------+
| ``sudo service spigot restart``                          | server restart    |
+----------------------------------------------------------+-------------------+
| ``tail -f /opt/minecraft/server/shared/logs/latest.log`` | show current logs |
+----------------------------------------------------------+-------------------+


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
