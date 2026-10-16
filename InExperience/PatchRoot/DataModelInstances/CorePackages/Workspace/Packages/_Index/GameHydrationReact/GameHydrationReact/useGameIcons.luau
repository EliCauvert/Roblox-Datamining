local GameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local _ = require(GameHydrationReact.Parent.DataHydration)
local UseGameIconsForSizeModule = require(GameHydrationReact.useGameIconsForSize)

return function(p1, p2) --[[ Line: 14 | Named "useGameIcons" ]]
	-- upvalues: UseGameIconsForSizeModule (copy)
	return UseGameIconsForSizeModule(p1, p2)
end