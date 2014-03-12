require 'rspec'
require 'dictionary'

describe 'Term' do
  it 'is initialized with word and definition' do
    new_term = Term.new('gum', 'yummie')
    new_term.should be_an_instance_of Term
  end

  describe 'word' do
    it 'saves/stores/returns the word' do
      new_term = Term.new('gum', 'yummie')
      new_term.word.should eq 'gum'
    end
  end

  describe 'definition' do
    it 'saves/stores/returns the definition' do
      new_term = Term.new('gum', 'yummie')
      new_term.definition.should eq 'yummie'
    end
  end

  describe '.all' do
    it 'starts as an empty array' do
      Term.all.should eq []
    end
  end

  describe '.create' do
    it 'adds and saves the instance to all_terms array' do
      test_term = Term.create('gum', 'yummie')
      Term.all.should eq [test_term]
    end
  end

end
