Pod::Spec.new do |s|
  s.name         = "JRTPageViewC"
  s.version      = "0.0.1"
  s.summary      = "JRTPageViewC contains a PageViewController and CollectionView fast and easy configuration having paginated content."
  s.homepage     = "https://github.com/ifobos/JRTPageViewC"
  s.license      = "MIT"
  s.author       = { "ifobos" => "juancarlos.garcia.alfaro@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ifobos/JRTPageViewC.git", :tag => "0.0.1" }
  s.source_files = "JRTPageViewC/JRTPageViewC/PodFiles/*.{h,m}"
  s.requires_arc = true
end
