require_relative "testing_library"

goal_message = "GOOOOOOOAL!!!!"
team_list = "Brazil, Mexico, Cameroon, Croatia, Netherlands, Chile, Australia, Spain, Germany, Ghana, US, Protugal"
long_string = <<-world_cup_news
  Clint, Dempsey, put, the, U.S.,
  ahead, in, the, first, minute,
  of, its, World, Cup, opener.
world_cup_news

# enter your solutions inside the methods
def goal(message)
  message*2
end

def generate_an_array_of_teams(teams)
  teams.gsub(' ', '').split(',')
end

def number_of_teams(teams)
  teams.split(', ').size
end

def return_australia(teams)
  teams.split(', ')[6]
end

def starts_with_C(teams)
  team_list = teams.split(', ')
  team_list.collect { |team| team if team[0] == 'C' }.compact
end

def block_string_to_single_line(block_string)
  block_string.strip.gsub(',', '').gsub("\n ", '')
end

def capitalize_every_third_word(block_string)
  word_list = block_string.strip.gsub(',', '').gsub("\n ", '').downcase.split(' ')
  capitalize_every_third_word = ''
  word_list.each_with_index do |word, index|
    if (index+3)%3 == 0
      capitalize_every_third_word += "#{word.capitalize} "
    else
      capitalize_every_third_word += "#{word} "
    end
  end
  capitalize_every_third_word.strip
end

check("goal method", goal(goal_message) == "GOOOOOOOAL!!!!GOOOOOOOAL!!!!")
check("generate_an_array_of_teams method",
      generate_an_array_of_teams(team_list) == ["Brazil", "Mexico", "Cameroon", "Croatia", "Netherlands", "Chile", "Australia", "Spain", "Germany", "Ghana", "US", "Protugal"])
check("number_of_teams method", number_of_teams(team_list) == 12)
check("return_australia method", return_australia(team_list) == 'Australia')
check("starts_with_C method", starts_with_C(team_list) == ['Cameroon', 'Croatia', 'Chile'])
check("block_string_to_single_line method",
      block_string_to_single_line(long_string) == "Clint Dempsey put the U.S. ahead in the first minute of its World Cup opener.")
check("capitalize_every_third_word method",
      capitalize_every_third_word(long_string) == "Clint dempsey put The u.s. ahead In the first Minute of its World cup opener.")

