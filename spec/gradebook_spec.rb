require 'rspec'
require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do
  it "exists" do
    gradebook = Gradebook.new("Jimbo")

    expect(gradebook).to be_a(Gradebook)
  end

  it "has readable attributes" do
    gradebook = Gradebook.new("Jimbo")

    expect(gradebook.instructor).to eq("Jimbo")
    expect(gradebook.courses).to eq([])
  end
end

describe "#add_course" do
  it "can addcourses to the gradebook" do
    gradebook = Gradebook.new("Jimbo")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("English", 3)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end
end

describe "#list_all_students" do
  it "can list all of the students in its courses" do
    gradebook = Gradebook.new("Jimbo")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("English", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Olivia", age: 28})
    student4 = Student.new({name: "Max", age: 27})

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    expect(gradebook.list_all_students).to eq({
      "Calculus" => [student1, student2],
      "English" => [student3, student4]
  })
  end
end

describe "#students_below" do
  it "can return a list of students whose grades are below a given threshold" do
    gradebook = Gradebook.new("Jimbo")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("English", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Olivia", age: 28})
    student4 = Student.new({name: "Max", age: 27})

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    student1.log_score(100)
    student1.log_score(90)
    student1.log_score(85)

    student2.log_score(90)
    student2.log_score(82)
    student2.log_score(71)

    student3.log_score(80)
    student3.log_score(74)
    student3.log_score(69)

    student4.log_score(70)
    student4.log_score(54)
    student4.log_score(45)

    expect(gradebook.students_below(90)).to eq([student2, student3, student4])
  end
end

describe "#all_grades" do
  it "can return a hash ofwhere the `key` is a `Course` object and the `value` is an `Array` of all the grades for that course" do
    gradebook = Gradebook.new("Jimbo")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("English", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})
    student3 = Student.new({name: "Olivia", age: 28})
    student4 = Student.new({name: "Max", age: 27})

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    student1.log_score(100)
    student1.log_score(90)
    student1.log_score(85)

    student2.log_score(90)
    student2.log_score(82)
    student2.log_score(71)

    student3.log_score(80)
    student3.log_score(74)
    student3.log_score(69)

    student4.log_score(70)
    student4.log_score(54)
    student4.log_score(45)

    expect(gradebook.all_grades).to eq({
      course1 => [91.66666666666667, 81.0],
      course2 => [74.33333333333333, 56.333333333333336]
    })
  end

  describe "#students_in_range" do
    it "can find all students across all courses that have a grade in a given range" do
      gradebook = Gradebook.new("Jimbo")
      course1 = Course.new("Calculus", 2)
      course2 = Course.new("English", 3)
      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Jordan", age: 29})
      student3 = Student.new({name: "Olivia", age: 28})
      student4 = Student.new({name: "Max", age: 27})

      gradebook.add_course(course1)
      gradebook.add_course(course2)

      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      student1.log_score(100)
      student1.log_score(90)
      student1.log_score(85)

      student2.log_score(90)
      student2.log_score(82)
      student2.log_score(71)

      student3.log_score(80)
      student3.log_score(74)
      student3.log_score(69)

      student4.log_score(70)
      student4.log_score(54)
      student4.log_score(45)

      expect(gradebook.students_in_range(80, 100)).to eq([student1, student2])
    end
  end
end