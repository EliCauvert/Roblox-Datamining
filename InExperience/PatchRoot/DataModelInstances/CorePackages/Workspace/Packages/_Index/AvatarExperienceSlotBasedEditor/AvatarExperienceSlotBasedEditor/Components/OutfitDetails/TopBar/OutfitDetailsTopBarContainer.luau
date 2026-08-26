local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local outfitDetailsTopBarModule = require(script.Parent.OutfitDetailsTopBar)
local useOutfitDetailsTopBarPropsModule = require(script.Parent.useOutfitDetailsTopBarProps)

return function(p1)
	-- upvalues: useOutfitDetailsTopBarPropsModule (ref), reactModule (ref), outfitDetailsTopBarModule (ref)
	return reactModule.createElement(outfitDetailsTopBarModule, useOutfitDetailsTopBarPropsModule(p1))
end