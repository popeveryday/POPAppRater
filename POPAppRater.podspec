Pod::Spec.new do |s|
s.name             = "POPAppRater"
s.version          = "0.2.1"
s.summary          = "POPFormTable is cutom UITableViewController that support generate some common input field for Object-c project."
s.homepage         = "https://github.com/popeveryday/POPAppRater"
s.license          = 'MIT'
s.author           = { "popeveryday" => "popeveryday@gmail.com" }
s.source           = { :git => "https://github.com/popeveryday/POPAppRater.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'Pod/Classes/**/*.{h,m,c}'
s.resources = 'Pod/Classes/*.strings'

s.dependency 'POPLib', '~> 0.1'
end
