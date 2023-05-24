class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    all_students = {}
    @courses.each do |course|
      all_students[course.name] = course.students
    end
    all_students
  end

  def students_below(threshold)
    below = []
     @courses.each do |course|
      course.students.each do |student|
        if student.grade < threshold
          below << student
        end
      end
    end
    below
  end
end
