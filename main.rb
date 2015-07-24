require "./logic.rb"


puts "Welcome to Math Blitz"
puts "Use \"done\" to stop the game: "

while (true)

  print_status

  puts "Question:"
  puts random_question
 
  print "Player #{@current_player+1} Answer please: "
  player_input = gets.chomp

  if player_input == "done"
    break
  else
    solve_status = solved?(player_input)  
    if(solve_status)
      puts "Good Job!"
      add_score(@current_player)
    else

      puts "Sorry wrong answer"
      lose_life(@current_player)
      puts "Player #{@current_player+1} current life: #{@player_lives[@current_player]}"
    
      if(lost?(@current_player))
        puts "Player #{@current_player+1} lost"
        print_status
        break
      end
    end
    clear_question
    change_turn
  end

end