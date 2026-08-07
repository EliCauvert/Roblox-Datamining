local chrome = script.Parent.Parent.Parent.Chrome

return require(chrome.Flags.FFlagUnibarMenuOpenHamburger) or require(chrome.Flags.FFlagUnibarMenuOpenSubmenu) or require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableInExperienceHandheldControls