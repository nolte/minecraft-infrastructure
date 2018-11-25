DynMap
====================

By Default the Dynmap is accessable over the port ``8123``, and will started as process in your MinecraftServer.

* `Dynmap Github <https://github.com/webbukkit/dynmap>`_
* `Dynmap HTTPs <https://www.reddit.com/r/admincraft/comments/8j2cbg/setting_up_dynmap_on_a_standalone_webserver_using/>`_
* `Setting-up-without-the-Internal-Web-Server <https://github.com/webbukkit/dynmap/wiki/Setting-up-without-the-Internal-Web-Server>`_
* `Setting-up-Dynamic-Map-with-apache2-under-Debian <https://github.com/webbukkit/dynmap/wiki/Setting-up-Dynamic-Map-with-apache2-under-Debian>`_
* `DynMap Command List <https://github.com/webbukkit/dynmap/wiki/Commands>`_


DynMap as Internal Process
---------------------------------

.. uml::

    node "minecraft server" as mcServer {
      interface "8123" as intDymamp
      interface "25565" as intGameServer
      artifact "mc.jar" as  artifactServer

      artifactServer --- intDymamp
      artifactServer --- intGameServer

    }


DynMap on Standalone Webserver
---------------------------------

.. uml::

   Alice -> Bob: Hi!
   Alice <- Bob: How are you?
