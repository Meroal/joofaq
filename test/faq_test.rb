require_relative 'test_helper'

class FaqMock < Faq
  def self.data
    this_dir = File.dirname(__FILE__)
    canned_data = this_dir + '/../lib/generators/joofaq/templates/joofaq.yml'
    YAML.load_file canned_data
  end
end


class TestSuite < Test::Unit::TestCase
  def test_data_load
    assert_equal FaqMock.data.class, Hash
    assert FaqMock.sections.count >= 1
  end

  def test_classes_load
    assert_instance_of Faq::Section,
      FaqMock.sections[1]
    assert_instance_of Faq::Subtitle,
      FaqMock.sections[0].items[0]
    assert_instance_of Faq::QAPair,
      FaqMock.sections[0].items[1]
  end

  def test_attributes_loaded
    assert_equal FaqMock.sections[0].name,
      "First_category_name_here"
    assert_equal FaqMock.sections[0].items[0].str,
      "first_category_subtitle_here"
    assert_equal FaqMock.sections[0].items[1].q,
      "question_1_text_here"
    assert_equal FaqMock.sections[0].items[1].a,
      "answer_1_text_here"
  end

  def test_to_markdown
    assert_match FaqMock.sections[0].items[1].a_html, /<p/
  end
end
