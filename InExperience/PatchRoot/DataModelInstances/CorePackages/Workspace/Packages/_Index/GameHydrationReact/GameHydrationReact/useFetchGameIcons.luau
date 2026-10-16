local GameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local _ = require(GameHydrationReact.Parent.DataHydration)
local UseGameIconsForSizeModule = require(GameHydrationReact.useGameIconsForSize)

return function(p1, p2) --[[ Line: 16 | Named "useFetchGameIcons" ]]
	-- upvalues: UseGameIconsForSizeModule (copy)
	return UseGameIconsForSizeModule(p1, p2, true)
end