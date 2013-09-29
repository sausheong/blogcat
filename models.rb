DB = Sequel.connect('postgres://sausheong:123@localhost/blogcat')

DB.create_table? :posts do 
    primary_key :id
    DateTime :created_at
    String :heading, size: 255
    String :content, text: true
    String :user_name
    String :user_link
    String :user_facebook_id
end

DB.create_table? :comments do
  primary_key :id  
  DateTime :created_at
  String :content, text: true
  
  String :user_pic_url
  String :user_name
  String :user_link 
  String :user_facebook_id
  
  foreign_key :post_id, :posts
end

class Post < Sequel::Model
  one_to_many :comments
end

class Comment < Sequel::Model
  many_to_one :post
end