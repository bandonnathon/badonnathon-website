class Song
  include MongoMapper::Document

  key :name, String
  key :artist,  String
  key :donor,  String
  key :donorScreen,  String

end