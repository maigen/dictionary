require './lib/dictionary'

@name = ''

def main_menu
  puts "Welcome to the Word Repository. What is your name?\n\n"
  @name = gets.capitalize.chomp
  top_menu
end

def top_menu
  puts "\n\nHow may we help you, #{@name}?\n\n"
  puts "To enter a new Term, please press 'T'. To see all terms, please press 'S'. \n\n"
  puts "To find a specific word, please press 'F'. To exit the Word Repository, please press 'X'.\n\n"
  entry = gets.chomp
  case entry
  when 't', 'T'
    enter_term
  when 's', 'S'
    see_term
  when 'f', 'F'
    search_menu
  when 'x', 'X'
    puts "We hope you enjoyed your time with us, #{@name}!\n"
  when 'o','O'
    puts "You have entered a secret keyword. You are being hypnotized. You are getting sleeeeeepy.\n"
    puts "*****ZZZZzzzzzz*****"
  else
    puts "I'm sorry, I can't do that, #{@name}. Please try again.\n\n"
    top_menu
  end
end

def enter_term
  puts "What is the word you would like to enter?\n"
  word = gets.chomp
  puts "What is the definition of #{word}?\n"
  definition = gets.chomp
  puts "Great! We have added #{word} with the definition of '#{definition}'. Thank you for your entry!\n\n"
  new_term = Term.create(word, definition)
  see_term
end

def see_term
  puts "#{@name}, here is a list of all your BEAUTIFUUUUL terms!!!! \n"
  puts "---------------------------------------------------- \n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word} - #{term.definition}"
    end
  puts "---------------------------------------------------- \n"
  edit_option
end

def edit_option
  puts "If you made a mistake and need to edit a term, please press 'E'. If you want to add another term, please press 'T'. If you want to delete a term, please press 'D'. Otherwise press any key to be taken to the previous menu.\n\n"
  entry = gets.chomp
  case entry
  when 'e', 'E'
    edit_menu
  when 't', 'T'
    enter_term
  when 'd', 'D'
    delete_menu
  else
    top_menu
  end
end

def edit_menu
  puts "Oh no! Did we make a mistake? Please choose the number of the entry you would like to edit!\n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word} - #{term.definition}"
  end
  entry = gets.chomp.to_i
  puts "---------------------------------------------------- \n"
  puts "Would you like to edit the word '#{Term.all[entry-1].word}'? Press 'W'.\n"
  puts "Or would you like to edit the definition, '#{Term.all[entry-1].definition}'? Press 'D'.\n"
  puts "---------------------------------------------------- \n"
  entry2 = gets.chomp
  case entry2
  when 'w', 'W'
    puts "Please enter the edited word. Please remember this *replaces* the previous word."
    user_word = gets.chomp
    Term.all[entry-1].word.replace(user_word)
    puts Term.all[entry-1].word
    see_term
  when 'd', 'D'
    puts "Please enter the edited definition. Please remember this *replaces* the previous definition."
    user_definition = gets.chomp
    Term.all[entry-1].definition.replace(user_definition)
    puts Term.all[entry-1].definition
    see_term
  end
end

def delete_menu
  puts "Oh no! We're sad to see words go! To delete a word, please choose the number of the entry you would like to delete!\n"
  Term.all.each_with_index do |term, index|
    puts "#{index+1}. #{term.word}"
  end
  entry = gets.chomp.to_i
  Term.all.delete_at(entry-1)
  see_term
end

def search_menu
  puts "What word would you like to find the definition of?"
  search_term = gets.chomp
  Term.search(search_term)
  puts "\n\n Searching! ¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>\n\n"
  if term.word == search_term
    puts "Good news! The "



  # Term.all.each do |key|
  #   if key.word == search_term
  #     puts "\n\n Searching! ¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>\n\n"
  #     puts key.word + ": " + key.definition
  #     top_menu
  #   elsif key.word != search_term
  #     puts "\n\n٩(͡๏̯͡๏)۶\n\n"
  #     puts "Sorry, we didn't find that word in this repository. How about entering it?\n\n"
  #     enter_term
  #   end
  # end
end


main_menu
