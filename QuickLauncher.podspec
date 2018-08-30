Pod::Spec.new do |s|
  s.name         = "QuickLauncher"
  s.version      = "0.3.0"
  s.summary      = "Wrapper around iOS Shortcut Items"

  s.description  = <<-DESC
                   Simplify the process of using the new 3D Touch shortcuts for apps.
                   Get callbacks when a shortcut is invoked and don't do everything
                   inside the AppDelegate like Apple's sample project.

                   I wanted a way to take action on shortcut launches in the view controller
                   that was supposed to handle the actions. I don't like the format of using
                   view controllers from within the AppDelegate. It just seems messy. So this
                   wrapper provides a delegate method to alert a class when a shortcut is invoked.
                   DESC

  s.homepage     = "https://github.com/made2k/QuickLauncher"
  s.screenshots  = "http://i.imgur.com/gsMI3mJ.gif"
  s.swift_version = '4.0'

  s.license      = { :type => "MIT", :file => "LICENSE"}

  s.author    = "Zach McGaughey"
  s.social_media_url   = "http://twitter.com/made2k"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/made2k/QuickLauncher.git", :tag => "0.3.0" }
  
  s.source_files  = "Source/*"

  s.requires_arc = true

end
