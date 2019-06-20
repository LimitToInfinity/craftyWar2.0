def main_menu
    system("clear")
    puts welcome
    user_input = gets.strip
    case user_input
        when "1"
            if User.all.size > 0
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

def existing_user
    puts ""
    puts "Current users:".light_yellow
    User.all.each.with_index(1) do |user, index|
        puts "#{index}. #{user.name}".light_red.on_black
    end
    puts ""
    puts "Enter your user name:".light_yellow
    user_input = gets.strip
    if user_input.to_i == 0
        user_match = User.all.find do |user|
            user_input.downcase == user.name.downcase
        end
        if user_match
            system("clear")
            existing_user_menu(user_match)
        else
            system("clear")
            main_menu
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= User.all.size
        system("clear")
        existing_user_menu(User.all[user_input.to_i - 1])
    else
        system("clear")
        puts "Please enter a valid user.".light_yellow
        main_menu
    end
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

def exit_message
    puts ""
    puts "They always come back!".black.on_light_yellow
    puts ""
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
            if user_match.characters.size > 0
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
        puts ""
        puts "Races:".light_yellow.on_red
        Race.all.each.with_index(1) do |race, index|
            puts "#{index}. #{race.name}".light_cyan.on_blue
            puts "Hit Points: #{race.hit_points}, Attack Power: #{race.attack_power}, Defense: #{race.defense}".light_yellow
        end
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
        
        puts ""
        puts "Classes:".light_yellow.on_red
        BattleClass.all.each.with_index(1) do |battle_class, index|
            puts "#{index}. #{battle_class.name}".light_cyan.on_blue
            puts "Hit Points: #{battle_class.hit_points}, Attack Power: #{battle_class.attack_power}, Defense: #{battle_class.defense}".light_yellow
        end
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
        
        puts ""
        puts "Professions:".light_yellow.on_red
        Profession.all.each.with_index(1) {|profession, index| puts "#{index}. #{profession.name}".light_cyan.on_blue}
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
    puts "Choose your Race:".light_yellow.on_red
    user_input = gets.strip
    if user_input.to_i == 0
        race_match = Race.all.find {|race| race.name.downcase == user_input.downcase}
        if !race_match
            get_race
        else
            race_match
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= Race.all.size
        Race.all[user_input.to_i - 1]
    else
        get_race 
    end
end

def get_battle_class
    puts ""
    puts "Choose your Class:".light_yellow.on_red
    user_input = gets.strip
    if user_input.to_i == 0
        battle_class_match = BattleClass.all.find {|battle_class| battle_class.name.downcase == user_input.downcase}
        if !battle_class_match
            get_battle_class
        else
            battle_class_match
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= BattleClass.all.size
        BattleClass.all[user_input.to_i - 1]
    else
        get_battle_class
    end
end

def get_profession
    puts ""
    puts "Choose your Profession:".light_yellow.on_red
    user_input = gets.strip
    if user_input.to_i == 0
        profession_match = Profession.all.find {|profession| profession.name.downcase == user_input.downcase}
        if !profession_match
            get_profession
        else
            profession_match
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= Profession.all.size
        Profession.all[user_input.to_i - 1]
    else
        get_profession
    end
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
    elsif user_input.to_i >= 1 && user_input.to_i <= user_match.characters.size
        user_match.characters[user_input.to_i - 1]
    else
        get_character_name(user_match)
    end
end

def character_option_menu(character_choice)
    puts ""
    puts "Prepare yourself for battle #{character_choice.name}!".black.on_red.blink
    puts "1. Battle!".light_red.on_black
    puts "2. Change Character name".light_yellow
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
        update_name(character_choice)
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
    
    puts ""
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
        battle_arena(character_choice)
    when "2"
        system("clear")
        character_option_menu(character_choice)
    else
        battle_menu(character_choice)
    end
end

def battle_arena(character_choice)
    monster = Monster.all.sample
    
    ap = character_choice.attack_power
    hp = character_choice.hit_points
    d = character_choice.defense
    monster_ap = monster.attack_power
    monster_hp = monster.hit_points
    monster_d = monster.defense
    
    attack(character_choice.name, hp, ap, d, monster.name, monster_hp, monster_ap, monster_d)
    character_option_menu(character_choice)
end

def attack(name, hp, ap, d, monster_name, monster_hp, monster_ap, monster_d)
    puts ""
    puts "#{name}'s remaining HP: #{hp}".light_cyan.on_black
    puts "#{monster_name}'s remaining HP: #{monster_hp}".black.on_light_red
    
    puts ""
    puts "1. Attack".light_yellow.on_black
    
    gets.strip
    
    attack = rand(1..ap)
    defense = rand(1..d)
    monster_attack = rand(1..monster_ap)
    monster_defense = rand(1..monster_d)
    
    character_damage_taken = monster_attack - defense
    monster_damage_taken = attack - monster_defense
    
    if character_damage_taken < 0
        character_damage_taken = 0
    end
    if monster_damage_taken < 0
        monster_damage_taken = 0
    end

    system("clear")
    puts ""
    
    puts "#{name} ".light_cyan.on_black + "attacks".light_red.on_black + " #{monster_name} for #{attack} damage!".light_cyan.on_black
    puts "BUT... #{monster_name} ".black.on_light_red + "blocks".light_yellow.on_light_red + " #{monster_defense} damage".black.on_light_red
    puts "#{monster_name} ".black.on_light_red + "bleeds".light_yellow.on_light_red + " for #{monster_damage_taken} damage".black.on_light_red
    puts ""
    puts "#{monster_name} ".black.on_light_red + "causes".light_yellow.on_light_red + " #{name} #{monster_attack} damage".black.on_light_red
    puts "#{name} valiantly ".light_cyan.on_black + "defends".light_red.on_black + " for #{defense} damage!".light_cyan.on_black
    puts "#{name} ".light_cyan.on_black + "grunts".light_red.on_black + " for #{character_damage_taken} damage".light_cyan.on_black

    hp -= character_damage_taken
    monster_hp -= monster_damage_taken
    
    if(hp <= 0 && monster_hp > 0)
        system("clear")
        puts ""
        puts "#{monster_name} slayed #{name}".light_red.on_black
    elsif(hp > 0 && monster_hp <= 0)
        system("clear")
        puts ""
        puts "You decimated #{monster_name}!".light_green.on_black
    elsif(hp <= 0 && monster_hp <= 0)
        system("clear")
        puts ""
        puts "You killed each other".light_white.on_black
    else
        attack(name, hp, ap, d, monster_name, monster_hp, monster_ap, monster_d)
    end
end