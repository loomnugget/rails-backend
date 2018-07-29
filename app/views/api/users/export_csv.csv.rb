csv << ["Date Created", "First Name", "Last Name", "Email"]

@users.each do |user|
  first = user.first_name
  last = user.last_name
  date_created = user.created_at.strftime('%-m/%-d/%Y')
  email = user.email

  csv << [ date_created, first, last, email ]
end
