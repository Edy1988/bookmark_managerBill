class Bookmark

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def self.all
    [
      "http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
    ]
  end
end
