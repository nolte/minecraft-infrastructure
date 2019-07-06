Testing
**************************************************

For a Quick feadback you can execute the :term:`Testinfra` Acception Tests.

.. code-block:: shell
  :caption: "Execute Testinfra Acception Tests"
  :name: example-cmd-test-acception

    py.test --hosts=minecraftgameserver --ansible-inventory=inventories/prod --connection=ansible maintenance-test/*