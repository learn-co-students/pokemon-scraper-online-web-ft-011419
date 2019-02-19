class Pokemon

attr_accessor :id, :name, :type, :db

@@all = []

  def initialize (id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  @@all << self
  end

  def alter_hp(alter, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?))",alter, @id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    @@all.find {|item| item.id == id}
  end

end
