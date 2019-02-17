class Pokemon
  attr_accessor :id,:db,:name,:type,:hp

  def initialize(id:,name:,type:,db:, hp:nil)

    @id, @name, @type, @hp, @db = id, name, type, hp, db
    
  end

  # def save(pk_name, pk_type,db)
  #
  # end
  #
  # # def self.find(pk_name, pk_type,db)
  #
  # end
end
