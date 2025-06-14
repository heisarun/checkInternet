#!C:\darkness\development\ruby\bin ruby.exe
#encoding: ISO-8859-1
#system("clear")
#puts "---------------------------------------------"
#puts "                 START                      "
#puts "---------------------------------------------"

require 'awesome_print'
require 'net/http'
 
#----------------------------------
# Setting custom Fields!
# Edit only these Settings !
#----------------------------------
#user friendly listing of websites
uri = []
uri[1] = URI('https://bing.com/')
uri[2] = URI('https://yahoo.com/')
uri[3] = URI('https://store.steampowered.com/')
#----------------------------------


#----------------------------------
#freeze all urls , fixed strings
uri[1].freeze 
uri[2].freeze 
uri[3].freeze 
#----------------------------------

#----------------------------------
#editable code , preserved for later change if needed 
#hostname = uri.hostname # => "jsonplaceholder.typicode.com"
#path = uri.path         # => "/"
#port = uri.port         # => 443
#----------------------------------


#----------------------------------
# setting always false
isNetworkWorking = false
#----------------------------------


#----------------------------------
#Acquire the web-pages , on error set no internet
begin 
bing  = Net::HTTP.get_response(uri[1])
rescue
  #
ensure
  isNetworkWorking = false
end 

begin 
yahoo = Net::HTTP.get_response(uri[2])
rescue
  #
ensure
  isNetworkWorking = false
end 

begin 
steam = Net::HTTP.get_response(uri[3])
rescue
  #
ensure
  isNetworkWorking = false
end 
#----------------------------------


#----------------------------------
# Check if web-pages have been recieved , using html codes 


responseCode = []
# == does not work , so does kind_of? . Hence , = is used in an if.
# for bing
if    bing.kind_of?(Net::HTTPSuccess) 
      responseCode[1] = true
elsif bing.kind_of?(Net::HTTPServerError)
      responseCode[1] = false
else 
      responseCode[1] = false
end

#for yahoo
if    yahoo.kind_of?(Net::HTTPSuccess) 
      responseCode[2] = true
elsif yahoo.kind_of?(Net::HTTPServerError)
      responseCode[2] = false
else 
      responseCode[2] = false
end

#for steam
if    steam.kind_of?(Net::HTTPSuccess) 
      responseCode[3] = true
elsif steam.kind_of?(Net::HTTPServerError)
      responseCode[3] = false
else 
      responseCode[3] = false
end
#----------------------------------

#----------------------------------
#Check internet using the acquired data 
isNetworkWorking = false
isNetworkWorking = responseCode[1] || responseCode[2] || responseCode[3] 
#----------------------------------



#----------------------------------
#Un-Assign all variables
uri = []
bing  = nil
steam = nil
yahoo = nil
responseCode = []
#----------------------------------

ap responseCode[1]
ap responseCode[2]
ap responseCode[3]
ap isNetworkWorking

#puts "reaching the expected requirement"
#puts " reaching "
#puts "---------------------------------------------"
#puts "                   END                       "
#puts "---------------------------------------------"