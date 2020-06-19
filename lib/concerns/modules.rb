module Concerns

module Findable

  def find_by_name(name)
      self.all.find{|song| song.name == name}
  end

  def alphabetized
    self.all.sort {|x, y| x.name <=> y.name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) == NIL
      self.create(name)
    else
      self.find_by_name(name)
    end
  end
end
end
