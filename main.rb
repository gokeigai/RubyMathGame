require "./question.rb"
require "./player.rb"
require "./color.rb"
require "./invalid.rb"

include Invalid

def ask_name(player_number)
  puts "Enter Player #{player_number} name:"
  name = gets.chomp
end

puts "Welcome to Math Blitz"
puts "How many players?"
num_of_players = gets.chomp.to_i
players = []
question = Question.new()
game_on = true

if num_of_players.nil? || num_of_players < 2
  num_of_players = 2
  puts "No number detected, setting game to 2 players"
end

for i in 1..num_of_players
  begin
    name = ask_name(i)
    raise InvalidPlayerName if name.empty?
  rescue InvalidPlayerName, "Name cannot be empty"
    redo
  end
  tmp_player = Player.new(name)
  players.push(tmp_player)
end

while game_on

  counter = 0 

  # inner loop for game
  while true
    begin
      current = counter % players.length
      player = players[current]

      question.new_question

      puts "--------------"
      puts "#{player.name} Your Question:"
      puts "--------------"

      puts question.print_question
      response = gets.chomp

      raise InvalidGuessError if response =~ /\D/
    rescue InvalidGuessError, "Sorry that wasn't a number"
      redo
    end
      solved = question.solved?(response)
      if solved
        puts green("Correct!")
        player.add_score
      else
        puts red("Incorrect!")
        player.lose_life
      end

      puts question.print_answer

      players.each do |player|
        puts player.print_status 
      end

      if player.lost?
          game_on = false
          break
      end

      counter += 1
  end

  winner = -1

  (players.length-1).times do |i|
    if players[i].points < players[i+1].points
      winner = i+1
    elsif players[i].points == players[i+1].points
      #keep winner at -1
    else
      winner = i
    end
  end

  #if a tie nobody wins
  unless winner < 0
    players[winner].player_won
  end

  players.each do |player|
    puts player.print_final_result
    puts player.print_status
  end

  if game_on == false
    puts "New game? Y/N"
    continue = gets.chomp.upcase
    if continue == "Y" 
      game_on = true
    end
  end

end