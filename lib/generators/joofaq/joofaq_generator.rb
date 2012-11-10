class JoofaqGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)


  def generate_faq
    copy_file "joofaq.yml", "db/faq.yml"
    copy_file "joofaq/index.html.erb", "app/views/faq/index.html.erb"
    copy_file "joofaq/_qapair.html.erb", "app/views/faq/_qapair.html.erb"
    copy_file "joofaq/_subtitle.html.erb", "app/views/faq/_subtitle.html.erb"
    create_route
  end

private
  def create_route
    route "match '/faq' => 'Faq#index'"
  end
end
