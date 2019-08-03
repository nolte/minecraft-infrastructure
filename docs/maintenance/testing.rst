.. _ref-maintenance-testing:

Testing
**************************************************

For a Quick feedback you can execute the :term:`Testinfra` Acception Tests. Ensure that you have set the :ref:`example-cmd-configure-env-vars` are configured, if requred.

.. code-block:: shell
  :caption: "Testinfra Acception Tests"
  :name: example-cmd-maintenance-testing

    py.test --hosts='ansible://minecraftgameserver*' ext_debs/ansible_playbook-baseline-online-server/test/test_base_acception_test.py
    py.test --hosts='ansible://minecraftgameserver*' maintenance-test/*
