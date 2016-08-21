module Shout
  def self.yell_angrily(words)
    words + '!!!' + ' :('
  end

  def self.yelling_happily(words)
    words + '!!!' + ' :)'
  end
end

p Shout.yell_angrily('I am sooo mad')
p Shout.yelling_happily('Today is sooo great')
