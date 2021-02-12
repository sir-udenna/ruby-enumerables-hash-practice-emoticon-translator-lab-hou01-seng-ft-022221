# require modules here
require "yaml"
require "pry"

def load_library(file)
  # code goes here
  final_hash = {}
  YAML.load_file(file).each do |key, value|
    final_hash[key] = {}
    final_hash[key][:english] = value[0]
    final_hash[key][:japanese] = value[1]
  end
  final_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  load_library(path).each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
  load_library(path).each do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end

