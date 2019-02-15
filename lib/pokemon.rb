class Pokemon
  
  @@all = []
  
  attr_accessor :name, :id, :db, :type
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES ('#{name}', '#{type}')") 
    end
  
  def self.find(id, db)
    pokemon_id = db.execute("SELECT * FROM pokemon WHERE pokemon.id ='#{id}'")
    self.new(id: id, name: pokemon_id[0][1], type: pokemon_id[0][2], db: db)
  end
end