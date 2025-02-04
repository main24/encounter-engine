# language: ru

Функционал: Вход
  Чтобы совершать действия от своего имени
  Каждый пользователь сайта должен выполнять вход по паролю

Сценарий: Гость видит кнопу "Войти" на главной странице
  Допустим я не залогинен
  Если я захожу на главную страницу
  То должен увидеть "Войти"

Сценарий: Залогиненный пользователь не видит кнопку "Войти" на главной странице
  Допустим я зарегистрирован как Iv
  Если я захожу на главную страницу
  То не должен видеть "Войти"

Сценарий: Удачный вход
  Допустим зарегистрирована команда Iv
  А я не залогинен
  Если я захожу на главную страницу
  И иду по ссылке "Войти"
  И ввожу "iv@diesel.kg" в поле "Email"
  И ввожу "1234" в поле "Пароль"
  И нажимаю "Войти"
  То должен быть перенаправлен в личный кабинет
  И должен увидеть "Команда Iv"

Сценарий: Вход с ошибкой
  Допустим я не залогинен
  Если я захожу по адресу /login
  И ввожу "всякую-муть" в поле "Email"
  И ввожу "ещё-большую-муть" в поле "Пароль"
  И нажимаю "Войти"
  То должен увидеть "Неправильный email или пароль"
  И не должен быть залогинен

Сценарий: Логин админом
  Допустим зарегистрирован админ Master
  И я не залогинен
  Если иду по ссылке "Войти"
  И ввожу "master@example.com" в поле "Email"
  И ввожу "password" в поле "Пароль"
  И нажимаю "Войти"
  То должен быть перенаправлен в личный кабинет
  И не должен видеть "Команда Master"