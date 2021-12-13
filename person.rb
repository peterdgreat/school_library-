class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :id, :name, :age

  def of_age?
    @age > 18
  end

  def can_use_services?
    @age > 18 or @parent_permission == true
  end
  private :is_of_age?
  public :can_use_services?
end
