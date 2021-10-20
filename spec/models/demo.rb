class Reverse
  attr_accessor : text
  def initialize(text)
    @text = text
  end

  def reverse_words
    result = @text.split(" ").reverse.jo
    puts result
  end
end

reverse_obj = Reverse.new