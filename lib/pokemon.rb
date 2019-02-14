require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: , name: , type: , db: )
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT pokemon.name, pokemon.type FROM pokemon WHERE pokemon.id=?", id)
    self.new(id: id, name: found_pokemon[0][0], type: found_pokemon[0][1], db: db)
  end


end
