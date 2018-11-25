Essentials
================================================

Nützliche Sammlung von Befehlen und Erweiterungen, z.B. `Plegen der Willkommensnachricht <#pflege-der-willkommensnachricht>`_, AFK system usw... (siehe `Essentials/wiki <https://github.com/EssentialsX/Essentials/wiki>`_).

* GithubProject: `EssentialsX/Essentials <https://github.com/EssentialsX/Essentials>`_
* Command List: `Commands & Permissions <https://essinfo.xeya.me/commands.php>`_

Pflege der Willkommensnachricht
-----------------------------------------------

Unter ``plugins/Essentials/motd.txt`` findet man eine Datei welche den Willkommens Text beinhaltet.

z.B.

.. literalinclude:: ../../../ansible-provision/templates/essentials/motd.txt.j2
   :language: text

nach dem ändern müssen die Einstellungen neu geladen werden:

.. code-block:: shell

    /essentials reload
