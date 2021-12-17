require 'rails_helper'

RSpec.describe 'course show page' do
  let!(:course_1) {Course.create!(name: "Defense against the Dark Arts")}
  let!(:course_2) {Course.create!(name: "Herbology")}

  let!(:student_1) {Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")}
  let!(:student_2) {Student.create!(name: "Ron Weasley", age: 14, house: "Gryffindor")}

  let!(:student_1_courses) {StudentCourse.create!(student: student_1, course: course_1)}
  let!(:student_2_courses) {StudentCourse.create!(student: student_2, course: course_1)}
  let!(:student_3_courses) {StudentCourse.create!(student: student_1, course: course_2)}

  it 'lists courses with the number of students in each course' do 
    visit '/courses' 
    expect(page).to have_content(course_1.name)
    expect(page).to have_content(course_1.students.count)
  end
end