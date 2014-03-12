class Term

  @@all_terms = []

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

end

