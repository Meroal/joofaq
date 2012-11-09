class Joofaq

  class Section
    @attr_list = [:name, :pairs, :items]
    attr_accessor *@attr_list

    def initialize args
      @name = args[:name]
      @items = args[:item].map do |v|
        if ['subtitle'] == v.keys
          Subtitle.new v['subtitle']
        elsif ['q', 'a'] == v.keys
          QAPair.new q: v['q'], a: v['a']
        else
          raise "Item #{v} did not match subtitle or QApair format"
        end
      end
    end

    def name_html; Joofaq.markdown @name end
  end

  class Subtitle
    attr_accessor :str

    def initialize str
      @str = str
    end

    def template; 'joofaq/subtitle' end
    def to_html; Joofaq.markdown @str end
  end

  class QAPair
    @attr_list = [:q, :a]
    attr_accessor *@attr_list

    def initialize args
      @q = args[:q]
      @a = args[:a]
    end

    def template; 'joofaq/qapair' end
    def q_html; Joofaq.markdown @q end
    def a_html; Joofaq.markdown @a end
  end

  class << self
    def data; data = YAML.load_file 'db/joofaq.yml' end
    def markdown str
      RDiscount.new(str).to_html.html_safe
    end
    def sections
      data.map {|k,v| Joofaq::Section.new name: k, item: v }
    end
  end
end
