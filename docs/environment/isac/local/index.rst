Lokale Entwicklung
=======================================


Für die Lokale Entwicklung kann vagrant und das inventory ``test`` genutzt werden. Die Terraform Infrastruktur scripte werden hier nicht verwendet.

.. code-block:: shell

   export mc_accept_eula=true && vagrant up


.. code-block:: shell

    export mc_accept_eula=true && \
      vagrant rsync && \
      vagrant provision
