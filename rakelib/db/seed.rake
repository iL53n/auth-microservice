namespace :db do
  desc 'Seeds from db/seeds'
  task :seed, %i[version] => :environment do |t, args|
    require 'sequel'
    require 'sequel/extensions/seed'

    Sequel.extension :seed

    Sequel.connect(Settings.db.to_hash) do |db|
      seeds = File.expand_path('../../db/seeds', __dir__)
      version = args.version.to_i if args.version

      Sequel::Seeder.apply(db, 'db/seeds', target: version)
    end
  end
end
