Race.delete_all
CharacterClass.delete_all
Profession.delete_all
Character.delete_all
User.delete_all

Race.create(name: "Gnome")
Race.create(name: "Human")
Race.create(name: "Night Elf")
Race.create(name: "Draenei")
Race.create(name: "Worgen")
Race.create(name: "Dward")
Race.create(name: "Tauren")
Race.create(name: "Troll")
Race.create(name: "Undead")
Race.create(name: "Blood Elf")
Race.create(name: "Goblin")
Race.create(name: "Orc")
Race.create(name: "Pandaren")

CharacterClass.create(name: "Druid", hit_points: 14, attack_power: 5)
CharacterClass.create(name: "Hunter", hit_points: 13, attack_power: 6)
CharacterClass.create(name: "Mage", hit_points: 10, attack_power: 10)
CharacterClass.create(name: "Paladin", hit_points: 20, attack_power: 5)
CharacterClass.create(name: "Priest", hit_points: 14, attack_power: 6)
CharacterClass.create(name: "Rogue", hit_points: 12, attack_power: 8)
CharacterClass.create(name: "Shaman", hit_points: 11, attack_power: 7)
CharacterClass.create(name: "Warlock", hit_points: 15, attack_power: 6)
CharacterClass.create(name: "Warrior", hit_points: 16, attack_power: 6)
CharacterClass.create(name: "Death Knight", hit_points: 17, attack_power: 7)
CharacterClass.create(name: "Monk", hit_points: 18, attack_power: 4)
CharacterClass.create(name: "Demon Hunter", hit_points: 11, attack_power: 10)

Profession.create(name: "Alchemist")
Profession.create(name: "Blacksmith")
Profession.create(name: "Enchanter")
Profession.create(name: "Engineer")
Profession.create(name: "Herbalism")
Profession.create(name: "Inscription")
Profession.create(name: "Jewelry Crafter")
Profession.create(name: "Leatherworker")
Profession.create(name: "Miner")
Profession.create(name: "Skinner")
Profession.create(name: "Tailor")

Monster.create(name: "Muahaha", hit_points: 15, attack_power: 7)
Monster.create(name: "Cellulite", hit_points: 20, attack_power: 5)
Monster.create(name: "Kali", hit_points: 12, attack_power: 9)