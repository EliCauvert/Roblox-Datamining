local gameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local dataHydrationModule = require(gameHydrationReact.Parent.DataHydration)
local useGameIconForSizeModule = require(gameHydrationReact.useGameIconForSize)

return function(p0)
	-- upvalues: useGameIconForSizeModule (ref), dataHydrationModule (ref)
	return useGameIconForSizeModule(p0, dataHydrationModule.Game.GameIconSize.Large)
end