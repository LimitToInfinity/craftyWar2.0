def main_menu
    system("clear")
    puts welcome
    user_input = gets.strip
    case user_input
    when "1"
        if User.count > 0
            system("clear")
            existing_user
        else
            puts ""
            system("clear")
            puts "There are no users!".light_red.on_black
            main_menu
        end
    when "2"
        system("clear")
        new_user
    when "3"
        system("clear")
        exit_message
    else
        system("clear")
        main_menu
    end
end

def welcome
    system("imgcat ./lib/pic/opening.jpg")
    puts ""
    puts "Welcome to the World of Crafty War".black.on_red
    puts "Choose your DESTINY!".light_red.on_black.blink
    puts "1. Existing user".light_yellow
    puts "2. New user!".light_yellow
    puts "3. Exit".light_cyan.on_black
end

def exit_message
    puts ""
    puts "They always come back!".black.on_light_yellow
    puts ""
end

def existing_user
    puts ""
    puts "Current users:".light_yellow
    
    User.all.each.with_index(1) do |user, index|
        puts "#{index}. #{user.name}".light_red.on_black
    end 
    
    user_match = nil
    while user_match.nil?
        
        puts ""
        puts "Enter your user name:".light_yellow
        
        user_input = gets.strip
        
        if user_input.to_i == 0
            user_match = User.all.find do |user|
                user_input.downcase == user.name.downcase
            end
        elsif user_input.to_i >= 1 && user_input.to_i <= User.count
            system("clear")
            user_match = User.all[user_input.to_i - 1]
        end
    end
    existing_user_menu(user_match)
end

def new_user
    puts ""
    puts "Choose your user name:".light_yellow
    new_user_name = gets.strip
    
    user_match = User.all.find do |user|
        new_user_name.downcase == user.name.downcase
    end

    if user_match
        system("clear")
        puts ""
        puts "User #{new_user_name} already exists!".light_red.on_black
        new_user
    else
        new_user = User.create(name: new_user_name)
        system("clear")
        existing_user_menu(new_user)
    end
end

def existing_user_menu(user_match)
    user_match.reload
    puts ""
    puts "Welcome #{user_match.name}".light_red.on_black
    puts "1. Create new Character".light_yellow
    puts "2. Choose an existing Character".light_yellow
    puts "3. Main Menu".light_yellow
    puts "4. Exit".light_cyan.on_black
    user_input = gets.strip
    
    case user_input
        when "1"
            system("clear")
            character_creation(user_match)
        when "2"
            if user_match.characters.count > 0
                system("clear")
                character_menu(user_match)
            else
                system("clear")
                puts ""
                puts "You don't have any characters!".light_red.on_black
                existing_user_menu(user_match)
            end
        when "3"
            system("clear")
            main_menu
        when "4"
            system("clear")
            exit_message
        else
            existing_user_menu(user_match)
    end
end

def character_creation(user_match)

    puts ""
    puts "Enter Character name:".light_yellow.on_red
    new_character_name = gets.strip

    character_match = Character.all.find do |character|
        new_character_name.downcase == character.name.downcase
    end
    
    if character_match
        system("clear")
        puts ""
        puts "Character #{new_character_name} already exists!".light_red.on_black
        character_creation(user_match)
    else
        new_race = get_race
        race_hp = new_race.hit_points
        race_ap = new_race.attack_power
        race_d = new_race.defense
        
        system("clear")
        puts ""
        puts "Character - #{new_character_name}".black.on_red
        puts ""
        puts "Race - #{new_race.name}".light_green.on_black
        system("imgcat ./lib/pic/#{new_race.picture}")
        
        new_battle_class = get_battle_class
        bc_hp = new_battle_class.hit_points
        bc_ap = new_battle_class.attack_power
        bc_d = new_battle_class.defense
        
        system("clear")
        puts ""
        puts "Character - #{new_character_name}".black.on_red
        puts ""
        puts "Race - #{new_race.name}".light_green.on_black
        system("imgcat ./lib/pic/#{new_race.picture}")
        puts ""
        puts "Class - #{new_battle_class.name}".light_green.on_black
        system("imgcat ./lib/pic/#{new_battle_class.picture}")
        
        new_profession = get_profession
        system("imgcat ./lib/pic/#{new_profession.picture}")
    
        new_hp = race_hp + bc_hp
        new_ap = race_ap + bc_ap
        new_d = race_d + bc_d
        new_character = Character.create(name: new_character_name, race: new_race,
            battle_class: new_battle_class, profession: new_profession, user: user_match,
            hit_points: new_hp, attack_power: new_ap, defense: new_d)
    
        system("clear")
        display_character_stats(new_character)
        character_option_menu(new_character)
    end
end

def get_race
    puts ""
    puts "Races:".light_yellow.on_red
    Race.all.each.with_index(1) do |race, index|
        puts "#{index}. #{race.name}".light_cyan.on_blue
        puts "Hit Points: #{race.hit_points}, Attack Power: #{race.attack_power}, Defense: #{race.defense}".light_yellow
    end
    
    race_match = nil
    while race_match.nil?
        puts ""
        puts "Choose your Race:".light_yellow.on_red
        user_input = gets.strip
        
        if user_input.to_i == 0
            race_match = Race.find_by(name: user_input.downcase.titlecase)
        elsif user_input.to_i >= 1 && user_input.to_i <= Race.count
            race_match = Race.all[user_input.to_i - 1]
        end
    end
    race_match
end

def get_battle_class
    puts ""
    puts "Classes:".light_yellow.on_red
    BattleClass.all.each.with_index(1) do |battle_class, index|
        puts "#{index}. #{battle_class.name}".light_cyan.on_blue
        puts "Hit Points: #{battle_class.hit_points}, Attack Power: #{battle_class.attack_power}, Defense: #{battle_class.defense}".light_yellow
    end
    
    battle_class_match = nil
    while battle_class_match.nil?
        puts ""
        puts "Choose your Class:".light_yellow.on_red
        user_input = gets.strip
        
        if user_input.to_i == 0
            battle_class_match = BattleClass.find_by(name: user_input.downcase.titlecase)
        elsif user_input.to_i >= 1 && user_input.to_i <= BattleClass.count
            battle_class_match = BattleClass.all[user_input.to_i - 1]
        end
    end
    battle_class_match
end

def get_profession
    puts ""
    puts "Professions:".light_yellow.on_red
    Profession.all.each.with_index(1) {|profession, index| puts "#{index}. #{profession.name}".light_cyan.on_blue}
    
    profession_match = nil
    while profession_match.nil?
        puts ""
        puts "Choose your Profession:".light_yellow.on_red
        user_input = gets.strip
        
        if user_input.to_i == 0
            profession_match = Profession.find_by(name: user_input.downcase.titlecase)
        elsif user_input.to_i >= 1 && user_input.to_i <= Profession.count
            profession_match = Profession.all[user_input.to_i - 1]
        end
    end
    profession_match
end

def character_menu(user_match)
    puts ""
    puts "Your characters:".light_yellow
    user_match.characters.each.with_index(1) do |character, index|
        puts "#{index}. #{character.name}".light_red.on_black
    end
    character_choice = get_character_name(user_match)
    system("clear")
    display_character_stats(character_choice)
    character_option_menu(character_choice)
end

def get_character_name(user_match)
    puts ""
    puts "Choose your Character:".light_yellow
    user_input = gets.strip
    if user_input.to_i == 0
        character_match = user_match.characters.find do |character|
            character.name.downcase == user_input.downcase
        end
        if !character_match
            get_character_name(user_match)
        else
            character_match
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= user_match.characters.count
        user_match.characters[user_input.to_i - 1]
    else
        get_character_name(user_match)
    end
end

def character_option_menu(character_choice)
    puts ""
    puts "Prepare yourself for battle #{character_choice.name}!".black.on_red.blink
    puts "1. Battle!".light_red.on_black
    puts "2. Edit Character".light_yellow
    puts "3. Display Character stats".light_yellow
    puts "4. Delete Character".light_yellow
    puts "5. User Menu".light_yellow
    puts "6. Main Menu".light_yellow
    puts "7. Exit".light_cyan.on_black
    user_input = gets.strip
    case user_input
    when "1"
        system("clear")
        battle_menu(character_choice)
    when "2"
        system("clear")
        edit_character(character_choice)
    when "3"
        system("clear")
        display_character_stats(character_choice)
        character_option_menu(character_choice)
    when "4"
        puts ""
        puts "Are you sure? y/n".light_red.on_black
        if gets.strip.downcase == "y"
            character_choice.destroy
            system("clear")
            existing_user_menu(character_choice.user)
        else
            system("clear")
            character_option_menu(character_choice)
        end
    when "5"
        system("clear")
        existing_user_menu(character_choice.user)
    when "6"
        system("clear")
        main_menu
    when "7"
        system("clear")
        exit_message
    else
        system("clear")
        character_option_menu(character_choice)
    end
end

def edit_character(character_choice)
    character_choice.reload
    system("clear")
    display_character_stats(character_choice)
    puts ""
    puts "1. Change Name".light_yellow
    puts "2. Change Race".light_yellow
    puts "3. Change Battle Class".light_yellow
    puts "4. Change Profession".light_yellow
    puts "5. Return to Character Menu".light_yellow

    user_input = gets.strip

    case user_input
        when "1"
            system("clear")
            update_name(character_choice)
            edit_character(character_choice)
        when "2"
            system("clear")
            race_update = get_race
            rhp_update = race_update.hit_points + character_choice.battle_class.hit_points
            rap_update = race_update.attack_power + character_choice.battle_class.attack_power
            rd_update = race_update.defense + character_choice.battle_class.defense
            character_choice.update(race: race_update, hit_points: rhp_update, attack_power: rap_update, defense: rd_update)
            edit_character(character_choice)
        when "3"
            system("clear")
            bc_update = get_battle_class
            bchp_update = bc_update.hit_points + character_choice.race.hit_points
            bcap_update = bc_update.attack_power + character_choice.race.attack_power
            bcd_update = bc_update.defense + character_choice.race.defense
            character_choice.update(battle_class: bc_update, hit_points: bchp_update, attack_power: bcap_update, defense: bcd_update)
            edit_character(character_choice)
        when "4"
            system("clear")
            profession_update = get_profession
            character_choice.update(profession: profession_update)
            edit_character(character_choice)
        when "5"
            system("clear")
            character_option_menu(character_choice)
        else
            edit_character(character_choice)
    end
end

def update_name(character_choice) 
    puts ""
    puts "#{character_choice.name}, enter your new name:".light_yellow
    new_name = gets.strip
    name_match = Character.all.find do |character|
        new_name.downcase == character.name.downcase
    end
    if name_match
        system("clear")
        puts ""
        puts "Character #{new_name} already exists!".light_red.on_black
        update_name(character_choice)
    else
        character_choice.update(name: new_name)
        system("clear")
        character_option_menu(character_choice)
    end
end

def display_character_stats(character_choice)
    puts ""
    
    puts "Character - #{character_choice.name}".black.on_red
    puts ""
    
    puts "Race - #{character_choice.race.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.race.picture}")
    
    puts "Class - #{character_choice.battle_class.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.battle_class.picture}")
    
    puts "Profession - #{character_choice.profession.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.profession.picture}")
    
    puts "Hit Points - #{character_choice.hit_points}".light_green.on_black

    puts "Attack Power - #{character_choice.attack_power}".light_green.on_black
    
    puts "Defense - #{character_choice.defense}".light_green.on_black
end

def battle_menu(character_choice)
    puts ""
    puts "PREPARE FOR BATTLE!!!".light_red.on_black
    puts ""
    puts "A MONSTER approaches!".black.on_red
    puts ""
    puts "1. Fight!".light_red.on_black
    puts "2. RUNNNNN".white
    user_input = gets.strip
    case user_input
    when "1"
        system("clear")
        battle_opening(character_choice)
    when "2"
        system("clear")
        character_option_menu(character_choice)
    else
        battle_menu(character_choice)
    end
end

def battle_opening(character_choice)
    
    monster = Monster.all.sample
    
    weapon = weapon_select
    system("clear")
    puts ""
    puts "Weapon - #{weapon.name}".black.on_red
    puts "Damage: #{weapon.damage}, Defense: #{weapon.defense}".light_yellow
    system("imgcat ./lib/pic/#{weapon.picture}")

    ap = character_choice.attack_power + weapon.damage
    d = character_choice.defense + weapon.defense
    if d < 0
        d = 0
    end
    
    puts ""
    puts "Character - #{character_choice.name}".black.on_red
    puts "Hit Points - #{character_choice.hit_points}".light_green.on_black
    puts "Attack Power - #{ap}".light_green.on_black
    puts "Defense - #{d}".light_green.on_black
    
    battle_arena(character_choice, character_choice.hit_points, monster, monster.hit_points, weapon)
    
    character_option_menu(character_choice)
end

def weapon_select
    puts ""
    puts "Weapons:".red.on_black
    Weapon.all.each.with_index(1) do |weapon, index|
        puts "#{index}. #{weapon.name}".black.on_red
        puts "Damage: #{weapon.damage}, Defense: #{weapon.defense}".light_yellow
    end

    weapon_match = nil
    while weapon_match.nil?
        
        puts "Equip yourself:".red.on_black
        weapon_choice = gets.strip
        
        if weapon_choice.to_i == 0
            weapon_match = Weapon.all.find {|weapon| weapon_choice.downcase == weapon.name.downcase}
        elsif weapon_choice.to_i >= 1 && weapon_choice.to_i <= Weapon.count
            weapon_match = Weapon.all[weapon_choice.to_i - 1]
        end
    end
    weapon_match
end

def battle_arena(character_choice, hp, monster, monster_hp, weapon)
    
    user_input = nil
    while user_input != "1" && user_input != "2"
        puts ""
        puts "1. Attack".light_yellow.on_black
        puts "2. Heal".light_yellow.on_black
        
        user_input = gets.strip
    end

    if user_input == "1"
        battle_hash = attack(character_choice, hp, monster, monster_hp, weapon)
    elsif user_input == "2"
        battle_hash = heal(character_choice, hp, monster, monster_hp, weapon)
    end

    name = character_choice.name
    monster_name = monster.name
    
    system("clear")
    puts ""
    
    puts "#{name} ".light_cyan.on_black + "attacks".light_red.on_black + " #{monster_name} for #{battle_hash[:cap]} damage!".light_cyan.on_black
    puts "#{name} ".light_cyan.on_black + "heals".light_red.on_black + " for #{battle_hash[:ch]} hit points!".light_cyan.on_black
    puts "BUT... #{monster_name} ".light_cyan.on_black + "blocks".light_red.on_black + " #{battle_hash[:md]} damage".light_cyan.on_black
    puts "#{monster_name} ".light_cyan.on_black + "bleeds".light_red.on_black + " for #{battle_hash[:mdt]} damage".light_cyan.on_black
    puts ""
    puts "#{monster_name} ".black.on_light_red + "causes".light_yellow.on_light_red + " #{name} #{battle_hash[:map]} damage".black.on_light_red
    puts "#{name} valiantly ".black.on_light_red + "defends".light_yellow.on_light_red + " for #{battle_hash[:cd]} damage!".black.on_light_red
    if battle_hash[:cdt] >= 0
        puts "#{name} ".black.on_light_red + "grunts".light_yellow.on_light_red + " for #{battle_hash[:cdt]} damage".black.on_light_red
    else
        puts "#{name} ".black.on_light_red + "restores".light_yellow.on_light_red + " #{battle_hash[:cdt].abs} health".black.on_light_red
    end
    
    puts ""
    puts "#{name}'s remaining HP: #{battle_hash[:chp]}".light_cyan.on_black
    puts "#{monster_name}'s remaining HP: #{battle_hash[:mhp]}".black.on_light_red
    
    if battle_hash[:mhp] > 0
        puts ""
        puts "#{monster_name}: #{monster.monster_verbages.sample.verbage}".light_red.on_black
    end
    
    if(battle_hash[:chp] <= 0 && battle_hash[:mhp] > 0)
        puts ""
        puts "#{monster_name} slayed #{name}".light_red.on_black
    elsif(battle_hash[:chp] > 0 && battle_hash[:mhp] <= 0)
        puts ""
        puts "You decimated #{monster_name}!".light_green.on_black
    elsif(battle_hash[:chp] <= 0 && battle_hash[:mhp] <= 0)
        puts ""
        puts "You killed each other".light_white.on_black
    else
        battle_arena(character_choice, battle_hash[:chp], monster, battle_hash[:mhp], weapon)
    end
end

def attack(character_choice, hp, monster, monster_hp, weapon)

    name = character_choice.name
    ap = character_choice.attack_power + weapon.damage
    d = character_choice.defense + weapon.defense
    if d < 0
        d = 0
    end
    
    monster_name = monster.name
    monster_ap = monster.attack_power
    monster_d = monster.defense 

    c_attack = rand(0..ap)
    c_defense = rand(0..d)

    monster_attack = rand(0..monster_ap)
    monster_defense = rand(0..monster_d)
    
    character_damage_taken = monster_attack - c_defense
    monster_damage_taken = c_attack - monster_defense
    
    if character_damage_taken < 0
        character_damage_taken = 0
    end
    if monster_damage_taken < 0
        monster_damage_taken = 0
    end

    hp -= character_damage_taken
    monster_hp -= monster_damage_taken
    
    if hp < 0
        hp = 0
    end
    if monster_hp < 0
        monster_hp = 0
    end
    
    battle_hash = {}

    battle_hash = {:chp => hp,
    :cap => c_attack,
    :cd => c_defense,
    :cdt => character_damage_taken,
    :ch => 0,
    :mhp => monster_hp,
    :map => monster_attack,
    :md => monster_defense,
    :mdt => monster_damage_taken}
end

def heal(character_choice, hp, monster, monster_hp, weapon)
    
    name = character_choice.name
    ap = character_choice.attack_power + weapon.damage
    d = character_choice.defense + weapon.defense
    if d < 0
        d = 0
    end
    
    monster_name = monster.name
    monster_ap = monster.attack_power
    monster_d = monster.defense 

    heal = rand(0..(1.5*d)).round
    monster_attack = rand(0..monster_ap)
    monster_defense = rand(0..monster_d)
    
    character_damage_taken = monster_attack - heal
    
    hp -= character_damage_taken
    
    if hp > character_choice.hit_points
        hp = character_choice.hit_points
    end

    if hp < 0
        hp = 0
    end
    if monster_hp < 0
        monster_hp = 0
    end
    battle_hash = {}

    battle_hash = {:chp => hp,
    :cap => 0,
    :cd => 0,
    :cdt => character_damage_taken,
    :ch => heal,
    :mhp => monster_hp,
    :map => monster_attack,
    :md => monster_defense,
    :mdt => 0}
end