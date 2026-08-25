local gameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local _ = require(gameHydrationReact.Parent.DataHydration)
local useGameIconsForSizeModule = require(gameHydrationReact.useGameIconsForSize)

return function(p0, p1)
	-- upvalues: useGameIconsForSizeModule (ref)
	return useGameIconsForSizeModule(p0, p1)
end