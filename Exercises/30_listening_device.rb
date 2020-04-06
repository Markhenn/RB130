# Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.
#
# Problem
# read in a text file and analyse the text based on the block given to process


class TextAnalyzer
  def process
    file = File.open('sample_text1', 'r')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.readlines.size} lines" }
analyzer.process { |file| puts "#{file.read.split.size} words" }
analyzer.process { |file| puts "#{file.read.split(/\n\n/).size} paragraphs" }
