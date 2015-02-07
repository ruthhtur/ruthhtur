require 'lib/typogrify'

helpers Typogrify

helpers do
  def current_year
    Time.new.year
  end
end

Time.zone = 'Pacific Time (US & Canada)'

compass_config do |config|
  config.output_style = :compact
end

activate :blog do |blog|
  blog.sources = 'posts/{year}-{month}-{day}-{title}.html'
  blog.layout = 'post'
  blog.permalink = '/:title'
end

activate :livereload do |livereload|
  livereload.host = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
end

activate :syntax, :line_numbers => true

set :markdown_engine, :redcarpet

set :markdown, :fenced_code_blocks => true, :autolink => true, :smartypants => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

activate :directory_indexes

configure :build do
  activate :minify_css

  activate :minify_javascript

  activate :asset_hash

  activate :relative_assets
end
