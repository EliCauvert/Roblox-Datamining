local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local OutfitDetailsTopBarModule = require(script.Parent.OutfitDetailsTopBar)
local UseOutfitDetailsTopBarPropsModule = require(script.Parent.useOutfitDetailsTopBarProps)

return function(p1)
	-- upvalues: UseOutfitDetailsTopBarPropsModule (copy), ReactModule (copy), OutfitDetailsTopBarModule (copy)
	return ReactModule.createElement(OutfitDetailsTopBarModule, (UseOutfitDetailsTopBarPropsModule(p1)))
end