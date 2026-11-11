local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseAvatarOutfitSwitcherFramePropsModule = require(Modules.AvatarExperience.OutfitSwitcher.AvatarOutfitSwitcherFrame.useAvatarOutfitSwitcherFrameProps)
local OutfitSwitcherFrameContainerModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.OutfitSwitcherFrameContainer)

return function()
	-- upvalues: UseAvatarOutfitSwitcherFramePropsModule (copy), ReactModule (copy), OutfitSwitcherFrameContainerModule (copy)
	return ReactModule.createElement(OutfitSwitcherFrameContainerModule, (UseAvatarOutfitSwitcherFramePropsModule()))
end