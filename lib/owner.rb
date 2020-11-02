class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name) 
    @name = name 
    @species = "human"
    save
  end 

  def say_species
    return "I am a human."
  end 
  
  def save 
    @@all << self
  end 

  def self.all
    @@all
  end 

  def self.count 
    @@all.count
  end 
  
  def self.reset_all
    @@all.clear
  end

  def cats 
     Cat.all.select {|c| c.owner == self}
    
  end 

  def dogs
     Dog.all.select {|d| d.owner == self}
    
  end 
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end 

  def walk_dogs
    Dog.all.collect {|d| d.mood = "happy"}
  end 

  def feed_cats 
    Cat.all.collect {|c| c.mood = "happy"}
  end
  def sell_pets 
    Dog.all.collect {|d| d.mood = "nervous" ; d.owner = nil }
    Cat.all.collect {|c| c.mood = "nervous" ; c.owner = nil }
  end 
  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
end