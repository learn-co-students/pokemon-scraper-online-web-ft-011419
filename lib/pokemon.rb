require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(given_name, given_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", given_name, given_type)
  end
  
  def self.find(given_id, db)
    new_info = db.execute("SELECT * FROM pokemon WHERE id = (?)", given_id).flatten
    Pokemon.new(id: new_info[0], name: new_info[1], type: new_info[2], hp: new_info[3], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
  end
  
end