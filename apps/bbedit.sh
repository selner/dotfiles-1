#
# Forked from https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
#

# ==============================================
# BBEdit and TextWrangler
# ==============================================
echo "Setting BBEdit and TextWrangler preferences"

function set_barebones_prefs() {
    defaults write com.barebones.bbedit "$@"
    defaults write com.barebones.textwrangler "$@"
}

# Expand tabs to spaces (except in XML)
set_barebones_prefs EditorAutoExpandTabs -bool true
set_barebones_prefs EditorAutoExpandTabs_XML -bool false

# In XML, show invisibles and soft wrap text
set_barebones_prefs EditorShowInvisibleCharacters_XML -bool true
set_barebones_prefs EditorSoftWrap_XML -bool true

# Default tab width is 4 spaces
set_barebones_prefs EditorDefaultTabWidth -int 4

# Ruby tab width is 2 spaces
set_barebones_prefs EditorDefaultTabWidth_Ruby -int 2

# Automatically indent
set_barebones_prefs EditorAutoIndent -bool true

# Don't check spelling
set_barebones_prefs EditorCheckSpellingAsYouType -bool false

# Don't suggest nonsense when I'm writing code
set_barebones_prefs IncludeDictionaryWordsInCompletionList -bool false

# Open documents in new window
set_barebones_prefs NewAndOpenPrefersSharedWindow -bool false

# Do nothing when app becomes active
set_barebones_prefs StartupAndResumeAction -int 1

# Ensure that file ends with a line break
set_barebones_prefs EnsureTrailingLineBreak -bool true

# Don't strip trailing white space
set_barebones_prefs StripTrailingWhitespace -bool false

# Complete with ESC
set_barebones_prefs UseEscapeKeyAsCompletionTrigger -boolean true

# No default filename extensions
set_barebones_prefs EnableDefaultFilenameExtensions -bool false

# Double-clicking on a delimiter includes the delimiters in the resulting selection
set_barebones_prefs BalanceIncludesDelimiters -bool true

# Don't try to reopen files if it requires mounting volumes
set_barebones_prefs AllowVolumeMount -bool false

# Allow update checking
set_barebones_prefs SUSoftwareUpdateEnabled -bool true
set_barebones_prefs SUSoftwareUpdateHasCompletedFirstRun -bool true

# Add some default mappings
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = recipe; languageName = { languageCode = "XML "; languageName = XML; }; }'
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = pkginfo; languageName = { languageCode = "XML "; languageName = XML; }; }'
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = pp; languageName = { languageCode = Ruby; languageName = Ruby; }; }'

CFPreferencesAppSynchronize "com.barebones.bbedit"
CFPreferencesAppSynchronize "com.barebones.textwrangler"

# Add TextWrangler to the Dock
add_app_to_dock TextWrangler

# Add BBEdit to the Dock
add_app_to_dock BBEdit
