local gameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local dataHydrationModule = require(gameHydrationReact.Parent.DataHydration)
local useGameIconForSizeModule = require(gameHydrationReact.useGameIconForSize)

return function(p1)
	-- upvalues: useGameIconForSizeModule (ref), dataHydrationModule (ref)
	return useGameIconForSizeModule(p1, dataHydrationModule.Game.GameIconSize.Large)
end