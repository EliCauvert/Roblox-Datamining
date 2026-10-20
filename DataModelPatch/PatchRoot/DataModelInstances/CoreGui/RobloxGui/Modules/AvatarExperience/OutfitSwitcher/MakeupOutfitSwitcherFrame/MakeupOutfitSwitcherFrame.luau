local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseMakeupOutfitSwitcherFramePropsModule = require(Modules.AvatarExperience.OutfitSwitcher.MakeupOutfitSwitcherFrame.useMakeupOutfitSwitcherFrameProps)
local OutfitSwitcherFrameContainerModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.OutfitSwitcherFrameContainer)

return function()
	-- upvalues: UseMakeupOutfitSwitcherFramePropsModule (copy), ReactModule (copy), OutfitSwitcherFrameContainerModule (copy)
	return ReactModule.createElement(OutfitSwitcherFrameContainerModule, (UseMakeupOutfitSwitcherFramePropsModule()))
end