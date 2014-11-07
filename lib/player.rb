class Player
  attr_reader :used_letters, :correct_letters

  def initialize(word_length)
    @used_letters = Array.new
    @correct_letters = Array.new(word_length).fill("_")
  end

  def update(result)
    record_used_letter(result.letter)
    record_correct_letter(result) if result.matched?
  end

  private
  
  def record_used_letter(letter)
    @used_letters.push(letter)
  end

  def record_correct_letter(result)
    result.indices.each { |i| correct_letters[i] = result.letter }
  end
end