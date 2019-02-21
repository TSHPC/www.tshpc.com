# app/helpers/svg_helper.rb

module SvgHelper
  def svg_tag(name)
    file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
end
