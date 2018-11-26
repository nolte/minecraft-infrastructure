Ackerland Bauer
==============================================

| **FlatWorld** ``/tp -1424 20 190``
| **Platz:** 756 ~ 12stacks (Voll bepflanzung)

**Saatvorrat:** 2x Vollbepflanzung = 2268  ~36 Stack


Benötigt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
(werden von der farm selbst Produziert)

* Karotten_
* Kartoffel_
* Weizenpflanzen (seeds)
* Rote Bete (seeds)


Produziert
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Karotten_
* Kartoffel_
* Weizenpflanzen (seeds)
* Rote Bete (seeds)

* Weizen
* Gift Katoffeln
* `Rote Beete`_

* sonstiege rohsoffe ()

Der Sorter hat *8* Item ausgänge.

Verteilung
*************************************

Weizen
  | Fiehzucht
  | Bäcker




Rote Beete & Kartoffeln
  |  Schweine
  |  Kantine

Karotten_
  | Kaninchen_
  | Kantine

`Rote-Bete-Samen <https://minecraft-de.gamepedia.com/Rote-Bete-Samen>`_ & `Weizenkörner <https://minecraft-de.gamepedia.com/Weizenk%C3%B6rner>`_
  Eierfarm

Gift Katoffeln
  hexenhaus

sonstiege rohsoffe
  Lager

``
/schematic load malte/dev/work/utils/tech_ressources_falling_eight_way.schematic
/schematic load malte/dev/work/utils/tech_ressources_splitter_2_way_1to3.schematic
/schematic load malte/dev/work/utils/tech_reailway_ressources_fill_minecard.schematic
/schematic load malte/dev/work/utils/tech_ressources_splitter_2_way_1to3_and_minecardFiller.schematic
``


``
/schematic load malte/dev/work/farmfabric/farmland_with_sorter_and_seedsselector
/schematic load malte/dev/work/farmfabric/ressources_distribution_station_12_outputs
/schematic save malte/dev/work/farmfabric/farmland_full
``

Ernte Mechanismuss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Das Ernten soll per ``Knopf`` geschehen, dafür muss das Wasser lange genug Flißen das alle Rohstoffe unten sind.

``
/schematic load malte/dev/work/fabric/field_full_18


``

jeder Feld Block ist 7ben lang, die Rohstoffe müssen maximal  22 Block Transportiert werden (3 Felder * 7 Länge + 1 Block zum Hopper  = 22)



.. include:: mc_wiki_links.rst
