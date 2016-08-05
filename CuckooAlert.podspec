#
# Be sure to run `pod lib lint CuckooAlert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CuckooAlert'
  s.version          = '1.0.0'
  s.summary          = 'Extension for UIAlertController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  This is do with swizzle and make UIAlertController with presentViewController seems to old UIAlertView.
                       DESC

  s.homepage         = 'https://github.com/singcodes/CuckooAlert'
  s.license          = { :type => 'BSD(3-clause)', :file => 'LICENSE' }
  s.author           = { 'singcodes' => 'eyerama@gmail.com' }
  s.source           = { :git => 'https://github.com/singcodes/CuckooAlert.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KwanghoonChoi'

  s.ios.deployment_target = '8.4'

  s.source_files = 'CuckooAlert/**'
  
end
