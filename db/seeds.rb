# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require 'open-uri'

movies = [ "3 Idiots", "3:10 to Yuma", "8 Mile", "8 Seconds", "9 (2009 animated)", "10 Things I Hate About You", "10th Kingdom, The", "12 Angry Men", "12 Years a Slave",
"13 Going on 30", "13 Hours: The Secret Soldiers of Benghazi", "13th Warrior, The", "14 Carrot Rabbit", "17 Again", "20th Century Women", "21 Grams", "25th Hour", "27 Dresses",
"28 Days Later", "28 Weeks Later", "30 Days of Night", "40 Year-Old Virgin, The", "50 First Dates", "50/50 (2011)", "400 Blows, The", "127 Hours", "300",
"(500) Days of Summer", "1408", "1941", "1969", "2001: A Space Odyssey", "2010: The Year We Make Contact", "2012", "2046","2081", "3000 Miles to Graceland", "20,000 Leagues Under the Sea",
"5,000 Fingers of Dr. T, The", "About Last Night...", "About Schmidt", "About Time", "Abraham Lincoln: Vampire Hunter","Absence of Malice", "Absolute Power", "Accidental Tourist, The",
"Accused, The (1988)", "Ace Ventura: Pet Detective", "Ace Ventura: When Nature Calls", "Across the Universe", "Act of Valor", "Adam's Rib", "Addams Family, The (1991)", "Addams Family, The (2019)", "Adjustment Bureau, The", "Adventures of Pinocchio, The (1996)",
"Adventures of Robin Hood, The", "Adventures of Rocky and Bullwinkle, The", "Adventures of Tintin, The", "Affair of the Necklace, The", "After Dark, My Sweet", "After Hours", "After Sex", "Aguirre, the Wrath of God", "A.I. Artificial Intelligence", "Air Bud", "Air Force One", "Airplane!", "Airplane II: The Sequel", "Airport", "Airport 1975", "Airport '77",
"Akeelah and the Bee", "Akira", "Aladdin", "Aladdin (2019)", "Aladdin and the King of Thieves", "Alamo, The (1960)", "Albatross", "Albino Alligator", "Allegro Non Troppo", "Alexander", "Alexander and the Terrible, Horrible, No Good, Very Bad Day", "Alice Doesn't Live Here Anymore", "Alice in Wonderland (1915)", "Alice in Wonderland (1951)", "Alice in Wonderland (1976)", "Alice in Wonderland (2010)", "Alice Through the Looking Glass",
"Alien", "Alien 3", "Aliens (1986)", "Aliens in the Attic", "Aliens vs. Predator: Requiem", "Alive (1993)", "All a Bir-r-r-d", "All About Eve", "All About My Mother", "All About Steve", "All Dogs Go to Heaven", "All Dogs Go to Heaven 2", "All of Me", "All the President's Men", "All the Right Moves", "Almost Famous", "Almost Heroes", "Along Came a Spider", "Alpha Dog", "Alpha and Omega", "Alvin and the Chipmunks", "Alvin and the Chipmunks: Chipwrecked", "Alvin and the Chipmunks: The Road Chip", "Alvin and the Chipmunks: The Squeakquel", "Amadeu", "Amazing Panda Adventure, The", "Amazing Spider-Man, The (2012)", "Amazing Spider-Man 2, The", "American Beauty", "America (1924)", "America (2014)", "American Chai", "American Gangster", "American Graffiti", "American History X", "American Hustle (2013)", "American in Paris, An", "American Me", "American Pie", "American Pie 2", "American Pie Presents: Beta House",
"American Pie Presents: The Book Of love", "American Psycho", "American Reunion", "American Sniper", "American Tail, An", "American Tail: Fievel Goes West, An", "American Wedding", "Americanization of Emily, The", "Amistad", "Amityville Horror, The (2005)", "Amour (2012)", "Anaconda", "Anacondas: The Hunt for the Blood Orchid", "Analyze This", "Anastasia (1997)", "Anchorman: The Legend of Ron Burgundy", "Anchorman 2: The Legend Continues", "…And Justice For All", "And the Band Played On", "Angel Eyes", "Angel Heart", "Angels & Demons", "Angels in the Outfield (1994)", "Angels with Dirty Faces", "Angus, Thongs and Perfect Snogging", "Angry Birds Movie, The", "Angry Birds Movie 2, The", "Animal Farm (1999)", "Animal Crackers", "Animal House", "Anna and the King", "Anna Karenina (2012)", "Annie (2014 film)", "Annie", "Annie Hall", "Another Cinderella Story", "Ant Bully, The", "Antitrust", "Ant-Man", "Antz", "Apocalypse Now", "Apocalypto", "Apollo 13", "Apt Pupil", "Aquaman", "Are We Done Yet?", "Are We There Yet?", "Argo (2012)", "Aristocats, The", "Armageddon", "Around the World in 80 Days (2004)", "Arrival", "Arsenic and Old Lace", "Arthur", "As Good As It Gets", "Assassination Games", "Assassination of a High School President", "Assassination of Jesse James by the Coward Robert Ford, The", "At First Sight", "Atlantic City (1980)", "Atlantis: The Lost Empire", "ATM", "Atonement", "Attack of the 50 Foot Woman", "August Rush", "Auntie Mame", "Austin Powers in Goldmember", "Austin Powers: International Man of Mystery", "Austin Powers: The Spy Who Shagged Me", "Australia", "Avatar", "Avengers, The (2012)", "Avengers: Age of Ultron", "Aviator, The", "Away from Her",
"Avengers: Infinity War", "Babar: The Movie", "Babar: King of the Elephants", "Babe", "Babe: Pig in the City", "Babe, The", "Babylon A.D", "Bachelor Mother", "Bachelorette", "Back to School", "Back to School with Franklin", "Back to the Future", "Back to the Future Part II", "Back to the Future Part III", "Backdraft", "Bad and the Beautiful, The", "Bad Boys (1995)", "Bad Boys II", "Bad Day at Black Rock", "Bad Santa", "Bad Taste", "Badlands", "Balto", "Bambi", "Bambi II", "Bananas", "Barbarella", "Barbecue Brawl", "Barcelona", "Barney's Great Adventure", "Barry Lyndon", "Barton Fink", "BASEketball", "Basic Instinct", "Basic Instinct 2", "Batman (1989)", "Batman Begins", "Batman Forever", "Batman Returns", "Batman and Robin", "Batman v Superman: Dawn of Justice", "Battle: Los Angeles", "Battle of San Pietro, The", "Battle Royale", "Be Kind Rewind","Beach, The", "Beaches", "Bean (1997)", "Beasts of the Southern Wild", "Beast of Yucca Flats, The", "Beau Geste (1939)", "Beautiful Girls", "Beautiful Mind, A", "Beautiful Thing", "Beauty and the Beast (1991)", "Beauty and the Beast (2017)", "Beavis and Butthead Do America","Becoming Jane","Bedazzled (1967)", "Bedazzled (2000)", "Bedknobs and Broomsticks", "Bedtime Stories", "Bee Movie", "Bee Season", "Beerfest", "Beetlejuice", "Before Midnight", "Before Sunrise", "Before Sunset", "Beginners", "Behind Enemy Lines", "Behind the Candelabra", "Being John Malkovich", "Being There", "Believer, The","Ben 10: Alien Swarm", "Ben 10: Destroy All Aliens", "Ben 10: Race Against Time", "Ben 10: Secret of the Omnitrix", "Ben-Hur (1959)", "Bend It Like Beckham", "Benny & Joon", "Beowulf", "Best in Show", "Best Laid Plans", "Best Little Whorehouse in Texas, The", "Best Years of Our Lives, The", "Better Off Dead",
"Better Than Chocolate", "Better Tomorrow, A", "Beverly Hills Chihuahua", "Beverly Hills Cop II", "Beverly Hills Cop III", "Beyond the Valley of the Dolls", "Beyond the Sea (2004)", "Bicentennial Man", "Bicycle Thieves", "Big", "Big Chill, The", "Big Daddy", "Big Easy, The", "Big Fat Liar", "Big Fish", "Big Hero 6", "Big Lebowski, The", "Big Night", "Big Short, The", "Big Sleep, The (1946)", "Big Time Movie", "Big Top Bunny", "Big Top Pee-wee", "Big Trouble", "Big Trouble in Little China", "Bill and Ted's Bogus Journey", "Bill and Ted's Excellent Adventure", "Billy & Mandy's Big Boogey Adventure", "Billy Madison", "Birdman", "Birds of a Father", "Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn)", "Birds, The", "Black Book", "Black Cat, The (1934)", "Black Christmas (1974)", "Black Christmas (2006)", "Black Hawk Down", "Black Hole, The", "BlacKkKlansman", "Black Panther", "Black Rain", "Black Sheep", "Black Swan", "Blade", "Blade II", "Blade Runner", "Blade: Trinity", "Blades of Glory", "Blair Witch Project, The", "Blazing Saddles", "Blind Date (1987)", "Blob, The (1958)", "Blood Diamond", "Blood Feast", "Blood on Satan's Claw, The", "Blood Simple", "Blow", "Blow Out", "Blown Away (1994)", "Blue Collar", "Blue Lagoon, The", "Blue Jasmine", "Blue Velvet", "Blue's Big Musical Movie", "Blues Brothers, The", "Blues Brothers 2000", "Bohemian Rhapsody", "Body Heat", "Body of Lies", "Boiler Room","Bold Caballero, The", "Bolt (2008)", "Bonnie and Clyde", "Boogeyman", "Book of Life, The", "Book of Pooh: Stories from the Heart, The", "Book of Shadows: Blair Witch 2", "Book Thief, The", "Boondock Saints, The", "Borat: Cultural Learnings of America for Make Benefit Glorious Nation of Kazakhstan", "Born on the Fourth of July", "Bottle Rocket", "Bound", "Bourne Identity, The", "Bourne Legacy, The", "Bourne Supremacy, The", "Bourne Ultimatum, The", "Bowling for Columbine", "Box-Office Bunny", "Boy Named Charlie Brown, A",
"Boyhood", "Boys from Brazil, The", "Boys Next Door, The", "Boys Town", "Boyz n the Hood", "Braindead", "Brassed Off", "Brave (2012)", "Braveheart", "Brave Little Toaster, The", "Brazil", "Breakfast at Tiffany's", "Breakfast Club, The", "Breaking Away", "Breaking Up", "Brian's Song", "Bride of Chucky", "Bride Wars", "Bridge of Spies", "Bridge on the River Kwai, The", "Bridge to Terabithia (2007)", "Bridget Jones's Diary", "Bring It On", "Bring Me the Head of Alfredo Garcia", "Bringing Up Baby", "Broadcast News", "Brokeback Mountain", "Broken Arrow", "Bronx Tale, A", "Brooklyn", "Brother Bear", "Brother Bear 2", "Brothers Grimm, The", "Brothers McMullen, The", "Brothers Solomon, The", "Brubaker", "Bruce Almighty", "Buckaroo Banzai", "Bucket List, The", "Buffalo '66", "Buffy the Vampire Slayer", "Bug", "Bug's Life, A", "Bull Durham", "Bullfighters, The", "Bullitt", "Burn After Reading", "But I'm a Cheerleader", "Butch Cassidy and the Sundance Kid", "Butterfly Effect, The", "By Dawn's Early Light", "Cabin Fever", "Cabin in the Woods, The", "Cabinet of Dr. Caligari, The", "Cable Guy, The", "Caddyshack", "Caine Mutiny, The", "Camelot", "Camille (1936)", "Camp Lazlo: Where's Lazlo?", "Camp Rock", "Can't Buy Me Love", "Can't Hardly Wait", "Candy (2006)", "Cape Fear (1991)", "Capricorn One", "Captain America: Civil War", "Captain America: The First Avenger", "Captain America: The Winter Soldier", "Captain Phillips", "Care Bears Movie, The", "Care Bears Movie II: A New Generation", "Carlito's Way", "Carnal Knowledge", "Carol", "Carrie (1976)", "Carrie (2002)", "Carrie (2013)", "Carrotblanca", "Cars", "Cars 2", "Cars 3", "Casablanca", "Casanova", "Casino", "Cast Away", "Casualties of War", "Cat in the Hat, The (2003)", "Cat on a Hot Tin Roof", "Cat People (1942)", "Cat Returns, The", "Catch-22", "Catch Me If You Can", "Cats & Dogs", "Cats & Dogs: The Revenge of Kitty Galore", "Cats Don't Dance", "Catwoman", "Cecil B. Demented", "Champion (1949)", "Changing Lanes", "Channel Chasers", "Charlie and the Chocolate Factory (2005)", "Charlie's Angels", "Charlie's Angels: Full Throttle", "Charlie Wilson's War", "Chariots of Fire", "Charlotte's Web (1973)", "Chasing Amy", "Chasing Liberty", "Cheaper by the Dozen (1950)", "Cheaper by the Dozen (2003)", "Cheaper by the Dozen 2", "Cheech & Chong's Next Movie", "Cheech & Chong's The Corsican Brothers", "Chicago (2002)", "Chicken Little (1943)", "Chicken Little (2005)", "Chicken Run", "Children of Dune", "Children of Men", "Children of Paradise", "Children of the Corn", "Children's Hour, The", "Child's Play", "Child's Play 2", "Child's Play 3", "China Seas", "Chinatown", "Chitty Chitty Bang Bang", "Chloe", "Chocolat", "Choke", "Chorus Line, A", "Christine", "Christmas Carol, A (2009)", "Christmas Story, A", "Christmas with the Kranks", "Chronicle", "Chronicles of Narnia: Prince Caspian, The", "Chronicles of Narnia: The Lion, the Witch and the Wardrobe, The", "Chronicles of Narnia: The Voyage of the Dawn Treader, The", "Chronicles of Riddick, The", "Chumscrubber, The", "Chungking Express", "Cider House Rules, The", "Cincinnati Kid, The", "Cinderella (1950)", "Cinderella II: Dreams Come True (2002)", "Cinderella III: A Twist in Time", "Cinderella (2015)", "Cinderella Story, A", "Circle", "Citizen Kane", "City of Angels", "City of Ember", "City on Fire (1979)", "City of God", "City Slickers", "Clash of the Titans (2010)", "Class of Nuke 'Em High", "Clean and Sober", "Clear and Present Danger", "Cleopatra (1963)", "Click", "Client, The", "Clerks", "Clerks II", "Clockwise", "Clockwork Orange, A", "Close Encounters Of The Third Kind", "Close Shave, A", "Closer", "Cloudy with a Chance of Meatballs", "Cloudy with a Chance of Meatballs 2", "Cloverfield", "Clue", "Clueless", "Coach Carter", "Cocktail", "Coco", "Cold Mountain", "Collateral", "Color Purple, The", "Coma", "Coming Home", "Commando", "Commitments, The", "Compulsion", "Con Air", "Conan the Barbarian", "Conan the Destroyer", "Coneheads", "Confessions of a Dangerous Mind", "Confetti", "Conquest of Space", "Conspiracy Theory", "Constant Gardener, The", "Constantine", "Contagion", "Control (2007)", "Cool and the Crazy‎", "Cool Hand Luke", "Cool Runnings", "Cool World", "Coonskin", "Cop and a Half", "Coraline", "Core, The", "Corpse Bride", "Contact", "Court Jester, The", "Count of Monte Cristo, The (2002)", "Courtship Of Eddie's Father, The (1963)", "Cowboy Bebop: The Movie", "Coyote Ugly", "Craft, The", "Crank", "Crash (2004)", "Crazy Rich Asians", "Crimes and Misdemeanors", "Crimewave", "Crimson Tide", "Criss Cross (1949)", "Crocodile Dundee", "Crocodile Dundee in Los Angeles", "Croods, The", "Cross of Iron", "Crouching Tiger, Hidden Dragon", "Croupier", "Crow, The", "Crow: City Of Angels, The", "Cry Freedom", "Cry Wolf", "Cruel Intentions", "Crying Game, The", "Cube", "Cube 2: Hypercube", "Cube Zero", "Cure, The (1995)", "Curious Case of Benjamin Button, The", "Curious George", "Cursed (2005)", "Cutting Edge, The", "Die Hard", "Doctor Zhivago", "Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb", "E.T. The Extra-Terrestrial", "Eternal Sunshine of the Spotless Mind", "Fargo", "Ferris Bueller's Day Off", "Fight Club", "First Blood", "Forrest Gump", "Ghostbusters", "Gladiator", "Goodfellas", "Good Will Hunting", "Gone With the Wind", "Groundhog Day", "Green Street Hooligans", "Inception", "It's a Wonderful Life", "Jaws", "Joker", "Jurassic Park", "Lawrence of Arabia", "Mary Poppins", "Memento", "Monty Python and The Holy Grail", "North by Northwest", "On the Waterfront", "One Flew Over the Cuckoo's Nest", "Pan's Labyrinth", "Parasite", "Point Break", "Psycho", "Pulp Fiction", "Raging Bull", "Raiders of the Lost Ark", "Rear Window", "Reservoir Dogs", "Rocky", "Saving Private Ryan", "Scarface", "Schindler's List", "Seven", "Singin' in the Rain", "Slumdog Millionaire", "Some Like It Hot", "Star Wars", "Stallone Cobra", "Sunset Boulevard", "Taxi Driver", "The Big Lebowski", "The Breakfast Club", "The Bridge on the River Kwai", "The Dark Knight", "The Deer Hunter", "The Empire Strikes Back", "The Exorcist", "The Godfather", "The Godfather: Part II", "The Good, the Bad and the Ugly", "The Graduate", "The Great Dictator", "The Lion King", "The Matrix", "Thelma & Louise", "The Lord of the Rings: The Fellowship of the Ring", "The Lord of the Rings: The Return of the King", "The Princess Bride", "The Seven Samurai", "The Shawshank Redemption", "The Shining", "The Silence of the Lambs", "The Sound of Music", "The Unforgiven", "The Usual Suspects", "The Wizard of Oz", "Titanic", "To Kill a Mockingbird", "Toy Story", "Up", "Vertigo", "Wall-E", "West Side Story", "When Harry Met Sally", "Young Frankenstein" ]


def create_url(movie_name)  
  "http://www.omdbapi.com/?&t=#{movie_name}&apikey=#{ENV["OMDB"]}"
end
 
def create_movie(movie_post)
  genre = Genre.find_by(name: movie_post["Genre"].split(", ").first)
  if genre.nil?
    genre = Genre.create!(name: movie_post["Genre"].split(", ").first)
  end
  movie = Movie.new(
    title: movie_post["Title"],
    director: movie_post["Director"],
    year: movie_post["Year"],
    poster: movie_post["Poster"],
    genre: genre
  )
  movie.save
  puts "#{movie.title} #{movie.director} #{movie.year} #{movie.poster} #{movie.genre.name}"
end


Movie.destroy_all
Genre.destroy_all

movies.each do |movie_name|
  movie_url = create_url(movie_name.gsub(/[^\d\s\w]/, ""))
  response = open(movie_url).read
  movie_post = JSON.parse(response)
  create_movie(movie_post) unless movie_post["Response"] == "False"
end



