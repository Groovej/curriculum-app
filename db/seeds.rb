s1 = Subject.create(name: 'Math');
s2 = Subject.create(name: 'Chemistry');
s3 = Subject.create(name: 'Literature');
s4 = Subject.create(name: 'English');
s5 = Subject.create(name: 'Spanish');
s6 = Subject.create(name: 'History');

cl1 = Classroom.create(name: '101')
cl2 = Classroom.create(name: '102')
cl3 = Classroom.create(name: '103')
cl4 = Classroom.create(name: '104')

t1 = Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, subject_ids: [s4.id, s5.id])
t2 = Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, subject_ids: [s3.id, s6.id])
t3 =Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, subject_ids: [s1.id])
t4 = Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, subject_ids: [s2.id])

Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)

Section.create(
  teacher: t1,
  subject: s1,
  classroom: cl1,
  assign_days_of_week: %i[monday wednesday friday],
  start_time: Time.parse('09:30AM'),
  duration: 80
)

Section.create(
  teacher: t2,
  subject: s2,
  classroom: cl2,
  assign_days_of_week: %i[tuesday thursday],
  start_time: Time.parse('11:00AM'),
  duration: 50
)

Section.create(
  teacher: t4,
  subject: s6,
  classroom: cl3,
  assign_days_of_week: [:wednesday],
  start_time: Time.parse('10:00AM'),
  duration: 80
)
