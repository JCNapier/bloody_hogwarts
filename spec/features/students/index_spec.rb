require 'rails_helper'

RSpec.describe 'Students index' do
  let!(:student_1) {Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")}
  let!(:student_2) {Student.create!(name: "Ron Weasley", age: 14, house: "Gryffindor")}

  it 'lists all students with attributes' do 
    visit "/students" 
    
    expect(page).to have_content("All Students")
    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.age)
    expect(page).to have_content(student_1.house)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_2.age)
    expect(page).to have_content(student_2.house)
  end
end