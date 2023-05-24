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

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    expect(gradebook.list_all_students).to eq({course1: student1, student2 course2: student3, student4})
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

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    student1.log_score(100)
    student2.log_score(90)
    student3.log_score(80)
    student4.log_score(70)

    expect(gradebook.students_below(90)).to eq([student3, student4])
  end
end