Before do
  clear_mail_deliveries
  recreate_database
  set_common_password
  set_admin
end

After do
  Time.rspec_reset
end

def clear_mail_deliveries
  Merb::Mailer.deliveries.clear
end

def recreate_database
  ActiveRecordHelper.recreate_database!
end

def set_common_password
  @the_password = "1234"
end

def set_admin
  @admin = User.create! :email=>"master@example.com", :name=>"Master", :is_master=>true, :password=>"password", :password_confirmation=>"password"
end