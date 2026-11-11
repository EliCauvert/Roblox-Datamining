local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseAvatarSwitcherFramePropsModule = require(Modules.AvatarExperience.AvatarEditor.Components.useAvatarSwitcherFrameProps)
local AvatarSwitcherFrameModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrame)

return function()
	-- upvalues: UseAvatarSwitcherFramePropsModule (copy), ReactModule (copy), AvatarSwitcherFrameModule (copy)
	return ReactModule.createElement(AvatarSwitcherFrameModule, (UseAvatarSwitcherFramePropsModule()))
end