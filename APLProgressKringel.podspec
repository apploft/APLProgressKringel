Pod::Spec.new do |s|
  s.name         = "APLProgressKringel"
  s.version      = "0.0.1"
  s.summary      = "A modern circular progress indicator view"

  s.description  = <<-DESC
		This pod provides the APLProgressKringelView, which can display your progress in a modern way.
                   DESC

  s.homepage     = "https://github.com/apploft/APLProgressKringel"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = 'Nico Schuemann'

  s.platform     = :ios, '8.0'

  s.source       = { :git => "https://github.com/apploft/APLProgressKringel.git", :tag => s.version.to_s }

  s.source_files  = 'Classes/*.{h,m}'
  s.resources     = 'Classes/*.xib'
  s.public_header_files = ["Classes/*.h"]
  s.exclude_files = 'Classes/Exclude'

  s.requires_arc = true
end
