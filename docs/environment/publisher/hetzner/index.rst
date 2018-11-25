Hetzner Config
=======================

Tryed Systems
------------------------

+--------+--------+------+-------+-----------+------------+
| Server |   CPU  |  RAM | HDD   | Price     | Experience |
+--------+--------+------+-------+-----------+------------+
| CX11   | 1 VCPU | 2 GB | 20 GB | 2,96 €/mo | some lags  |
+--------+--------+------+-------+-----------+------------+
| CX21   | 2 VCPU | 4 GB | 20 GB | 5,83 €/mo | runs good  |
+--------+--------+------+-------+-----------+------------+
|        |        |      |       |           |            |
+--------+--------+------+-------+-----------+------------+


Configuration
-----------------------

Die Grundlegende VM Config findet über `CloudInit <https://cloudinit.readthedocs.io/en/latest/topics/examples.html>`_ statt, alles nachfolgede wird durch Ansible gesteuert.

.. literalinclude:: cloudinit.yml
   :language: yaml


Erfahrungsbericht
-----------------------

Sehr einfaches bereitstellen von VMs, hosted in Finnland und Deutschland.
