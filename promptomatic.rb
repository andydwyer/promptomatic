@adjectives = []
@nouns = []
@filename = "adj_noun.csv"

def load_words(filename)
    File.readlines(filename).each do |line|
        adjective, noun = line.split(",")
        @adjectives << adjective unless adjective.nil? || adjective.empty?
        @nouns << noun unless noun.nil? || noun.empty?
    end
end

def get_article
    ["the", "a"].sample
end

def a_or_an(article, word)
    (article == "a" && word.start_with?("a", "e", "i", "o", "u")) ? "an" : article
end

def generate_prompt
    first_word = @adjectives.sample
    article = a_or_an(get_article, first_word)
    "#{article} #{first_word} #{@adjectives.sample} #{@nouns.sample}"
    #TODO: case to handle diff arguments for short, med, long prompts
end

load_words(@filename)
puts generate_prompt