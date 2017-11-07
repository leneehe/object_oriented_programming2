#Part 3: Zombie Apocalypse
class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

#Instance method
  def initialize(speed, strength)

    if speed > @@max_speed
      @speed = @@default_speed
    else
      @speed = speed
    end

    if strength > @@max_strength
      @strength = @@default_strength
    else
      @strength = strength
    end
  end

  def encounter
    if survive_attack? == false
      return "You did not survive from zombie attack and got destroyed. RIP."
    else
      if outrun_zombie? == false
        speed = rand(@@max_speed)
        strength = rand(@@max_strength)
        @@horde << Zombie.new(speed, strength)
        return "You did not outrun zombie and have turned into a Zombie! D:"
      else
        return "Whew! You escaped from zombie attack!"
      end
    end
  end

  def outrun_zombie?
    your_speed = rand(@@max_speed)
    if your_speed > @speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    your_strength = rand(@@max_strength)
    if your_strength > @strength
      return true
    else
      return false
    end
  end

  def speed
    @speed
  end

  def strength
    @strength
  end

#Class method
  def self.all
    return @@horde
  end

  def self.new_day
    Zombie.some_die_off
    Zombie.spawn
    Zombie.increase_plague_level
  end

  def self.some_die_off
    @@horde.shift(rand(11))
  end

  def self.spawn
    number_of_zombies = rand(@@plague_level)
    (1..number_of_zombies).each do
      speed = rand(@@max_speed)
      strength = rand(@@max_strength)
      @@horde << Zombie.new(speed, strength)
    end
  end

  def self.increase_plague_level
    @@plague_level += rand(3)
  end

  def self.deadliest_zombie
    deadliest_one = nil
    best_speed = 0
    best_strength = 0
    @@horde.each { |zombie|
      if zombie.speed >= best_speed && zombie.strength >= best_strength
        deadliest_one = zombie
        best_speed = zombie.speed
        best_strength = zombie.strength
      end
    }
    return deadliest_one
  end

end

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
puts Zombie.all.inspect
puts Zombie.deadliest_zombie.inspect
