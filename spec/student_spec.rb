require 'rspec'
require './lib/student'

RSpec.describe Student do
  it "exists" do
    student = Student.new({name: "Morgan", age: 21})

    expect(student).to be_a(Student)
  end

  it "has readbale attributes" do
    student = Student.new({name: "Morgan", age: 21})

    expect(student.name).to eq("Morgan")
    expect(student.age).to eq(21)
    expect(student.scores).to eq([])
  end

  describe "#log_score" do
    it "can log the students score" do
      student = Student.new({name: "Morgan", age: 21})

      student.log_score(89)
      student.log_score(78)

      expect(student.scores).to eq([89, 78])
    end
  end

  describe "#grade" do
    it "can grade the student by finding the average of all their scores" do
      student = Student.new({name: "Morgan", age: 21})

      student.log_score(89)
      student.log_score(78)

      expect(student.grade).to eq(83.5)
    end
  end
end