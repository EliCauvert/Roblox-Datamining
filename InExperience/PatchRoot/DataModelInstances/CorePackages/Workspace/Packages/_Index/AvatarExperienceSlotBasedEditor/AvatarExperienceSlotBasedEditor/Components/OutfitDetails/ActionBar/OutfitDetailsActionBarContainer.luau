local ReactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local OutfitDetailsActionBarModule = require(script.Parent.OutfitDetailsActionBar)
local UseOutfitDetailsActionBarPropsModule = require(script.Parent.useOutfitDetailsActionBarProps)

return function(p1) --[[ Line: 9 | Named "OutfitDetailsActionBarContainer" ]]
	-- upvalues: UseOutfitDetailsActionBarPropsModule (copy), ReactModule (copy), OutfitDetailsActionBarModule (copy)
	return ReactModule.createElement(OutfitDetailsActionBarModule, (UseOutfitDetailsActionBarPropsModule(p1)))
end