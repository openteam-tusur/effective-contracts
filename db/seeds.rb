user = User.find_or_create_by_uid('2050')
user.permissions.create :role => :manager, :email => 'dsaddas@sdadsadsa.dsddsa'
