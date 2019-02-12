class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

   def self.find(id, db)
    new_poke = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: new_poke[0], name: new_poke[1], type: new_poke[2], db: db, hp: new_poke[3])
  end

  def alter_hp(hp, db)
   db.execute("UPDATE pokemon SET hp=? WHERE id=?", @hp, @id).flatten
 end
end
