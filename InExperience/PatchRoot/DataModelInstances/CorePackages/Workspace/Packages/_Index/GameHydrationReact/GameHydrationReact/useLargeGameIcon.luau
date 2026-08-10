local gameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local dataHydrationModule = require(gameHydrationReact.Parent.DataHydration)
local useGameIconForSizeModule = require(gameHydrationReact.useGameIconForSize)

return function(p0) --[[ line: 9 | named "useLargeGameIcon" ]]
	-- upvalues: useGameIconForSizeModule (ref), dataHydrationModule (ref)
	return useGameIconForSizeModule(p0, dataHydrationModule.Game.GameIconSize.Large)
end