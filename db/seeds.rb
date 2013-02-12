SponsorshipLevel.create!(:name => "Founding Partners", :sort => 1)
SponsorshipLevel.create!(:name => "Education Sponsor", :sort => 2)
SponsorshipLevel.create!(:name => "Knowledge Partner", :sort => 3)
SponsorshipLevel.create!(:name => "Innovation Partner", :sort => 4)
SponsorshipLevel.create!(:name => "Airline Partner", :sort => 5)
SponsorshipLevel.create!(:name => "Cornerstone Partners", :sort => 6)
SponsorshipLevel.create!(:name => "Integrated Marketing & Strategic Communications Partner", :sort => 7)
SponsorshipLevel.create!(:name => "Experience Marketing Partner / Web & Video Partner", :sort => 8)
SponsorshipLevel.create!(:name => "Media Partners", :sort => 9)
SponsorshipLevel.create!(:name => "Granite Partners", :sort => 10)
SponsorshipLevel.create!(:name => "Gold Partners", :sort => 11)
SponsorshipLevel.create!(:name => "Silver Partners", :sort => 12)
SponsorshipLevel.create!(:name => "Official Online Community Partner", :sort => 13)
SponsorshipLevel.create!(:name => "Official Brainstorm Innovation Partner", :sort => 14)
SponsorshipLevel.create!(:name => "Official Mobile Site Development Partner", :sort => 15)

EventBrand.create!(:name => "Lab")
EventBrand.create!(:name => "Partner Program")
EventBrand.create!(:name => "Affiliate Event")

t = TalkBrand.new(:name => "Talk")
t.id = TALK_BRAND_ID
t.save!

t = TalkBrand.new(:name => "Megatalk")
t.id = MEGATALK_BRAND_ID
t.save!

t = TalkBrand.new(:name => "Edison Talk")
t.id = EDISON_TALK_BRAND_ID
t.save!

Track.create!(:name => "Politics", :description => "add a description here")
Track.create!(:name => "Innovation", :description => "add a description here")
Track.create!(:name => "Entrepreneurship", :description => "add a description here")
Track.create!(:name => "Technology", :description => "add a description here")
Track.create!(:name => "Society", :description => "add a description here")

Day.create!(:date => "2012-10-8".to_date, :name => "Meta Narrative for Day 1")
Day.create!(:date => "2012-10-9".to_date, :name => "Meta Narrative for Day 2")
Day.create!(:date => "2012-10-10".to_date, :name => "Meta Narrative for Day 3")
Day.create!(:date => "2012-10-11".to_date, :name => "Meta Narrative for Day 4")
Day.create!(:date => "2012-10-12".to_date, :name => "Meta Narrative for Day 5")
Day.create!(:date => "2012-10-13".to_date, :name => "Meta Narrative for Day 6")
Day.create!(:date => "2012-10-14".to_date, :name => "Meta Narrative for Day 7")


MemberType.create!(:name => "Friends")
MemberType.create!(:name => "Donor")
MemberType.create!(:name => "Patrons")
MemberType.create!(:name => "Benefactor")