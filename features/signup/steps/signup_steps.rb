Given %r{зарегистрирована команда (.*)$}i do |nickname|
  When %{я не залогинен}
  When %{я пытаюсь зарегистрироваться как #{nickname}}
  Then %{То я должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "#{nickname}"}
  Given %{я разлогиниваюсь}
  Given %{все отосланные к этому моменту письма прочитаны}
end

When %r{пытаюсь зарегистрироваться как (.*)}i do |name|
  email = "#{name.downcase}@diesel.kg"

  Given %{я захожу по адресу /signup}
  When %{я ввожу "#{name}" в поле "Название команды"}
  When %{ввожу "#{email}" в поле "Email"}
  When %{ввожу "#{@the_password}" в поле "Пароль"}
  When %{ввожу "#{@the_password}" в поле "Подтверждение"}
  When %{нажимаю "Зарегистрироваться"}
end

Then %r{могу зарегистрироваться как (.*)} do |nickname|
  When %{я пытаюсь зарегистрироваться как #{nickname}}
  Then %{должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "#{nickname}"}
end

Given %r{зарегистрирован админ (.*)}i do |name|
  current_user = User.new :email=>"master@example.com", :name=>"#{name}", :is_master=>true, :password=>"password", :password_confirmation=>"password"
end
