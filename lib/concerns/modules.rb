module Concerns

module Findable

  def find_by_name(name)
      self.all.find{|song| song.name == name}
  end

  # def self.find_or_create_by_name(name)
  #   if self.class.all.find {|self.class| self.class.name == name}
  #     all.find {|self.class| self.class.name == name}
  #   else
  #     self.new(name)
  #   end
  # end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == NIL
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
end
