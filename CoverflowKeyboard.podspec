Pod::Spec.new do |spec|
  spec.name         = "CoverflowKeyboard"
  spec.version      = "1.0.0"
  spec.summary      = "Adds a new fancy input Type to the Keyboard"
  spec.description  = <<-DESC

  DESC
  
  spec.homepage          = "https://www.my_homepage.com"
  spec.license           = { :type => "MIT", :file => "LICENSE" }
  spec.author            = { "author" => "author@gmail.com" }
  spec.documentation_url = "https://link_to_documentation.com"
  spec.platforms         = { :ios => "13.0", :osx => "10.15", :watchos => "6.0" }
  spec.swift_version     = "5.0"
  spec.source            = { :git => "https://link_to_my_repository.git", :tag => "#{spec.version}" }
  spec.source_files      = "Sources/PackageName/**/*.swift"
  spec.xcconfig          = { "SWIFT_VERSION" => "5.0" }
end
