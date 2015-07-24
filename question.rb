class Question

  attr_accessor :operator, :first_num, :second_num, :answer

  def initialize

    operators = ['+', '-', '*', '/']
    @operator = operators[Random.rand(3)]

    @first_num = Random.rand(20)
    @second_num = Random.rand(20)
    @answer = @first_num.method(@operator).(@second_num)

  end

  def new_question
    initialize  
  end

  def operator
    @operator
  end

  def first_num
    @first_num
  end

  def second_num
    @second_num
  end

  def answer
    @answer
  end

  def print_question
    "#{@first_num} #{@operator} #{@second_num}"
  end

  def print_answer
    "The answer is #{@answer}"
  end

  def solved?(response)
    response.to_i == @answer ? true : false
  end
end



