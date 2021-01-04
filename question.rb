class Question
  attr_reader :num1, :num2, :ans, :question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @ans = num1 + num2
    @question = "What does #{num1} plus #{num2} equal?"
  end

  def correct
    puts "YES! You are correct."
  end

  def incorrect
    puts "Seriously? No!"
  end
end