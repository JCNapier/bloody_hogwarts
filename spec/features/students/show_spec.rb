require 'rails_helper'

RSpec.describe 'students show page' do
  let!(:course_1) {student_1.courses.create!(name: "Defense against the Dark Arts")}
  let!(:course_2) {student_1.courses.create!(name: "Herbology")}
  let!(:course_3) {student_2.courses.create!(name: "Potions")}
  let!(:student_1) {Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")}
  let!(:student_2) {Student.create!(name: "Ron Weasley", age: 14, house: "Gryffindor")}

  it 'lists all of the courses a student is in' do 
    visit "/students/#{student_1.id}"

    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Herbology")
    expect(page).to_not have_content("Potions")
  end
end