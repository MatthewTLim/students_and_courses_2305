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

  def all_grades
    grades = {}
    @courses.each do |course|
      grades[course] = course.students.map do |student|
        student.grade
      end
    end
    grades
  end

  def students_in_range(min, max)
    range = min..max
    students_range = []
    @courses.each do |course|
      course.students.each do |student|
        if range.include?(student.grade)
          students_range << student
        end
      end
    end
    students_range
  end
end

