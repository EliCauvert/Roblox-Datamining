local reactModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.React)
local outfitDetailsTopBarModule = require(script.Parent.OutfitDetailsTopBar)
local useOutfitDetailsTopBarPropsModule = require(script.Parent.useOutfitDetailsTopBarProps)

return function(p0) --[[ line: 9 | named "OutfitDetailsTopBarContainer" ]]
	-- upvalues: useOutfitDetailsTopBarPropsModule (ref), reactModule (ref), outfitDetailsTopBarModule (ref)
	return reactModule.createElement(outfitDetailsTopBarModule, useOutfitDetailsTopBarPropsModule(p0))
end