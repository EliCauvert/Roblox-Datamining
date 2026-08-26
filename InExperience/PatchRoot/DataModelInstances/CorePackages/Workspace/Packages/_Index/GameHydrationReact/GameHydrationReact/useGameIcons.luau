local gameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local _ = require(gameHydrationReact.Parent.DataHydration)
local useGameIconsForSizeModule = require(gameHydrationReact.useGameIconsForSize)

return function(p1, p2)
	-- upvalues: useGameIconsForSizeModule (ref)
	return useGameIconsForSizeModule(p1, p2)
end