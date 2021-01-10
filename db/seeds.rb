require 'faker'

Blog.destroy_all
User.destroy_all
Genre.destroy_all

Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "The robot clicked disapprovingly, gurgled briefly inside its cubical interior and extruded a pony glass of brownish liquid. Sir, you will undoubtedly end up in a drunkard's grave, dead of hepatic cirrhosis, it informed me virtuously as it returned my ID card. I glared as I pushed the glass across the table.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "The shoes had been there for as long as anyone could remember. In fact, it was difficult for anyone to come up with a date they had first appeared. It had seemed they'd always been there and yet they seemed so out of place. Why nobody had removed them was a question that had been asked time and again, but while they all thought it, nobody had ever found the energy to actually do it. So, the shoes remained on the steps, out of place in one sense, but perfectly normal in another.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "It wasn't quite yet time to panic. There was still time to salvage the situation. At least that is what she was telling himself. The reality was that it was time to panic and there wasn't time to salvage the situation, but he continued to delude himself into believing there was.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "The box sat on the desk next to the computer. It had arrived earlier in the day and business had interrupted her opening it earlier. She didn't who had sent it and briefly wondered who it might have been. As she began to unwrap it, she had no idea that opening it would completely change her life.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "MaryLou wore the tiara with pride. There was something that made doing anything she didn't really want to do a bit easier when she wore it. She really didn't care what those staring through the window were thinking as she vacuumed her apartment.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "Dave watched as the forest burned up on the hill, only a few miles from her house. The car had been hastily packed and Marta was inside trying to round up the last of the pets. Dave went through his mental list of the most important papers and documents that they couldn't leave behind. He scolded himself for not having prepared these better in advance and hoped that he had remembered everything that was needed. He continued to wait for Marta to appear with the pets, but she still was nowhere to be seen.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "She had been an angel for coming up on 10 years and in all that time nobody had told her this was possible. The fact that it could ever happen never even entered her mind. Yet there she stood, with the undeniable evidence sitting on the ground before her. Angels could lose their wings.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "She had been an angel for coming up on 10 years and in all that time nobody had told her this was possible. The fact that it could ever happen never even entered her mind. Yet there she stood, with the undeniable evidence sitting on the ground before her. Angels could lose their wings.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "It was a concerning development that he couldn't get out of his mind. He'd had many friends throughout his early years and had fond memories of playing with them, but he couldn't understand how it had all stopped. There was some point as he grew up that he played with each of his friends for the very last time, and he had no idea that it would be the last.")
Blog.create(title: Faker::Book.title, author: Faker::Name.name, content: "He had done everything right. There had been no mistakes throughout the entire process. It had been perfection and he knew it without a doubt, but the results still stared back at him with the fact that he had lost.")


10.times{User.create(username: Faker::Internet.username, password:  Faker::Internet.password)}

Genre.create(name: "Poetry")
Genre.create(name: "Politics")
Genre.create(name: "Novel")
Genre.create(name: "Recipe")
Genre.create(name: "Book Review")
Genre.create(name: "Fiction")
Genre.create(name: "Romance")
Genre.create(name: "Horror")
Genre.create(name: "Film Review")
Genre.create(name: "Do It Yourself")