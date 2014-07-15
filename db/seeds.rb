# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
SharedSession.create! :id => 1, :title => 'Default', :alpha_code => 'default'
Option.create! description: "Put an ID attribute on the messages list",
  key: "id_on_messages", value_type: 'boolean', possible_values: 'Y|N',  default_value: 'Y'
