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
    system("imgcat ./lib/pic/Opening.jpg")
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
    User.all.each {|user| puts user.name.light_red.on_black}
    puts ""
    puts "Enter your user name:".light_yellow
    user_name = gets.strip
    user_match = User.all.find do |user|
        user_name.downcase == user.name.downcase
    end
    if user_match
        system("clear")
        existing_user_menu(user_match)
    else
        system("clear")
        main_menu
    end
end

def new_user
    puts ""
    puts "Choose your user name:".light_yellow
    new_user_name = gets.strip
    new_user = User.create(name: new_user_name)
    system("clear")
    existing_user_menu(new_user)
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
    puts "Enter Character name:".light_cyan.on_blue
    new_character_name = gets.strip

    puts ""
    puts "Races:".light_cyan.on_blue
    Race.all.each.with_index(1) {|race, index| puts "#{index}. #{race.name}".light_cyan.on_blue}
    new_race = get_race
    system("imgcat ./lib/pic/#{new_race.picture}")
    
    puts ""
    puts "Classes:".light_cyan.on_blue
    CharacterClass.all.each.with_index(1) {|character, index| puts "#{index}. #{character.name}".light_cyan.on_blue}
    new_character_class = get_character_class
    system("imgcat ./lib/pic/#{new_character_class.picture}")
    
    puts ""
    puts "Professions:".light_cyan.on_blue
    Profession.all.each.with_index(1) {|profession, index| puts "#{index}. #{profession.name}".light_cyan.on_blue}
    new_profession = get_profession
    system("imgcat ./lib/pic/#{new_profession.picture}")

    new_character = Character.create(name: new_character_name, race: new_race, character_class: new_character_class, profession: new_profession, user: user_match)

    # system("clear")
    display_character_stats(new_character)
    character_option_menu(new_character)
end

def get_race
    puts ""
    puts "Choose your Race:".light_cyan.on_blue
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

def get_character_class
    puts ""
    puts "Choose your Class:".light_cyan.on_blue
    user_input = gets.strip
    if user_input.to_i == 0
        character_class_match = CharacterClass.all.find {|character_class| character_class.name.downcase == user_input.downcase}
        if !character_class_match
            get_character_class
        else
            character_class_match
        end
    elsif user_input.to_i >= 1 && user_input.to_i <= CharacterClass.all.size
        CharacterClass.all[user_input.to_i - 1]
    else
        get_character_class
    end
end

def get_profession
    puts ""
    puts "Choose your Profession:".light_cyan.on_blue
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
    puts user_match.characters.map {|character| puts character.name.light_red.on_black}.compact
    character_choice = get_character_name(user_match)
    system("clear")
    display_character_stats(character_choice)
    character_option_menu(character_choice)
end

def get_character_name(user_match)
    puts ""
    puts "Choose your Character:".light_yellow
    user_input = gets.strip
    character_match = user_match.characters.find {|character| character.name.downcase == user_input.downcase}
    if !character_match
        get_character_name(user_match)
    else
        character_match
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
        puts ""
        puts "Enter new name".light_yellow
        new_name = gets.strip
        puts ""
        character_choice.update(name: new_name)
        system("clear")
        character_option_menu(character_choice)
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

def display_character_stats(character_choice)
    puts ""

    puts "Character - #{character_choice.name}".black.on_red
    puts ""

    puts "Race - #{character_choice.race.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.race.picture}")

    puts "Class - #{character_choice.character_class.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.character_class.picture}")

    puts "Profession - #{character_choice.profession.name}".light_green.on_black
    system("imgcat ./lib/pic/#{character_choice.profession.picture}")

    puts "Hit Point - #{character_choice.character_class.hit_points}".light_green.on_black

    puts "Attack Power - #{character_choice.character_class.attack_power}".light_green.on_black
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
    
    ap = character_choice.character_class.attack_power
    hp = character_choice.character_class.hit_points
    monster_ap = monster.attack_power
    monster_hp = monster.hit_points
    
    attack(character_choice.name, hp, ap, monster.name, monster_hp, monster_ap)
    character_option_menu(character_choice)
end

def attack(name, hp, ap, monster_name, monster_hp, monster_ap)
    puts ""
    puts "Name: #{name}, HP: #{hp}".light_cyan.on_black
    puts "Monster: #{monster_name}, HP: #{monster_hp}".black.on_light_red
    
    puts ""
    puts "1. Attack".light_yellow.on_black
    
    gets.strip
    
    attack = rand(1..ap)
    monster_attack = rand(1..monster_ap)
    
    system("clear")
    puts ""
    puts "#{name}'s attack: #{attack}".light_cyan.on_black
    puts "#{monster_name}'s attack: #{monster_attack}".black.on_light_red
    
    hp -= monster_attack
    monster_hp -= attack
    
    if(hp <= 0 && monster_hp > 0)
        system("clear")
        puts ""
        puts "You Lose!".light_red.on_black
    elsif(hp > 0 && monster_hp <= 0)
        system("clear")
        puts ""
        puts "You Win!".light_green.on_black
    elsif(hp <= 0 && monster_hp <= 0)
        system("clear")
        puts ""
        puts "It's a tie.".light_white.on_black
    else
        attack(name, hp, ap, monster_name, monster_hp, monster_ap)
    end
end