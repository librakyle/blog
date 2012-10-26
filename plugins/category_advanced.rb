# encoding: utf-8

require 'digest/md5'

module Jekyll
  class CategoryListTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories.keys
      dir = context.registers[:site].config['category_dir']
      categories.sort!.map do |category|
        posts_in_category = context.registers[:site].categories[category].size
        len = context.registers[:site].config['category_hash_len']
        hash = Digest::MD5.hexdigest(category)[0, len]
        url = dir + "/#{hash}"
        html << "<li class='category'><a href=' /#{url}/'>#{category} (#{posts_in_category})</a></li>\n"
      end
      html
    end
  end
  
  class CategoriesListTag < Liquid::Tag
    def render(context)
      html = ""
      categories = context.registers[:site].categories.keys
      categories.sort!.map do |category|
        for item in  context.registers[:site].categories[category]  
           html << "<h1><a href='#'>#{item.name}</a></h1>"
        end
      end
      html
    end
  end
  
  
end

Liquid::Template.register_tag('category_sidebar', Jekyll::CategoryListTag)
Liquid::Template.register_tag('categories_post', Jekyll::CategoriesListTag)
