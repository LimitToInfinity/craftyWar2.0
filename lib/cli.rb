def main_menu
    puts welcome
    user_input = gets.strip.downcase
    case user_input
        when "1"
            if User.all.size > 0
            existing_user
            else puts ""
                puts "There are no users!"
                main_menu
            end
        when "2"
            new_user
        when "3"
            exit_message
        else main_menu
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
        existing_user_menu(user_match)
    else main_menu
    end
end

def new_user
    puts ""
    puts "Choose your user name:"
    new_user_name = gets.strip
    new_user = User.create(name: new_user_name)
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
            character_creation(user_match)
        when "2"
            if user_match.characters.size > 0
                character_menu(user_match)
            else puts ""
                puts "You don't have any characters!"
                existing_user_menu(user_match)
            end
        when "3"
            main_menu
        when "4"
            exit_message
        else existing_user_menu(user_match)
    end
end

def character_creation(user_match)
    puts ""
    puts "Enter Character name:"
    new_character_name = gets.strip
    puts ""
    puts "Choose your Race:"
    Race.all.each {|race| puts race.name}
    new_race = get_race
    puts ""
    puts "Choose your Class:"
    CharacterClass.all.each {|character_class| puts character_class.name}
    new_character_class = get_character_class
    puts ""
    puts "Choose your Profession:"
    Profession.all.each {|profession| puts profession.name}
    new_profession = get_profession
    new_character = Character.create(name: new_character_name, race: new_race, character_class: new_character_class, profession: new_profession, user: user_match)
    character_option_menu(new_character)
end

def get_race
    puts "Choose your Race:"
    user_input = gets.strip
    race_match = Race.all.find {|race| race.name.downcase == user_input.downcase}
    if !race_match
        get_race
    else race_match
    end
end

def get_character_class
    puts "Choose your Class:"
    user_input = gets.strip
    character_class_match = CharacterClass.all.find {|character_class| character_class.name.downcase == user_input.downcase}
    if !character_class_match
        get_character_class
    else character_class_match
    end
end

def get_profession
    puts "Choose your Profession:"
    user_input = gets.strip
    profession_match = Profession.all.find {|profession| profession.name.downcase == user_input.downcase}
    if !profession_match
        get_profession
    else profession_match
    end
end

def get_character_name(user_match)
    puts "Choose your Character:"
    user_input = gets.strip
    character_match = user_match.characters.find {|character| character.name.downcase == user_input.downcase}
    if !character_match
        get_character_name(user_match)
    else character_match
    end
end

def character_menu(user_match)
    puts ""
    puts "Your characters:"
    puts user_match.characters.map {|character| puts character.name}.compact
    puts ""
    puts "Enter Character name:"
    character_choice = get_character_name(user_match)
    character_option_menu(character_choice)
end

def character_option_menu(character_choice)
    puts ""
    puts "Prepare yourself for battle #{character_choice.name}!"
    puts "1. Change Character name"
    puts "2. Display Character stats"
    puts "3. Delete Character"
    puts "4. User Menu"
    puts "5. Main Menu"
    puts "6. Exit"
    user_input = gets.strip
    case user_input
        when "1"
            puts ""
            puts "Enter new name"
            new_name = gets.strip
            puts ""
            character_choice.update(name: new_name)
            character_option_menu(character_choice)
        when "2"
            puts ""
            puts "Character - #{character_choice.name}"
            puts "Race - #{character_choice.race.name}"
            puts "Class - #{character_choice.character_class.name}"
            puts "Profession - #{character_choice.profession.name}"
            puts ""
            character_option_menu(character_choice)
        when "3"
            puts "Are you sure? y/n"
            if gets.strip.downcase == "y"
                character_choice.delete
                existing_user_menu(character_choice.user)
            else character_option_menu(character_choice)
            end
        when "4"
            existing_user_menu(character_choice.user)
        when "5"
            main_menu
        when "6"
            exit_message
        else character_option_menu(character_choice)
    end
end