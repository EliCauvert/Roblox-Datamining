local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseAvatarSwitcherPagePropsModule = require(Modules.AvatarExperience.AvatarSwitcher.useAvatarSwitcherPageProps)
local AvatarSwitcherPageModule = require(Modules.AvatarExperience.AvatarSwitcher.AvatarSwitcherPage)

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseAvatarSwitcherPagePropsModule (copy), ReactModule (copy), AvatarSwitcherPageModule (copy)
	return ReactModule.createElement(AvatarSwitcherPageModule, (UseAvatarSwitcherPagePropsModule()))
end))