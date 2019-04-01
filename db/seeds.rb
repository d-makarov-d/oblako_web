# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "active_support/core_ext/hash/indifferent_access"
require "yaml"
seeds = HashWithIndifferentAccess.new(YAML.load_file(File.join(__dir__, 'seeds/seeds.yml') ))
seeds['projects'].each do |proj|
    @project = Project.create(title: proj['title'])
    proj['todos'].each do |todo|
        Todo.create(text: todo['text'], isCompleted: todo['isCompleted'], project: @project)
    end
end
