class Pokemon


attr_accessor :id, :name, :type, :db, :hp
def initialize ( id:, name:, type:, db:nil, hp:)
@id=id
@name= name
@type =type
@db =db
@hp = hp
end


def self.save(name, type, db,hp)
db.execute("INSERT INTO Pokemon  (name, type,hp) VALUES (?, ?,?)",name, type,hp)
end


def self.find(id,db)
file = db.execute("SELECT * FROM pokemon WHERE id= ?" ,id).flatten
Pokemon.new(id:file[0], name:file[1], type:file[2], hp:file[3])
end






end






end
