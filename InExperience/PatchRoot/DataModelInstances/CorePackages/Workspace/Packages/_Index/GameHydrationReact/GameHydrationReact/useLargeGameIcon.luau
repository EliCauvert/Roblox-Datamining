local GameHydrationReact = script:FindFirstAncestor("GameHydrationReact")
local DataHydrationModule = require(GameHydrationReact.Parent.DataHydration)
local UseGameIconForSizeModule = require(GameHydrationReact.useGameIconForSize)

return function(p1)
	-- upvalues: UseGameIconForSizeModule (copy), DataHydrationModule (copy)
	return UseGameIconForSizeModule(p1, DataHydrationModule.Game.GameIconSize.Large)
end