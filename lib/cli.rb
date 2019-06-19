def main_menu
    puts welcome
    user_input = gets.strip
    case user_input
        when "1"
            if User.all.size > 0
                system("clear")
                existing_user
            else 
                puts ""
                puts "There are no users!"
                system("clear")
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
    puts ""
    puts "Welcome to the World of Crafty War"
    puts "Choose your DESTINY!"
    puts "1. Existing user"
    puts "2. New user!"
    puts "3. Exit"
end

def existing_user
    puts ""
    puts "Current users:"
    User.all.each {|user| puts user.name}
    puts ""
    puts "Enter your user name:"
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
    puts "Choose your user name:"
    new_user_name = gets.strip
    new_user = User.create(name: new_user_name)
    system("clear")
    existing_user_menu(new_user)
end

def exit_message
    puts ""
    puts "You'll be back!"
end

def existing_user_menu(user_match)
    user_match.reload
    puts ""
    puts "Welcome #{user_match.name}"
    puts "1. Create new Character"
    puts "2. Select a Character"
    puts "3. Main Menu"
    puts "4. Exit"
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
                puts "You don't have any characters!"
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
    puts "Enter Character name:"
    new_character_name = gets.strip

    puts ""
    puts "Races:"
    Race.all.each {|race| puts race.name}
    new_race = get_race
    
    puts ""
    puts "Classes:"
    CharacterClass.all.each {|character_class| puts character_class.name}
    new_character_class = get_character_class
    
    puts ""
    puts "Professions:"
    Profession.all.each {|profession| puts profession.name}
    new_profession = get_profession
    
    new_character = Character.create(name: new_character_name, race: new_race, character_class: new_character_class, profession: new_profession, user: user_match)
   
    system("clear")
    character_option_menu(new_character)
end

def get_race
    puts ""
    puts "Choose your Race:"
    user_input = gets.strip
    race_match = Race.all.find {|race| race.name.downcase == user_input.downcase}
    if !race_match
        get_race
    else 
        race_match
    end
end

def get_character_class
    puts ""
    puts "Choose your Class:"
    user_input = gets.strip
    character_class_match = CharacterClass.all.find {|character_class| character_class.name.downcase == user_input.downcase}
    if !character_class_match
        get_character_class
    else 
        character_class_match
    end
end

def get_profession
    puts ""
    puts "Choose your Profession:"
    user_input = gets.strip
    profession_match = Profession.all.find {|profession| profession.name.downcase == user_input.downcase}
    if !profession_match
        get_profession
    else 
        profession_match
    end
end

def character_menu(user_match)
    puts ""
    puts "Your characters:"
    puts user_match.characters.map {|character| puts character.name}.compact
    character_choice = get_character_name(user_match)
    system("clear")
    character_option_menu(character_choice)
end

def get_character_name(user_match)
    puts ""
    puts "Choose your Character:"
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
    puts "Prepare yourself for battle #{character_choice.name}!"
    puts "1. Battle!"
    puts "2. Change Character name"
    puts "3. Display Character stats"
    puts "4. Delete Character"
    puts "5. User Menu"
    puts "6. Main Menu"
    puts "7. Exit"
    user_input = gets.strip
    case user_input
        when "1"
            system("clear")
            battle_menu(character_choice)
        when "2"
            puts ""
            puts "Enter new name"
            new_name = gets.strip
            puts ""
            character_choice.update(name: new_name)
            system("clear")
            character_option_menu(character_choice)
        when "3"
            system("clear")
            puts ""
            puts "Character - #{character_choice.name}"
            puts "Race - #{character_choice.race.name}"
            puts "Class - #{character_choice.character_class.name}"
            puts "Profession - #{character_choice.profession.name}"
            puts ""
            character_option_menu(character_choice)
        when "4"
            puts ""
            puts "Are you sure? y/n"
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

def battle_menu(character_choice)
    puts ""
    puts "PREPARE FOR BATTLE!!!"
    puts ""
    puts "A MONSTER approaches!"
    puts ""
    puts "1. Fight!"
    puts "2. RUNNNNN"
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

def battle_arena
    puts ""
    puts "1. Attack"
end