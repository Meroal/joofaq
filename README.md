# Joofaq

Joofaq is a FAQ page template building gem.  In two easy steps you can have a FAQ page up and running on your rails app with questions and sections easily customizable from a yaml file.

## Installation

Add this line to your application's Gemfile:

    gem 'joofaq'


## Usage

After adding the joofaq gem to your Gemfile, run the joofaq gem generator command:

    rails generate joofaq

This will create a faq.yml file in your db/ directory. To add new sections and questions, follow the format shown in the faq.yml:

    First_category_name_here:
    - subtitle: first_category_subtitle_here
    - q: question_1_text_here
      a: answer_1_text_here

Subtitles are optional and you can add as many questions as you need. Remember, this is a yaml file so format (especially indentation) is important for it to work properly.

The generator also created several view files in a new app/views/faq/ directory.  This gives you access to the views so that you can change the styling as you please.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
