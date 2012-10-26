# encoding: utf-8

require 'digest/md5'

module Jekyll
  class TagListTag < Liquid::Tag
    def render(context)
      html = ""
      tags = context.registers[:site].tags.keys
      dir = context.registers[:site].config['tag_dir']
      max_in_tag = 1
      tags.each do |tag|
        posts_in_tag = context.registers[:site].tags[tag].size
        max_in_tag = posts_in_tag if posts_in_tag > max_in_tag
      end
      html << "<li>"
      tags.sort!.map do |tag|
        posts_in_tag = context.registers[:site].tags[tag].size
        style = "font-size: #{60 + (80 * Float(posts_in_tag)/max_in_tag)}%"
        len = context.registers[:site].config['tag_hash_len']
        hash = Digest::MD5.hexdigest(tag)[0, len]
        url = dir + "/#{hash}"
        #html << " <a style='#{style}' href=' /#{url}/'>#{tag} (#{posts_in_tag})</a>"
        html << " <a style='#{style}' href=' /#{url}/'>#{tag} </a>"
      end
      html << "</li>"
      html
    end
  end
end

Liquid::Template.register_tag('tag_sidebar', Jekyll::TagListTag)
