require 'faker'

User.delete_all
Vote.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

bro_names = ["Brozo the Clown", "Rag and Brone", "Broledad Bro’Brien", "Breau Brummel", "Brole Porter", "Flannery Bro’Connor", "Angelina Brolie", "Marco Brolo", "Plácido Bromingo", "Brony Seikaly", "Vincent Van Brogh", "Brodhistiva", "Sandy Broufax", "Brosef Stalin", "Brojohsephat", "Lebrona Helmsley", "Tom Brolicchio", "Brohan Santana", "Brobi-Wan Kenobi", "Haley Broel Osment", "Brometheus", "Fidel Castbro", "Brol Pot", "Elvis Costellbro", "Amy Broehler", "Stephen Brolbert", "Nabroleon Bronaparte", "Broliver Cromwell", "Evander Brolyfield", "Mario Brotali", "Brophia Loren", "David Brohansen", "Terrell Browens", "Tony Bromo", "Braubert", "Pete Brose", "Brony Soprano", "Jonathan Safran Broer", "Alex Brovechkin", "Bro Jackson", "Bropher Grace", "Renzo Pianbro", "Santiagbro Calatrava", "Broam Chomsky", "Evelyn Brah", "Bronus Wagner", "Brad Brohaus", "Giorgibro Armani", "Al Brolson", "Greg Brostertag", "Emilibro Estevez", "Paul Bro Bryant", "Pablo Picassbro", "Broto Baggins", "Diegbro Velázqeuz", "Larry", "Bromar Sharif", "Scarlett Bro'Hara", "Willem Dabroe", "Brolden Caulfield", "Broni Mitchell", "Pebro Almobróvar", "Francis Ford Broppola", "Truman Cabrote", "John Broltrane", "Broman Brolanski", "Mary-Kate and Ashley Brolsen", "Gary Broldman", "Bronas Salk", "Slobrodan Mibrosevic", "Teddy Broosevelt", "Marilyn Monbroe", "Charles Brokowski", "Rimbraud", "Brogi Berra", "Czeslaw Mibroscz", "Paul Brauguin", "Tim Tebro", "Edgar Allen Bro", "Christopher Brolumbus", "William Jefferson Clinton", "Norah Brones", "Brofessor X", "Brofiteroles", "Rice o Broni", "Pete Brozelle", "The Sultan of Bronei", "Deuteronomy", "C-3PBro", "Brodhisattva", "Brohsaphat", "Methuselbrah", "Gandalf", "Bro Chi Minh", "Larry", " Curly & Bro", "Dirk Diggler", "Brodo Baggins", "Bromer Simpson", "Grady Sizemore", "Helmut Brohl", "Foghorn Leghorn", "Brobespierre", "Nicolas Sarbrozy", "Boutros Boutros-Gali", "Broprah Winfrey", "Brohan Brohan", "Axl Brose", "Sherlock Brolmes", "Othellbro", "John Brolmes", "Frank J. Zambroni", "Yoko Brono", "Apollo Brohno", "Coolibro", "Broco Crisp", "Broald Dahl", "Brophie Dahl", "Bronan the Brahbarian", "Bro Derek", "Brollie Massimino", "Mr. Brojangles", "Bro Diddley", "Yo-Yo Brah", "Bro-M-G!", "Brosie O'Donnell", "Gina Brollo Brigida", "Peter Bro’Toole", "Brokie Roberts", "Brohammed", "Brony Randall", "Broco Chanel", "Brosé Feliciano", "Bro. Henry", "Brosephine Baker", "Bromeo O. Bromeo", "Frédéric Bropin", "Bromeslice", "BrO. J. Simpson", "Johannes Brahms", "Don Breaux", "Jon Favbreau", "Jon Bon Jovi", "Mephistophbroles", "Diego Marabrona", "Brony the Tiger", "Ben Bronanke", "Raffaello Brollieri", "Wolfgang Amadeus Brozart", "Sen. John Breaux", "Salvador Bralí", "Giacbrometti", "Landbro Calrissian", "G.I. Bro", "Sonia Brotomayor", "Broach K", "Brosama bin Laden", "Khalid Sheik Brohammed", "Nancy Pebrosi", "Will Broldham", "Sandra Broh", "Brozymandias", "Bro Vaughan", "Erbrol Flynn", "Kareem Abdul-Jabbro", "Bill Brodley", "Fats Bromino", "Brollie Fingers", "Ringbro Starr", "Brorence Henderson", "Don Breaux", "Broseidon", "Brohim", "Brosius", "Kurt Brobain", "Brody Jenner", "Tom Brody", "Alec Broldwin", "T-Brone Burnett", "Broald Dahl", "Broland the Thompson Gunner", "Broe Biden", "Bromagnon Man", "Brjron Borg", "George Brahshington Carver", "James Francbro", "Bro Jo White", "Barack,  Michelle,  Malia,  and Sasha Brobama", "Massibro Ambrosini", "Brose Feliciano", "Dom DiMaggibro", "Brokely Carmichael", "Bro-klyn Dekker", "Brodi Al-Fayed", "Hermann Brorschach", "Magnetbro", "Brol’ Dirty Bastard", "Shaquille brO’Neal", "Muggsy Brogues", "Telly Savales is Brojak"]
bro_names.shuffle!
20.times do
  User.create!(username: bro_names.slice!(0), email: Faker::Internet.email,password: 'password')
end

20.times do
  Question.create!(title: "Do you even #{Faker::Hacker.verb}, bro?", user_id: rand(1..20))
end

20.times do
  Answer.create!(text: "#{Faker::Hacker.say_something_smart[0...-1]}, bro!", question_id: rand(1..10), user_id: rand(1..20))
end

# 75.times do
#   Comment.create!(text: Faker::Hipster.sentence", " user_id: User.all.sample", "  comentable: (Answer.all.sample", " Question.all.sample).sample)
# end

# 100.times do
#   Vote.create!(user_id:)
# end
