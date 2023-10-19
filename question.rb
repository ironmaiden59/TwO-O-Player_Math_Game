class Question
  attr_reader :number1, :number2, :answer

  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def is_correct?(user_answer)
    @answer == user_answer
  end
end