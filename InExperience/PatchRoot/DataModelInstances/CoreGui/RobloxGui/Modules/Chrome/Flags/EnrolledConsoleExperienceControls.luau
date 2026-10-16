local FFlagEnableInExperienceHandheldControls = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagEnableInExperienceHandheldControls
local Chrome = script.Parent.Parent.Parent.Chrome
local FFlagUnibarMenuOpenSubmenuModule = require(Chrome.Flags.FFlagUnibarMenuOpenSubmenu)

return require(Chrome.Flags.FFlagUnibarMenuOpenHamburger) or FFlagUnibarMenuOpenSubmenuModule or FFlagEnableInExperienceHandheldControls