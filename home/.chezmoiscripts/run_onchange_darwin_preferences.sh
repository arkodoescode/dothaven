#!/bin/zsh

# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Finder                                                                      #
###############################################################################

echo "Setting finder settings..."

# Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Set `Home` as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

echo "Setting dock settings..."

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false


###############################################################################
# Kill affected applications                                                  #
###############################################################################

apps=(
    # "Activity Monitor"
    # "Address Book"
    # "Calendar"
    # "cfprefsd"
    # "Contacts"
    "Dock"
    "Finder"
    # "Google Chrome Canary"
    # "Google Chrome"
    # "Mail"
    # "Messages"
    # "Opera"
    # "Photos"
    # "Safari"
    # "SizeUp"
    # "Spectacle"
    # "SystemUIServer"
    # "Terminal"
    # "Transmission"
    # "Tweetbot"
    # "Twitter"
    # "iCal"
)

for app in "${apps[@]}"; do
    killall "$app" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."