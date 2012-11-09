class JoofaqGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)


  def generate_faq
    copy_file "joofaq.yml", "db/joofaq.yml"
    copy_file "joofaq.rb", "app/models/joofaq.rb"
    copy_file "joofaq/index.html.erb", "app/views/joofaq/index.html.erb"
    copy_file "joofaq/_qapair.html.erb", "app/views/joofaq/_qapair.html.erb"
    copy_file "joofaq/_subtitle.html.erb", "app/views/joofaq/_subtitle.html.erb"
    copy_file "joofaq_controller.rb", "app/controllers/joofaq_controller.rb"
    create_route
  end

  def create_route
    route "match 'index' => 'joofaq#index', as: 'faq'"
  end
end
