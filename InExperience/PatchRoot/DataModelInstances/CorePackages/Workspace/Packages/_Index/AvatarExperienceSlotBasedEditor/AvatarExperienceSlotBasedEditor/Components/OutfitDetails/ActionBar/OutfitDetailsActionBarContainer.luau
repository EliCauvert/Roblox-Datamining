local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local outfitDetailsActionBarModule = require(script.Parent.OutfitDetailsActionBar)
local useOutfitDetailsActionBarPropsModule = require(script.Parent.useOutfitDetailsActionBarProps)

return function(p0)
	-- upvalues: useOutfitDetailsActionBarPropsModule (ref), reactModule (ref), outfitDetailsActionBarModule (ref)
	return reactModule.createElement(outfitDetailsActionBarModule, useOutfitDetailsActionBarPropsModule(p0))
end