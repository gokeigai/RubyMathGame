=begin
  
Math generates questions.

operator = ['+', '-', '*', '/']
operator.map {|o| 2.method(o).(2) }
# => [4, 0, 4, 1]

Numbers rand 1-20
rand(20)

-setter answer and question 

random_question
- save to @answer
- save to @question
- return string

solve
- player  input
- return bool whether solved

  
=end

@answer = 0
@question = []
@current_player = 0
@player_lives = [3, 3]
@player_points = [0, 0]
@operators = ['+', '-', '*', '/']
@operator = ""

def change_turn()
  if @current_player == 0
    @current_player = 1
  else
    @current_player = 0
  end
end

def random_question()
  @operator = @operators[Random.rand(3)]
  first_num = Random.rand(20)
  second_num = Random.rand(20)
  @question.push(first_num).push(second_num)
  str_question = first_num.to_s + " " + @operator + " " + second_num.to_s
end

def clear_question()
  @question = []
end

def lost?(player)
  @player_lives[player] == 0 ? true : false
end

def print_status()
  puts "Lives | Player 1: #{@player_lives[0]}  Player 2 #{@player_lives[1]}"
  puts "Scores| Player 1: #{@player_points[0]}  Player 2 #{@player_points[1]}"
end

def lose_life(player)
  @player_lives[player] -= 1
end

def solved?(answer)
  correct = @question[0].method(@operator).(@question[1])
  print @question[0], @operator, @question[1], " = ", correct,":", answer
  answer.to_i == correct ? true : false
end