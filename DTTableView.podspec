Pod::Spec.new do |s|
  s.name         = "DTTableView"
  s.version      = "0.0.1"
  s.summary      = "DTTableView is easy handle tap and double tap."

  s.description  = <<-DESC
  #DTTableView
                   DESC

  s.homepage     = "http://noppelab.com"

  s.license      = "MIT"

  s.author             = { "noppefoxwolf" => "cromteria@gmail.com" }

  s.source       = { :git => "https://github.com/noppefoxwolf/DTTableView", :tag => "0.0.1" }

  s.source_files  = "DTTableView/DTTableView.swift"
  s.exclude_files = "DTTableViewDemo/*"
end
