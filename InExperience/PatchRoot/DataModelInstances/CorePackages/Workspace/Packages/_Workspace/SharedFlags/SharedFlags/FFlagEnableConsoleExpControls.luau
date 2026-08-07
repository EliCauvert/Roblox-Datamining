local parent = script.Parent

return require(parent:WaitForChild("FFlagEnableConsoleExpControlsIXP")) or (require(parent:WaitForChild("FFlagEnableInExperienceHandheldControls")) or game:DefineFastFlag("EnableConsoleExpControls684", false))