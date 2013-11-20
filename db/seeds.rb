user = User.find_or_create_by_uid('2013')
user.permissions.create :role => :administrator ,:email => 'dsaddas@sdadsadsa.dsddsa'
