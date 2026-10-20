local GameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local _ = require(GameHydrationReact.Parent.DataHydration)
local UseGameIconsForSizeModule = require(GameHydrationReact.useGameIconsForSize)

return function(p1, p2)
	-- upvalues: UseGameIconsForSizeModule (copy)
	return UseGameIconsForSizeModule(p1, p2, true)
end