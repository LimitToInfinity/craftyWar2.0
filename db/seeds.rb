Race.delete_all
BattleClass.delete_all
Profession.delete_all
Character.delete_all
User.delete_all
MonsterVerbage.delete_all
Monster.delete_all


Race.create(name: "Gnome", hit_points: 3, attack_power: 1, defense: 1, picture: "gnome.jpg")
Race.create(name: "Human", hit_points: 2, attack_power: 2, defense: 1, picture: "human.jpg")
Race.create(name: "Night Elf", hit_points: 2, attack_power: 2, defense: 1, picture: "night_elf.jpg")
Race.create(name: "Draenei", hit_points: 1, attack_power: 3, defense: 1, picture: "draenei.jpg")
Race.create(name: "Worgen", hit_points: 1, attack_power: 3, defense: 1, picture: "worgen.jpg")
Race.create(name: "Dwarf", hit_points: 3, attack_power: 1, defense: 1, picture: "dwarf.jpg")
Race.create(name: "Tauren", hit_points: 4, attack_power: 0, defense: 1, picture: "tauren.jpg")
Race.create(name: "Troll", hit_points: 0, attack_power: 4, defense: 1, picture: "troll.jpg")
Race.create(name: "Undead", hit_points: 2, attack_power: 2, defense: 1, picture: "undead.png")
Race.create(name: "Blood Elf", hit_points: 1, attack_power: 3, defense: 1, picture: "blood_elf.jpg")
Race.create(name: "Goblin", hit_points: 2, attack_power: 2, defense: 1, picture: "goblin.jpg")
Race.create(name: "Orc", hit_points: 1, attack_power: 3, defense: 1, picture: "orc.jpg")
Race.create(name: "Pandaren", hit_points: 2, attack_power: 2, defense: 1, picture: "pandaren.jpg")

BattleClass.create(name: "Druid", hit_points: 14, attack_power: 5, defense: 3, picture: "druid.jpg")
BattleClass.create(name: "Hunter", hit_points: 13, attack_power: 6, defense: 2, picture: "hunter.jpg")
BattleClass.create(name: "Mage", hit_points: 10, attack_power: 10, defense: 0, picture: "mage.jpg")
BattleClass.create(name: "Paladin", hit_points: 20, attack_power: 5, defense: 5, picture: "paladin.jpg")
BattleClass.create(name: "Priest", hit_points: 14, attack_power: 6, defense: 1, picture: "priest.jpg")
BattleClass.create(name: "Rogue", hit_points: 12, attack_power: 8, defense: 2, picture: "rogue.jpg")
BattleClass.create(name: "Shaman", hit_points: 11, attack_power: 7, defense: 2, picture: "shaman.jpg")
BattleClass.create(name: "Warlock", hit_points: 15, attack_power: 6, defense: 3, picture: "warlock.jpg")
BattleClass.create(name: "Warrior", hit_points: 16, attack_power: 6, defense: 4, picture: "warrior.jpg")
BattleClass.create(name: "Death Knight", hit_points: 17, attack_power: 7, defense: 4, picture: "death_knight.jpg")
BattleClass.create(name: "Monk", hit_points: 18, attack_power: 4, defense: 3, picture: "monk.jpg")
BattleClass.create(name: "Demon Hunter", hit_points: 11, attack_power: 10, defense: 0, picture: "demon_hunter.jpg")

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

muahaha = Monster.create(name: "Muahaha", hit_points: 17, attack_power: 8, defense: 4)
cellulite = Monster.create(name: "Cellulite", hit_points: 22, attack_power: 6, defense: 2)
kali = Monster.create(name: "Kali", hit_points: 15, attack_power: 9, defense: 3)

MonsterVerbage.create(verbage: "You're doomed!", monster: muahaha)
MonsterVerbage.create(verbage: "Feel my wrath!", monster: muahaha)
MonsterVerbage.create(verbage: "Your life is futile!", monster: muahaha)
MonsterVerbage.create(verbage: "Thine blubber shall be thine downfall!", monster: cellulite)
MonsterVerbage.create(verbage: "Thy shall be squished!", monster: cellulite)
MonsterVerbage.create(verbage: "I will eat you like a cookie!", monster: cellulite)
MonsterVerbage.create(verbage: "Divine you are not!", monster: kali)
MonsterVerbage.create(verbage: "Hero, you will be destroyed!", monster: kali)
MonsterVerbage.create(verbage: "How dare you show yourself!", monster: kali)