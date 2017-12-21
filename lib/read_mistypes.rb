require "read_mistypes/version"
require 'yaml'

module ReadMistypes

  MISTYPES = {}
  CHARS = {}


  def self.convert_mistypes(str, lang = detect_language_from_chars(str))
    return nil if str.nil?

    out = ''
    str.scan(/([[[:space:]]]+|[^[[:space:]]]+)/) do |s|
      w = s[0] if s.is_a? Array

      if w.match?(/[[[:space:]]]+/) # space
        out += w
      else
        out += force_convert(w, lang)
      end
    end

    out
  end

  def self.detect_language_from_chars(str)
    result_langs = {}
    str.each_char do |c|
      langs = CHARS[c]
      unless langs.nil?
        langs.each do |lang|
          result_langs[lang] ||= 0
          result_langs[lang] += 1
        end
      end
    end

    if result_langs.size > 0
      lang, hits = result_langs.to_a.max_by {|k, v| v}
      return lang
    else
      return nil
    end
  end

  def self.force_convert(str, lang)
    return nil if str.nil?
    return str.clone if lang.nil?

    out = ''
    str.each_char do |c|
      out += MISTYPES[lang][c] || c
    end

    out
  end

  private


  def self.load_languages!
    search_path = File.join(File.dirname(__FILE__), 'read_mistypes', 'languages', '*.yml')
    Dir.glob(search_path).each do |file|
      lang = YAML.load(File.read(file))
      lang.each do |l, replaces|
        MISTYPES[l] = replaces
        replaces.each do |f, t|
          CHARS[t] ||= []
          CHARS[t].push(l)
        end
      end
    end

    MISTYPES
  end

  load_languages!

end
