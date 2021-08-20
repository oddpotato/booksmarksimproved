#######
-----

GET - '/' erb :index - Just says bookmarks
Three GET link - ADD - VIEW - DELETE

-------
#####

ADD

GET - '/bookmark/add' - ADD
POST - '/bookmark/add' 
GET - '/bookmarks' 

####
-------
####

VIEW

GET - '/bookmarks' erb :bookmarks - shows bookmarks

####
------
####

DELETE

GET - '/bookmark/delete' - DELETE
POST - '/bookmark/delete'
GET - '/bookmarks'
