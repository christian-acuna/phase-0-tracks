# module Shout
#   def self.yell_angrily(words)
#     words + '!!!' + ' :('
#   end
#
#   def self.yelling_happily(words)
#     words + '!!!' + ' :)'
#   end
# end
#
# p Shout.yell_angrily('I am sooo mad')
# p Shout.yelling_happily('Today is sooo great')


module Shout
  def yell_angrily(words)
    words + '!!!' + ' :('
  end

  def yelling_happily(words)
    words + '!!!' + ' :)'
  end
end

class Man
  include Shout
end

class Woman
  include Shout
end

jack = Man.new
p jack.yell_angrily('I am sooo mad')
p jack.yelling_happily('Today is sooo great')

jill = Woman.new
p jill.yell_angrily('Agh! I am mad at Jack')
p jill.yelling_happily('I love my dog')
