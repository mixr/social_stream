Factory.define :tie do |t|
  t.sender { |s| Factory(:user).actor }
  t.receiver { |r| Factory(:user).actor }
  t.relation { |r| Relation.mode('User', 'User').strongest }
end

# UserToUser ties

Factory.define :friend_tie, :parent => :tie do |t|
  t.relation { |r| Relation.mode('User', 'User').find_by_name('friend') }
end

Factory.define :fof_tie, :parent => :tie do |t|
  t.relation { |r| Relation.mode('User', 'User').find_by_name('friend_of_friend') }
end

Factory.define :public_tie, :parent => :tie do |t|
  t.relation { |r| Relation.mode('User', 'User').find_by_name('public') }
end

# UserToSpace ties
Factory.define :u2s_tie, :parent => :tie do |t|
  t.receiver { |r| Factory(:space).actor }
  t.relation { |r| Relation.mode('User', 'Space').strongest }
end

Factory.define :admin_tie, :parent => :u2s_tie do |t|
  t.relation { |r| Relation.mode('User', 'Space').find_by_name('admin') }
end

Factory.define :user_tie, :parent => :u2s_tie do |t|
  t.relation { |r| Relation.mode('User', 'Space').find_by_name('user') }
end

Factory.define :follower_tie, :parent => :u2s_tie do |t|
  t.relation { |r| Relation.mode('User', 'Space').find_by_name('follower') }
end

