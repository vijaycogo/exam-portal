# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Seed data for the "colleges" table
College.create(name: 'IITP')
College.create(name: 'NITP')
College.create(name: 'IITK')

# Seed data for the "exams" table
college_1 = College.find_by(name: 'IITP')
Exam.create(college_id: college_1.id, exam_name: 'Midterm Exam')
Exam.create(college_id: college_1.id, exam_name: 'Final Exam')

college_2 = College.find_by(name: 'NITP')
Exam.create(college_id: college_2.id, exam_name: 'Semester Test')
Exam.create(college_id: college_2.id, exam_name: 'Annual Exam')

college_3 = College.find_by(name: 'IITK')
Exam.create(college_id: college_3.id, exam_name: 'JEE')
Exam.create(college_id: college_3.id, exam_name: 'Gate')

# Seed data for the "exam_windows" table
exam_1 = Exam.find_by(exam_name: 'Midterm Exam')
ExamWindow.create(exam_id: exam_1.id, start_time: Time.now, end_time: Time.now + 1.hour)

exam_2 = Exam.find_by(exam_name: 'Final Exam')
ExamWindow.create(exam_id: exam_2.id, start_time: Time.now + 2.hours, end_time: Time.now + 3.hours)

exam_3 = Exam.find_by(exam_name: 'Semester Test')
ExamWindow.create(exam_id: exam_3.id, start_time: Time.now - 1.day, end_time: Time.now)

exam_4 = Exam.find_by(exam_name: 'Annual Exam')
ExamWindow.create(exam_id: exam_4.id, start_time: Time.now + 1.day, end_time: Time.now + 2.days)


exam_5 = Exam.find_by(exam_name: 'JEE')
ExamWindow.create(exam_id: exam_3.id, start_time: Time.now - 1.day, end_time: Time.now)

exam_6 = Exam.find_by(exam_name: 'Gate')
ExamWindow.create(exam_id: exam_4.id, start_time: Time.now + 1.day, end_time: Time.now + 2.days)



