# encoding: utf-8

# puts 'ROLES'
#     YAML.load(ENV['ROLES']).each do |role|
#       Role.find_or_create_by_name({name: role}, without_protection: true)
#       puts 'role: ' << role
#     end
#     puts "\n"

# puts 'DEFAULT USERS'
#     user = User.find_or_create_by_email(name: ENV['ADMIN_NAME'].dup,
#                                         email: ENV['ADMIN_EMAIL'].dup,
#                                         password: ENV['ADMIN_PASSWORD'].dup,
#                                         password_confirmation: ENV['ADMIN_PASSWORD'].dup)
#     user.add_role :admin
#     puts "Admin: " << user.name 

#     user2 = User.find_or_create_by_email(name: 'Not An admin',
#                                          email: 'user@example.com',
#                                          password: 'changeme',
#                                          password_confirmation: 'changeme')
#     user2.add_role :teacher
#     puts "teacher: " << user2.name 
#     puts "\n"

# puts 'DEFAULT LAB WORKS'
#     lab_work1 = LabWork.find_or_create_by_title(title: 'Контактна різниця потенціалів',
#                                                 description: 'Ефект фото е.р.с.(ФЕ) полягає, в основному, у індукованій освітленням 
#     зміні розподілу потенціалу в даній структурі. Цей ефект був експериментально 
#     виявлений Бекюрелом (Becquerel) в 1839. Ефект фото е.р.с., як правило, є 
#     результатом деякого переносу та/або перерозподілу носіїв заряду всередині 
#     зразка, зумовленого освітленням. Частковим випадком ефекту ФЕ є ефект 
#     поверхневої фото е.р.с (ПФЕ). Поверхнева фото е.р.с. (Surface Photo Voltage), 
#     визначається як індукована освітленням зміна поверхневого потенціалу. Даний 
#     ефект вперше спостерігався на поверхнях кремнію та германію Браттейном 
#     (Brattain) в 1947 . 
#     Ми будемо розглядати ПФЕ, індуковану на вільній поверхні 
#     напівпровідникового зразка із заземленим омічним контактом задньої 
#     поверхні.')
#     puts "lab work: " << lab_work1.title

#     lab_work2 = LabWork.find_or_create_by_title(title: 'Растровий електронний мікроскоп',
#                                                 description: 'Просвічуючий електронний мікроскоп (ПЕМ) - це електроннооптичний прилад, в якому пучки електронів використовуються для формування зображення досліджуваного об`єкта. Електронні мікроскопи дозволяють побачити і вивчити будову окремих молекул, колоїдів, вірусів, кристалічних граток, матеріалів та багато іншого. Найвищим досягненням сучасної електронної мікроскопії є візуалізація окремих атомів важких елементів і пряме спостереження кристалічної решітки. Електронні мікроскопи отримали широке поширення в практиці науково-дослідних робіт. Практично в кожному інституті фізико-хімічного та біологічного профілю використовується електронний мікроскоп.
#     Електронний мікроскоп належить до числа найбільш корисних приладів в області методів дослідження мікроструктури речовини.')
#     puts "lab work: " << lab_work2.title
#     puts "\n"

# puts 'DEFAULT QUESTIONS'
#     question1 = Question.find_or_create_by_content(content: 'Яку назву має Ваша лабораторна робота?',
#                                                    lab_work_id: 1)
#     puts "question: " << question1.content

#     question2 = Question.find_or_create_by_lab_work_id(content: 'Яку назву має Ваша лабораторна робота?',
#                                                    lab_work_id: 2)
#     puts "question: " << question2.content

puts 'LAB DATA'
    dir = Dir.open('/home/chukcha/Dropbox/code/Diplom/data_for_graphs_unparsed')
    dir.each do |file|
      next if File.directory? file
      l = LabData.new(lab_work_id: 1, 
                      data: File.open("/home/chukcha/Dropbox/code/Diplom/data_for_graphs_unparsed/#{file}"),
                      title:  file)
      l.save!
      puts file
    end