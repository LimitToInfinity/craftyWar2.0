def main_menu
    puts welcome
    user_input = gets.strip.downcase
    case user_input
        when "1"
            existing_user
        when "2"
            new_user
        when "3"
            exit_message
        else main_menu
    end
end

def welcome
    puts "Welcome to the World of Crafty War"
    puts "Choose your DESTINY!"
    puts "1. Enter existing user"
    puts "2. Create new user!"
    puts "3. Exit"
end

def existing_user
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
    puts "Choose your user name:"
    new_user_name = gets.strip
    User.create(name: new_user_name)
end

def exit_message
    puts "They always come back!"
end

def existing_user_menu(user_match)
    puts "Welcome #{user_match.name}"
    puts "1. Create new Character"
    puts "2. Select a Character"
    user_input = gets.strip
    case user_input
        when "1"
            character_creation(user_match)
        when "2"
            character_menu
        else existing_user_menu(user_match)
    end
end

def character_creation(user_match)
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
    char1 = Character.create(name: new_character_name, race: new_race, character_class: new_character_class, profession: new_profession, user: user_match)
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

def character_menu
    puts "This is the character menu."
    # puts user_match.characters.each {|character| puts character.name }
    # puts "Enter Character name:"
end