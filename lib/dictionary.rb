class Term

  @@all_terms = []
  @@all_definitions = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def Term.all
    @@all_terms
  end

  def save
    @@all_terms << self
  end

  def Term.search(searchword)
    # @search_word = searchword
    Term.all.each do |term|
      if term.word == searchword
         return term.word
        # i.word + " " + i.definition
      end
    end
  end
end

