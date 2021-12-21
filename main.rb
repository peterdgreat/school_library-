require './book'
require './person'
require './rental'
require './student'
require './teacher'
class GetStudent
  def get_student
    puts 'Name'
    name = gets.chomp
    puts 'Age'
    age = gets.chomp
    puts 'Has parent permission (Y/N)'
    has_permission = gets.chomp
    has_permission = has_permission == 'y'
    return [name, age, has_permission]
  end
end

class AddStudent
  def add_student(student)
    student = Student.new(student[1], '', student[0], parent_permission: student[2])
  puts 'Student created successfully'
  student
  end
end

class GetTeacher
  def get_teacher
    puts 'Name'
    name = gets.chomp
    puts 'Age'
    age = gets.chomp
    puts 'Specialization'
    specialization = gets.chomp
    return [name, age, specialization]
  end
end

class AddTeacher
  def add_teacher(teacher)
    teacher = Teacher.new(teacher[1], teacher[2], teacher[0], parent_permission: nil)
    puts 'Teacher created successfully'
    teacher
  end
end

class AddPerson
  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)'
    number = gets.chomp
    case number
    when '1'
     student = GetStudent.new.get_student
     AddStudent.new().add_student(student)
    when '2'
     teacher = GetTeacher.new.get_teacher
     AddTeacher.new().add_teacher(teacher)
    end
  end
end

class ListPeople
  def list_all_people(people)
    people.each_with_index do |p, i|
      if p.is_a?(Student)
        puts "#{i + 1}- [Student] Name : #{p.name} , Age : #{p.age}, Id: #{p.id} "
      else
        puts "#{i + 1}- [Teacher] Name : #{p.name} , Age : #{p.age}, Id: #{p.id}"
      end
    end
  end
end

class AddBook
  def add_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    puts 'Book created successfully!'
    book
  end
end

def list_all_books(books)
  books.each_with_index do |b, i|
    puts "#{i + 1}- Title : #{b.title} , Author : #{b.author}"
  end
end

class AddRental
  def add_rental(people, books)
    puts 'Select a person from the following'
    ListPeople.new.list_all_people(people)
    p_index = gets.chomp
    puts 'Select a book from the following'
    list_all_books(books)
    b_index = gets.chomp

    puts 'Date : '
    date = gets.chomp

    rental = Rental.new(date, people[p_index.to_i - 1], books[b_index.to_i - 1])
    puts 'Rental created successfully'
    rental
  end
end

def list_rental_for_person_id(rentals)
  puts 'Rentals : '
  rentals.each_with_index do |r, _i|
    puts "Date : #{r.date} Book: #{r.book.title} By #{r.book.author} "
  end
end

def choose_list
  puts 'Please choose on option by enterin a number',
       '1- List all books',
       '2- List all people',
       '3- Create a person',
       '4- Create a book',
       '5- Create a rental',
       '6- List all persons for a given person id',
       '7- Exit'
  gets.chomp
end

def condition(num, people, books, rentals)
  case num
  when '1'
    list_all_books(books)
  when '2'
    ListPeople.new.list_all_people(people)
  when '3'
    person = AddPerson.new.add_person
    people << person
  when '4'
    book = AddBook.new.add_book
    books << book
  when '5'
    rental = AddRental.new.add_rental(people, books)
    rentals << rental
  when '6'
    list_rental_for_person_id(rentals)
  end
end

def check(num)
  people = []
  books = []
  rentals = []
  while num != '7'
    condition(num, people, books, rentals)
    num = choose_list
  end
end

def main
  puts 'Welcome Shool Library App!'
  num = choose_list
  check(num)
end

main
