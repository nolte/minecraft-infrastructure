sonstige
==================================================



Michfabrik
------------------------------------------------------------------
Eine Einzelne Kuh inkl Leer eimer Spender, die goldene Kuh kann gemolken werden...

| **FlatWorld** ``/tp -1521 40 -6``


Benötigt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* `Leere Eimer`_

Produziert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Milch_


**Schematic**
``
/schematic load malte/dev/work/farmfabric/milkfabric_full
``

Zuckerrohr Farm
------------------------------------------------------------------

Der Produzierte Zuckerrohr_ wird gesammelt und dann abtransportiert, dieses minimiert die Transportlohren.


``
/schematic load malte/dev/work/utils/tech_ressources_stacks_collector
``


Benötigt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*nix*

Produziert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Zuckerrohr_ (benötigt für Papier_ & Zucker_)


**Schematic**
``
/schematic load malte/dev/work/farmfabric/sugar_farm
``


/schematic load malte/dev/work/farmfabric/sugar_distribution_station

/schematic load malte/dev/work/utils/tech_ressources_splitter_2_way_1to3_stack_collector_card_filler

Verteilstation
--------------------------------------

1 Eingang 1 zu 3 steuerbare verteilung ...

/schematic load malte/dev/work/utils/tech_ressources_dispenser

**Schematic**
``
/schematic load malte/dev/work/farmfabric/sugar_distribution_station
``

Kakao_ Farm
---------------------------------------

pro wand 216 pflanzplätze (108 Block beidseitig nutzbar)

2 wände

Vorrat 14 Stack dann in den normalen kreislauf

~3,3 Stack

**Schematic**
``
/schematic load malte/dev/work/farmfabric/cocoa_farm
``

Eierfarm
---------------------------------------
**Schematic**
``
/schematic load malte/dev/work/farmfabric/egg_farm
``

1zu3 Verteilung (Bäcker & Chickenfarm)
1x Reste Rampe


Melone & Kürbis farm
---------------------------------------
**Schematic**
``
/schematic load malte/dev/work/farmfabric/pumpkin_melone_farm
``


/schematic load malte/dev/work/fabric/farm_pumpkin_melone


/schematic save malte/dev/work/utils/tech_ressources_collector_waiting_area
/schematic load malte/dev/work/utils/tech_ressources_splitter_2_way_1to3
/schematic save malte/dev/work/utils/tech_ressources_arrival_with_sorter
/schematic save malte/dev/work/utils/tech_ressources_arrival_with_storage
/schematic load malte/dev/work/utils/tech_ressources_elevator
/schematic load malte/dev/work/logic/tech_logic_and
/schematic load malte/dev/work/sorter/tech_sorter_wood
/schematic load malte/dev/work/utils/tech_reailway_ressources_transport

/schematic load malte/dev/work/fabric/potion_water_bottle_station
/schematic load malte/dev/work/utils/tech_ressources_stacks_collector

/schematic load malte/dev/work/utils/tech_ressources_splitter_2_way_1to3_stack_collector_card_filler


/schematic load malte/dev/work/utils/tech_reailway_ressources_fill_minecard

/schematic load malte/dev/work/logic/tech_logic_flip_flop
/schematic load malte/dev/work/logic/tech_logic_and_gate
/schematic load malte/dev/work/logic/tech_logic_or_gate
/schematic load malte/dev/work/logic/tech_logic_xnor_gate
.. include:: mc_wiki_links.rst
