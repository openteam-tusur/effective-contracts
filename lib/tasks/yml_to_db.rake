namespace :yml_to_db do
  task :write => :environment do
    require 'yaml'
    f=YAML.load_file(Rails.root.join('config','factors.yml'))['factors']
    f.each do |factor,options|
      Factor.create(slug: options['slug'],title: options['title'], abbr: options['abbr'],grade: options['grade'].to_i)
    end
  end
end
