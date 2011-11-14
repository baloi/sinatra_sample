require 'sinatra'
require 'sinatra/activerecord'

class ShortenedURL < ActiveRecord::Base 
  validates_uniqueness_of :url
  validates_presence_of :url
  #validates_format_of :url, 
  #   :with => /^\b((?:https?:\/\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'".,<>?«»“”‘’]))$/

end

get '/' do
  "hello world"
end

post '/therapist' do
  name = "#{params[:therapist_name].strip}"

  @therapist = Therapist.new(:name => name)  
  @errors = []

  if @therapist.save
    redirect '/therapist/list'
  else
    @therapist.errors.each do |e|
      @errors << e
      puts ">>>#{e}<<<"
    end

    redirect '/therapist/error'
  end
end


