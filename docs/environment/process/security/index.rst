Security
===========================================

Als neuer Server im Internet kommt man sich vor wie ein Schnäpchen auf dem Grabbeltisch ...
Die vielen, gut Trainierte, Systeme klopfen alles ab was sie finden können, aus diesen Gründen sollte man sich die Mühe geben die klasschischen Angrifsvektoren abzudecken.

Harder SSH
--------------------------------------------

Die SSHd Config wurde nach Anleitung von `CentOS Wiki <https://wiki.centos.org/HowTos/Network/SecuringSSH>`_ angepasst.

* SSH Protocol 2
* No Password Auth
* Changed SSH Port
* SSH ``AllowUsers``


Firewall und Zugriffsprotokoll
------------------------------------

| Als Firewall und Audit Log System wird `ConfigServer Security & Firewall (csf) <https://configserver.com/cp/csf.html>`_ verwendet.
| Eine etwas abgespeckte version währe `fail2ban`_ gewesen.


Erfahrung ConfigServer Security & Firewall (csf)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Leider hat sich das einrichten & installieren über Ansible als komplexer als gedacht erwiesen, aus diesen grund wird erstmal nur fail2ban in Kombination mit firewalld umgesetzt.


firewall
  hier wird der klassiker FirewallD verwendet.

bruteforce detection
  Gegen Brute Force wird `fail2ban`_ verwendet.


Advanced Intrusion Detection Environment (`aide`_)
  Erfasst dabei Prüfsummen, von dateien und vergleicht diese gegen vorherriege läufe. *(umsetzung offen)*

`OpenSCAP <open-scap>`_
  Durchführen von Tests um die Configuration auf bekannte schwachstellen zu untersuchen. *(umsetzung offen)*


Blocklisten
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. _aide: https://de.wikipedia.org/wiki/Advanced_Intrusion_Detection_Environment
.. _fail2ban: https://www.fail2ban.org/wiki/index.php/Main_Page
.. _open-scap: https://www.open-scap.org/tools/openscap-base/#documentation
.. _wiki_scap: https://de.wikipedia.org/wiki/Security_Content_Automation_Protocol
