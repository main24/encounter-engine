Given %r(в игре "(.*)" следующие задания:$)i do |game_name, levels_table|
  game = Game.find_by_name(game_name)

  levels_table.hashes.each do |hash|
    level_name = hash['Название']
    code = hash['Код']
    Given %{админ добавляет задание "#{level_name}" с кодом "#{code}" в игру "#{game_name}"}
  end
end

Given /добавляю задание "([^\"]*)" в игру "([^\"]*)"$/ do |level_name, game_name|
  Given %{добавляю задание "#{level_name}" с кодом "enКраблеБумц" в игру "#{game_name}"}
end

Given /добавляю задание "([^\"]*)" с кодом "([^\"]*)" в игру "([^\"]*)"$/ do |level_name, code, game_name|
  Given %{захожу в профиль игры "#{game_name}"}  
  Given %{иду по ссылке "Добавить новое задание"}
  When %{я ввожу "#{level_name}" в поле "Название"}
  When %{ввожу "#{level_name}" в поле "Текст задания"}
  When %{ввожу "#{code}" в поле "Код"}
  When %{нажимаю "Добавить задание"}
  Then %{должен быть перенаправлен в профиль задания "#{level_name}"}
  Then %{должен увидеть "#{level_name}"}
end

Given %r{^админ добавляет задание "([^\"]*)" в игру "(.*)"}i do |level_name, game_name|
  Given %{я логинюсь в качестве админа}
  Given %{добавляю задание "#{level_name}" в игру "#{game_name}"}
end

Given %r{^админ добавляет задание "([^\"]*)" с кодом "([^\"]*)" в игру "([^\"]*)"$}i do |level_name, code, game_name|
  Given %{я логинюсь в качестве админа}
  Given %{добавляю задание "#{level_name}" с кодом "#{code}" в игру "#{game_name}"}
end

Given /в игру "([^\"]*)" добавлено задание "([^\"]*)" с кодом "([^\"]*)"$/ do |game_name, level_name, code|
  game = Game.find_by_name(game_name)

  Given %{я логинюсь в качестве админа}
  Given %{добавляю задание "#{level_name}" с кодом "#{code}" в игру "#{game_name}"}
end

Given /^в игру "([^\"]*)" добавлено задание "([^\"]*)" со следующими кодами:$/ do |game_name, level_name, table|
  game = Game.find_by_name(game_name)

  codes = table.raw.map(&:first)
  code_count = codes.size

  first_code = codes.shift
  Given %{админ добавляет задание "#{level_name}" с кодом "#{first_code}" в игру "#{game_name}"}

  codes.each do |code|
    Given %{админ добавляет код "#{code}" в задание "#{level_name}"}
  end

  When %{я захожу в профиль задания "#{level_name}"}
  Then %{должен увидеть "Коды (#{code_count})"}
end

Given /^админ добавляет код "([^\"]*)" в задание "([^\"]*)"$/ do |code, level_name|
  When %{я захожу в профиль задания "#{level_name}"}
  And %{иду по ссылке "Добавить ещё один код"}
  And %{ввожу "#{code}" в поле "Код"}
  And %{нажимаю "Добавить"}
  Then %{должен быть перенаправлен в профиль задания "#{level_name}"}
  And %{должен увидеть "#{code}"}
end

Given /^добавляю код "([^\"]*)" в задание "([^\"]*)"$/ do |code, level_name|
  Given %{админ добавляет код "#{code}" в задание "#{level_name}"}
end

Given /^админом создана игра "(.*)" со следующими заданиями:$/ do |game_name, levels_table|
  Given %{админом создана игра "#{game_name}"}

  levels = levels_table.raw.map(&:first)
  levels.each.each do |level_name|
    Given %{в игру "#{game_name}" добавлено задание "#{level_name}" с кодом "крабле-крабле-бумц"}
  end
end

When %r{захожу в профиль задания "(.*)"$}i do |level_name|
  level = Level.find_by_name(level_name)
  Then %{захожу по адресу #{resource(level.game, level)}}
end

Then /должен быть перенаправлен в профиль задания "(.*)"/ do |level_name|
  level = Level.find_by_name(level_name)
  Then %{должен быть перенаправлен по адресу #{resource(level.game, level)}}
end