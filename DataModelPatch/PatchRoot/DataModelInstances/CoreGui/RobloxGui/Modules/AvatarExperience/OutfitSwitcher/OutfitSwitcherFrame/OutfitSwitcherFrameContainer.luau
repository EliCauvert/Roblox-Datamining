local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UseOutfitSwitcherFramePropsModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.useOutfitSwitcherFrameProps)
local OutfitSwitcherFrameModule = require(Modules.AvatarExperience.OutfitSwitcher.OutfitSwitcherFrame.OutfitSwitcherFrame)

return function(p1)
	-- upvalues: UseOutfitSwitcherFramePropsModule (copy), ReactModule (copy), OutfitSwitcherFrameModule (copy)
	return ReactModule.createElement(OutfitSwitcherFrameModule, (UseOutfitSwitcherFramePropsModule(p1)))
end