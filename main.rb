require "./question.rb"
require "./player.rb"
require "./color.rb"


puts "Welcome to Math Blitz (tmp)"
puts "Use \"done\" to stop the game: "

num_of_players = 2
players = []
question = Question.new()
game_on = true

for i in 1..num_of_players
  tmp_player = Player.new("Player #{i}")
  players.push(tmp_player)
end

while game_on
  players.cycle { |player|

    question.new_question

    puts "--------------"
    puts "#{player.name} Your Question:"
    puts "--------------"

    puts question.print_question
    response = gets.chomp
    if response == "done"
      #get out outer
      game_on = false
      #get out inner
      break
    else
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
    end
  }

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