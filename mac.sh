#!/bin/bash
#
# macOS
#
# Making myself at home.

# Make the dock autohide but re-appear very quickly
defaults write com.apple.dock autohide-delay -int 1
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Re-enable the startup chime
sudo nvram BootAudio=%01

# Fast key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 1

# JPG screenshots
defaults write com.apple.screencapture type jpg

# Set the finder preferences for showing drives on the desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# OUT OF DATE:
# defaults write com.apple.systemuiserver menuExtras -array \
# 	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
# 	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
# 	"/System/Library/CoreServices/Menu Extras/Clock.menu"
#
# FIXME:
# "NSStatusItem Visible com.apple.menuextra.TimeMachine" = 1;
# "NSStatusItem Visible com.apple.menuextra.airport" = 1;
# "NSStatusItem Visible com.apple.menuextra.battery" = 1;
# "NSStatusItem Visible com.apple.menuextra.bluetooth" = 1;
# "NSStatusItem Visible com.apple.menuextra.clock" = 1;
# "NSStatusItem Visible com.apple.menuextra.keychain" = 1;
# "NSStatusItem Visible com.apple.menuextra.volume" = 1;

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Google Chrome & Google Chrome Canary                                        #
###############################################################################

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
	"SystemUIServer" "iCal"; do
	killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
