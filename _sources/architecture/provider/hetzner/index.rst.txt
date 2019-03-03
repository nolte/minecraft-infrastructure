.. _ref-env-provider-hetzner:

Hetzner
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

.. |Base Structure| image:: basestructure.svg
 :width: 300
 :alt: Alternative text


+------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| Aufbau           |                                                                                                                                          |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------+
| |Base Structure| | .. include:: hetzner_price_calc.rst                                                                                                      |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------+


Configuration
-----------------------

Die Grundlegende VM Config findet über `CloudInit <https://cloudinit.readthedocs.io/en/latest/topics/examples.html>`_ statt, alles nachfolgede wird durch Ansible gesteuert.

.. literalinclude:: cloudinit.yml
   :language: yaml


Erfahrungsbericht
-----------------------

Sehr einfaches bereitstellen von VMs, hosted in Finnland und Deutschland.


Integration
-----------------------

.. _ref-env-provider-hetzner-integration-ansible:

Hetzner Dynamic Inventory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`hg8496/ansible-hcloud-inventory <https://github.com/hg8496/ansible-hcloud-inventory>`_

.. _ref-env-provider-hetzner-integration-terraform:

Hetzner Provider
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`terraform-providers/terraform-provider-hcloud <https://github.com/terraform-providers/terraform-provider-hcloud>`_
`providers/hcloud/ <https://www.terraform.io/docs/providers/hcloud/>`_
