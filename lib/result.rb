class Result
  class Matched
    attr_reader :indices,:letter

    def initialize(indices, letter)
      @letter = letter 
      @indices = indices
      @won = indices.empty?
    end

    def matched?
      true
    end

    def won?
      @won
    end
  end

  class Unmatched
    attr_reader :letter
      
    def initialize(letter)
      @letter = letter 
    end
   
    def matched?
      false
    end

    def won?
      false
    end
  end
end