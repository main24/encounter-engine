Given %r{разлогиниваюсь$}i do
  Given %{захожу по адресу /logout}
end

Given %r{не залогинен$}i do
  Given %{я разлогиниваюсь}
end

Given %r{залогинен как (.*)$}i do |name|
  Given %{я разлогиниваюсь}
  When %{я пытаюсь зарегистрироваться как #{name}}
  Then %{То я должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "#{name}"}
  Given %{все отосланные к этому моменту письма прочитаны}
end

Given %r{зарегистрирован как (.*)$}i do |nickname|
  Given %{я залогинен как #{nickname}}
end

When %r{логинюсь как (.*)$} do |nickname|
  email = "#{nickname.downcase}@diesel.kg"

  When %{я захожу по адресу /login}
  When %{ввожу "#{email}" в поле "Email"}
  When %{ввожу "#{@the_password}" в поле "Пароль"}
  When %{нажимаю "Войти"}
  Then %{должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "#{nickname}"}
end

When %r{логинюсь в качестве админа$} do
  current_user = User.new :email=>"master_test@example.com", :name=>"Master_test", :is_master=>true, :password=>"password", :password_confirmation=>"password"
  When %{я захожу по адресу /login}
  When %{ввожу "master_test@example.com" в поле "Email"}
  When %{ввожу "password" в поле "Пароль"}
  When %{нажимаю "Войти"}
  Then %{должен быть перенаправлен в личный кабинет}
  Then %{не должен видеть "Команда Master"}
end

Then %r{не должен быть залогинен$}i do
  Then %{я захожу по адресу /dashboard}
  Then %{должен увидеть "Вы не авторизованы для посещения этой страницы. Попробуйте выполнить вход"}
end