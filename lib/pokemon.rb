class Pokemon


attr_accessor :id, :name, :type, :db
def initialize ( id:, name:, type:, db:nil)
@id=id
@name= name
@type =type
@db =db

end


def self.save(name, type, db)
db.execute("INSERT INTO Pokemon  (name, type) VALUES (?, ?)",name, type)
end


def self.find(id,db)
file = db.execute("SELECT * FROM pokemon WHERE id= ?" ,id).flatten
Pokemon.new(id:file[0], name:file[1], type:file[2])
end













end
