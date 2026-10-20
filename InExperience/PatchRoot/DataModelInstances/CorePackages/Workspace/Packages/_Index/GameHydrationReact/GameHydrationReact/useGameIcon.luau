local UseGameIconForSizeModule = require(script:FindFirstAncestor("GameHydrationReact").useGameIconForSize)

return function(p1)
	-- upvalues: UseGameIconForSizeModule (copy)
	return UseGameIconForSizeModule(p1)
end