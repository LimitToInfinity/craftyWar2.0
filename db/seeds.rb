Race.delete_all
BattleClass.delete_all
Profession.delete_all
Character.delete_all
User.delete_all

Race.create(name: "Gnome", hit_points: 3, attack_power: 1, picture: "gnome.jpg")
Race.create(name: "Human", hit_points: 2, attack_power: 2, picture: "human.jpg")
Race.create(name: "Night Elf", hit_points: 2, attack_power: 2, picture: "night_elf.jpg")
Race.create(name: "Draenei", hit_points: 1, attack_power: 3, picture: "draenei.jpg")
Race.create(name: "Worgen", hit_points: 1, attack_power: 3, picture: "worgen.jpg")
Race.create(name: "Dwarf", hit_points: 3, attack_power: 1, picture: "dwarf.jpg")
Race.create(name: "Tauren", hit_points: 4, attack_power: 0, picture: "tauren.jpg")
Race.create(name: "Troll", hit_points: 0, attack_power: 4, picture: "troll.jpg")
Race.create(name: "Undead", hit_points: 2, attack_power: 2, picture: "undead.png")
Race.create(name: "Blood Elf", hit_points: 1, attack_power: 3, picture: "blood_elf.jpg")
Race.create(name: "Goblin", hit_points: 2, attack_power: 2, picture: "goblin.jpg")
Race.create(name: "Orc", hit_points: 1, attack_power: 3, picture: "orc.jpg")
Race.create(name: "Pandaren", hit_points: 2, attack_power: 2, picture: "pandaren.jpg")

BattleClass.create(name: "Druid", hit_points: 14, attack_power: 5, picture: "druid.jpg")
BattleClass.create(name: "Hunter", hit_points: 13, attack_power: 6, picture: "hunter.jpg")
BattleClass.create(name: "Mage", hit_points: 10, attack_power: 10, picture: "mage.jpg")
BattleClass.create(name: "Paladin", hit_points: 20, attack_power: 5, picture: "paladin.jpg")
BattleClass.create(name: "Priest", hit_points: 14, attack_power: 6, picture: "priest.jpg")
BattleClass.create(name: "Rogue", hit_points: 12, attack_power: 8, picture: "rogue.jpg")
BattleClass.create(name: "Shaman", hit_points: 11, attack_power: 7, picture: "shaman.jpg")
BattleClass.create(name: "Warlock", hit_points: 15, attack_power: 6, picture: "warlock.jpg")
BattleClass.create(name: "Warrior", hit_points: 16, attack_power: 6, picture: "warrior.jpg")
BattleClass.create(name: "Death Knight", hit_points: 17, attack_power: 7, picture: "death_knight.jpg")
BattleClass.create(name: "Monk", hit_points: 18, attack_power: 4, picture: "monk.jpg")
BattleClass.create(name: "Demon Hunter", hit_points: 11, attack_power: 10, picture: "demon_hunter.jpg")

Profession.create(name: "Alchemist", picture: "alchemist.png")
Profession.create(name: "Blacksmith", picture: "blacksmith.jpg")
Profession.create(name: "Enchanter", picture: "enchanter.png")
Profession.create(name: "Engineer", picture: "engineer.jpg")
Profession.create(name: "Herbalist", picture: "herbalist.jpg")
Profession.create(name: "Scribe", picture: "scribe.png")
Profession.create(name: "Jeweler", picture: "jeweler.jpg")
Profession.create(name: "Leatherworker", picture: "leatherworker.jpg")
Profession.create(name: "Miner", picture: "miner.png")
Profession.create(name: "Skinner", picture: "skinner.png")
Profession.create(name: "Tailor", picture: "tailor.jpg")

Monster.create(name: "Muahaha", hit_points: 17, attack_power: 8)
Monster.create(name: "Cellulite", hit_points: 22, attack_power: 6)
Monster.create(name: "Kali", hit_points: 15, attack_power: 9)