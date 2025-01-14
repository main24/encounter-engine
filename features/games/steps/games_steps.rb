Given /админом создана игра "(.*)"$/ do |game_name|
  Given %{я логинюсь в качестве админа}
  Given %{админ создаёт игру "#{game_name}"}
end

Given /админом создана общедоступная игра "(.*)"$/ do |game_name|
  Given %{я логинюсь в качестве админа}
  Given %{админ создаёт общедоступную игру "#{game_name}"}
end

Given /^создана игра "(.*)"$/ do |game_name|
  author_name = 'Author'
  Given %{пользователем #{author_name} создана игра "#{game_name}"}
end

Given /админ создаёт игру "(.*)"$/ do |game_name|
  starts= Time.now + 7.days
  deadline= Time.now + 6.days
  Given %{я логинюсь в качестве админа}
  When %{я захожу в личный кабинет}
  When %{иду по ссылке "Создать игру"}
  When %{ввожу "#{game_name}" в поле "Название"}
  When %{ввожу "Описание #{game_name}" в поле "Описание"}
  When %{ввожу "#{starts}" в поле "Начало игры"}
  When %{ввожу "#{deadline}" в поле "Крайний срок регистрации"}
  When %{нажимаю "Создать"}
  Then %{должен быть перенаправлен в профиль игры "#{game_name}"}
end

Given /админ создаёт общедоступную игру "(.*)"$/ do |game_name|
  starts= Time.now + 7.days
  deadline= Time.now + 6.days
  Given %{я логинюсь в качестве админа}
  When %{я захожу в личный кабинет}
  When %{иду по ссылке "Создать игру"}
  When %{ввожу "#{game_name}" в поле "Название"}
  When %{ввожу "Описание #{game_name}" в поле "Описание"}
  When %{ввожу "#{starts}" в поле "Начало игры"}
  When %{ввожу "#{deadline}" в поле "Крайний срок регистрации"}
  When %{отмечаю галочку "Доступна для всех?"}
  When %{нажимаю "Создать"}
  Then %{должен быть перенаправлен в профиль игры "#{game_name}"}
end


Given %r{админ назначает начало игры "(.*)" на "(.*)"} do |game_name, datetime|
  Given %{я логинюсь в качестве админа}
  When %{захожу в профиль игры "#{game_name}"}
  When %{иду по ссылке "Редактировать эту игру"}
  When %{ввожу "#{datetime}" в поле "Начало игры"}
  When %{нажимаю "Сохранить"}
  Then %{должен быть перенаправлен в профиль игры "#{game_name}"}  
  Then %{должен увидеть "#{datetime}"}
  Given %{я разлогиниваюсь}
end
Given %r{админ назначает крайний срок регистрации на игру "(.*)" на "(.*)"} do |game_name, datetime|
  Given %{я логинюсь в качестве админа}
  When %{захожу в профиль игры "#{game_name}"}
  When %{иду по ссылке "Редактировать эту игру"}
  When %{ввожу "#{datetime}" в поле "Крайний срок регистрации"}
  When %{нажимаю "Сохранить"}
  Then %{должен быть перенаправлен в профиль игры "#{game_name}"}
  Then %{должен увидеть "#{datetime}"}
  Given %{я разлогиниваюсь}
end

Given /начало игры "(.*)" назначено на "(.*)"/ do |game_name, datetime|
  game = Game.find_by_name(game_name)
  Given %{админ назначает начало игры "#{game_name}" на "#{datetime}"}
end
Given /крайний срок регистрации игры "(.*)" назначено на "(.*)"/ do |game_name, datetime|
  game = Game.find_by_name(game_name)
  author_name = game.author.nickname
  Given %{админ назначает крайний срок регистрации на игру "#{game_name}" на "#{datetime}"}
end

When %r{захожу в профиль игры "(.*)"$}i do |game_name|  
  game = Game.find_by_name(game_name)  
  Then %{захожу по адресу #{resource(game)}}
end

When /захожу в список игр$/ do
  When %{я захожу на главную страницу}
  When %{иду по ссылке "Список игр"}
end

Then %r{должен быть перенаправлен в профиль игры "(.*)"$}i do |game_name|
  game = Game.find_by_name(game_name)
  Then %{должен быть перенаправлен по адресу #{resource(game)}}
end

Given /^админ добавил задание "([^\"]*)" в игру "([^\"]*)"$/ do |level_name, game_name|
  game = Game.find_by_name(game_name)
  Given %{я логинюсь в качестве админа}
  Given %{добавляю задание "#{level_name}" в игру "#{game_name}"}
end

Given /^в игре "([^\"]*)" нет заданий$/ do |game_name|
  # Это пустышка. Нужна чтобы сценарий читался логично.
end

Given /^игра "([^\"]*)" не черновик$/ do |game_name|
  game = Game.find_by_name(game_name)
  Given %{я логинюсь в качестве админа}
  When %{захожу в профиль игры "#{game_name}"}
  When %{иду по ссылке "Редактировать эту игру"}
  When %{снимаю галочку "Черновик"}
  When %{нажимаю "Сохранить"}
  Then %{не должен видеть "Черновик"}
end

Given /^игра "([^\"]*)" черновик$/ do |game_name|
  game = Game.find_by_name(game_name)
  Given %{я логинюсь в качестве админа}
  Given %{захожу в профиль игры "#{game_name}"}
  Given %{иду по ссылке "Редактировать эту игру"}
  Given %{отмечаю галочку "Черновик"}
  Given %{нажимаю "Сохранить"}
end

Given /^есть пользователь "([^\"]*)"$/ do |user_name|
  Given %{я залогинен как #{user_name}}
  Then %{должен увидеть "#{user_name}"}
end

Given /^я залогинён как "([^\"]*)"$/ do |user_name|
  Given %{я логинюсь как #{user_name}}
end

Given /^игра "([^\"]*)" не начата$/ do |game_name|
  game=Game.find_by_name(game_name)
  game.starts_at=Time.now+3.days
  game.registration_deadline = Time.now+2.days
  game.save
end

Given /^игра "([^\"]*)" уже начата$/ do |game_name|
  game=Game.find_by_name(game_name)
  Given %{сейчас "#{game.starts_at+1.hour}"}
  
end

When /^я нахожусь на странице "([^\"]*)"$/ do |page|
  page = "личный кабинет" if page == "Личный кабинет"
  page = "комнату команды" if page == "Комната команды"
  When %{захожу в #{page}}
end

Given /^не должен видеть ссылку "([^\"]*)"$/ do |link|
  Then %{не должен видеть ссылку на #{link}$}
end

Given /^должен видеть ссылку "([^\"]*)"$/ do |link|
  Then %{должен видеть ссылку на #{link}$}
end

Given /^страница перегружается$/ do
  
end

When /^нажимаю на "([^\"]*)"$/ do |link|
  Then %{нажимаю #{link}$}
end

Given /^админ зарегистрировал команду "([^\"]*)" на участие в игре "([^\"]*)"$/ do |team, game_name|
  game = Game.find_by_name(game_name)
  Given %{зарегистрирована команда #{team}}
  Given %{я не залогинен}
  Given %{я логинюсь в качестве админа}
  Given %{я захожу по адресу /games/#{game.id}/game_entries/new}
  Given %{ввожу "#{team}" в поле "Пригласить команду"}
  Given %{нажимаю "Пригласить"}
  Given %{должен быть перенаправлен в профиль игры "#{game_name}"}
end

Given /^автор "([^\"]*)" отказал команде на участие в игре$/ do |author_name|
  Given %{я логинюсь как #{author_name}}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "(отказать)"}
  Given %{я разлогиниваюсь}
end

Given /^капитан (.*) подал заявку на участие в игре$/ do |team_leader|
  Given %{я логинюсь как #{team_leader}}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "Подать заявку на регистрацию"}
end

Given /^команда ([^\s]+) подала заявку на участие в игре "(.*)"$/ do |team_name, game_name|
  Given %{зарегистрирована команда "#{team_name}" под руководством team-leader}
  Given %{я логинюсь как team-leader}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "Подать заявку на регистрацию"}
end

Given /^есть задание "([^\"]*)" в игре "([^\"]*)"$/ do |level_name, game_name|
  game = Game.find_by_name(game_name)
  author_name = game.author.nickname
  Given %{#{author_name} добавляет задание "#{level_name}" в игру "#{game_name}"}
end

Given /^(.*) подтвердил участие команды "(.*)" в игре "(.*)"$/ do |author_name, team_name, game_name|
  Given %{я залогинился как автор игры "#{game_name}"}
  When %{захожу в личный кабинет}
  Given %{иду по ссылке "(принять)"}
end

Given /^я залогинился как автор игры "(.*)"$/ do |game_name|
  game=Game.find_by_name(game_name)
  author=User.find :first, :conditions=>{:id=>game.author_id}
  Given %{я логинюсь как #{author.nickname}}
end

Given /^команда "([^\"]*)" отозвала заявку на участие в игре$/ do |team_name|
  team = Team.find_by_name(team_name)
  captain_name = team.captain.nickname
  Given %{я логинюсь как #{captain_name}}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "Отозвать"}
end
Given /админ создал игру "([^\"]*)" с началом в "([^\"]*)" и с крайним сроком регистрации в "([^\"]*)"$/ do |game_name, starts_at, deadline_at|
  Given %{я логинюсь в качестве админа}
  When %{я захожу в личный кабинет}
  When %{иду по ссылке "Создать игру"}
  When %{ввожу "#{game_name}" в поле "Название"}
  When %{ввожу "Описание #{game_name}" в поле "Описание"}
  When %{ввожу "#{starts_at}" в поле "Начало игры"}
  When %{ввожу "#{deadline_at}" в поле "Крайний срок регистрации"}
  When %{нажимаю "Создать"}
  Then %{должен быть перенаправлен в профиль игры "#{game_name}"}
end

Given /^команда "([^\"]*)" отменила регистрацию в игре$/ do |team_name|
  team = Team.find_by_name(team_name)
  captain_name = team.captain.nickname
  Given %{я логинюсь как #{captain_name}}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "Отменить"}
end

Given /^задано максимальное количество команд "([^\"]*)" для игры "([^\"]*)"$/ do |max_num, game_name|
  Given %{я залогинился как автор игры "#{game_name}"}
  Given %{захожу в профиль игры "#{game_name}"}
  Given %{иду по ссылке "Редактировать эту игру"}
  Given %{отмечаю галочку "Ограничить"}
  Given %{ввожу "#{max_num}" в поле "количество команд"}
  Given %{нажимаю "Сохранить"}
end

When /поле "(.*)" имеет тип "(.*)"$/ do |field, type|
  field_labeled(field).class.to_s.should match(/#{type}/i)
end

Given /^игра завершена админом$/ do
  Given %{я логинюсь в качестве админа}
  Given %{захожу в личный кабинет}
  Given %{иду по ссылке "ЗАВЕРШИТЬ ИГРУ"}
  Given %{я разлогиниваюсь}
end

Then /должен в блоке "([^"]+)" увидеть "([^"]+)"$/ do |block_id, text|
  webrat_session.response.body.should have_selector("##{block_id}") do |content|
    content.should contain(text)
  end
end

Then /не должен в блоке "([^"]+)" видеть "([^"]+)"$/ do |block_id, text|
  webrat_session.response.body.should have_selector("##{block_id}") do |content|
    content.should_not contain(text)
  end
end

Given %r{зарегистрирована определенная команда: "([^"]+)", "([^"]+)", "([^"]+)"$}i do |nickname, e_mail, password|
  When %{я пытаюсь зарегистрироваться с данными "#{nickname}", "#{e_mail}", "#{password}"}
  Then %{То я должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "Команда #{nickname}"}
  Given %{я разлогиниваюсь}
  Given %{все отосланные к этому моменту письма прочитаны}
end

When %r{пытаюсь зарегистрироваться с данными "([^"]+)", "([^"]+)", "([^"]+)"}i do |nickname, e_mail, password|
  Given %{я захожу по адресу /signup}
  When %{я ввожу "#{nickname}" в поле "Название команды"}
  When %{ввожу "#{e_mail}" в поле "Email"}
  When %{ввожу "#{password}" в поле "Пароль"}
  When %{ввожу "#{password}" в поле "Подтверждение"}
  When %{нажимаю "Зарегистрироваться"}
end

Then /^данные команды "([^"]+)" с паролем "([^"]+)" такие "([^"]+)"$/ do |nickname, password, phone_number|
  When %{залогинился как "#{nickname}" с паролем "#{password}"}
  When %{иду по ссылке "Профиль"}
  When %{иду по ссылке "Редактировать профиль..."}
  When %{ввожу "#{phone_number}" в поле "Контактный телефон"}
  When %{нажимаю "Принять изменения"}
  Then %{должен увидеть "#{phone_number}"}
  When %{иду по ссылке "Выйти"}
end


When %r{залогинился как "([^"]+)" с паролем "([^"]+)"$} do |nickname, password|
  email = User.find_by_name(nickname).email

  When %{я захожу по адресу /login}
  When %{ввожу "#{email}" в поле "Email"}
  When %{ввожу "#{password}" в поле "Пароль"}
  When %{нажимаю "Войти"}
  Then %{должен быть перенаправлен в личный кабинет}
  Then %{должен увидеть "Команда #{nickname}"}
end

Given %r{игрок "([^"]+)" с паролем "([^"]+)" создает команду "([^"]+)"}i do |nickname, password, team_name|
  Given %{залогинился как "#{nickname}" с паролем "#{password}"}
  When %{я пытаюсь создать команду "#{team_name}"}
  Then %{должен быть перенаправлен в личный кабинет}
  Then %{там должен увидеть "Вы - капитан команды"}
  Then %{должен увидеть "#{team_name}"}
end

When /^пароль пользователя "([^"]*)" равен "([^"]*)"$/ do |nickname, password|
  Given %{залогинился как "#{nickname}" с паролем "#{password}"}
end

When /^команда "([^\"]*)" завершает игру "([^\"]*)"$/ do |team_name, game_name|
  last_level = Game.find_by_name(game_name).levels.last

  Given %{команда #{team_name} находится на уровне "#{last_level.name}" игры "#{game_name}"}
  Given %{команда #{team_name} вводит правильные коды последнего уровня игры "#{game_name}"}
end

When /команда (.*) вводит правильные коды последнего уровня игры "(.*)"/ do |team_name, game_name|
  team = User.find_by_name(team_name)
  game = Game.find_by_name(game_name)
  current_level = game.levels.last

  Given %{я логинюсь как #{team.name}}
  current_level.questions.each do |question|
    When %{ввожу код "#{question.answers.first.value}" в игре "#{game_name}"}
  end
  Then %{должен увидеть "Поздравляем"}
end

Given %r{админ завершил тестирование игры "(.*)"} do |game_name|
  Given %{я логинюсь в качестве админа}
  Given %{захожу в личный кабинет}
  Then %{должен увидеть "#{game_name}"}
  Then %{захожу в профиль игры "#{game_name}"}
  Then %{я иду по ссылке "Начать тестирование"}
  Then %{я иду по ссылке "Старт"}
  Then %{я ввожу "1234" в поле "Код"}
  And %{и нажимаю "Отправить!"}
  Then %{я ввожу "1234" в поле "Код"}
  And %{и нажимаю "Отправить!"}
  Then %{я иду по ссылке "Завершить тестирование"}
  Then %{игра "#{game_name}" не черновик}
  Given %{я разлогиниваюсь}
end

Given /^нажимаю на "([^\"]*)" возле кода "([^\"]*)"$/ do |link_name, code|
  answer = Answer.find_by_value(code)
  question = answer.question
  within "#question-#{question.id}" do |scope|
    scope.click_link link_name
  end
end

Given /^добавляет золотой код "([^\"]*)" в задание "([^\"]*)"$/ do |code, level_name|
  When %{я захожу в профиль задания "#{level_name}"}
  And %{иду по ссылке "Добавить ещё один код"}
  And %{ввожу "#{code}" в поле "Код"}
  And %{отмечаю галочку "Золотой?"}
  And %{нажимаю "Добавить"}
  Then %{должен быть перенаправлен в профиль задания "#{level_name}"}
  And %{должен увидеть "Золотой код"}
  And %{должен увидеть "#{code}"}
end
