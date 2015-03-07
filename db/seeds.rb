# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Listing.create(user_id: 1, company_id: 2, contact_id: 3, job_title: "Front End Engineer", applied: false, contact_email: "sergey@google.com", posting_url: "http://www.google.com/jobs/job/1234", email: "hr@google.com")