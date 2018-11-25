PermissionsEx
==================================================

Getting Started
---------------
PermissionsEx_GITHUB_WIKI_
PermissionsEx_GITHUB_COMMAND_LIST_

.. _PermissionsEx_GITHUB_WIKI: https://github.com/PEXPlugins/PermissionsEx/wiki
.. _PermissionsEx_GITHUB_COMMAND_LIST: https://github.com/PEXPlugins/PermissionsEx/wiki/Commands


.. code-block:: sql

  INSERT INTO `permissions_entity` ( `name`, `type`,  `default` ) VALUES ( 'admins', 0, 0 );
  INSERT INTO `permissions_entity` ( `name`, `type`,  `default` ) VALUES ( 'nolte07', 1, 0 );
  INSERT INTO `permissions_inheritance` ( `child`, `parent`, `type` ) VALUES ( 'admins', 'default',  0);
  INSERT INTO `permissions_inheritance` ( `child`, `parent`, `type` ) VALUES ( 'nolte07', 'admins',  1);
  INSERT INTO `permissions` ( `name`, `type`, `permission`, `world`, `value`) VALUES ('admins', 0, '*', '', '');
  INSERT INTO `permissions` (`id`, `name`, `type`, `permission`, `world`, `value`) VALUES (null, 'e1e45a60-d375-4fea-a238-91323b5ec11d', 1, 'name', '', 'nolte07');


Command line activities

.. code-block:: shell

  /pex group admins create
  /pex user nolte07 group set admins
  /pex group admins add *


Example permissions.yml
--------------------------------------------------


.. literalinclude:: ../../../ansible-provision/templates/permissionsex/permissions.yml.j2
   :language: yaml
