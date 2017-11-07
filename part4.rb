#Part 4: Vampires
class Vampire
  @@coven = []

  def initialize(name)
    @name = name
    @age = 0
    @in_coffin = true
    @drank_blood_today = false
  end

  #readers
  def in_coffin
    @in_coffin
  end

  def drank_blood_today
    @drank_blood_today
  end

  #writers
  def sunset
    @drank_blood_today = false
    @in_coffin = false
    @age += 1
  end

  def drink_blood
    @drank_blood_today = true
  end

  def go_home
    @in_coffin = true
  end

  #class methods
  def self.create(name)
    new_vampire =  Vampire.new(name)
    @@coven << new_vampire
    return new_vampire
  end

  def self.sunrise
    @@coven.select! do |vampire|
      vampire.in_coffin && vampire.drank_blood_today
    end
  end

  def self.sunset
    @@coven.each { |vampire| vampire.sunset}
  end

  def self.coven
    return @@coven
  end

end

mickey = Vampire.create("Mickey")
sheela = Vampire.create("Sheela")
akbar = Vampire.create("Akbar")
puts Vampire.coven.inspect
puts mickey.in_coffin
puts mickey.drank_blood_today
Vampire.sunset
puts Vampire.coven.inspect
puts sheela.in_coffin
puts sheela.drank_blood_today

mickey.drink_blood
sheela.drink_blood
mickey.go_home
akbar.go_home
puts Vampire.coven.inspect
Vampire.sunrise
Vampire.sunset
puts Vampire.coven.inspect
