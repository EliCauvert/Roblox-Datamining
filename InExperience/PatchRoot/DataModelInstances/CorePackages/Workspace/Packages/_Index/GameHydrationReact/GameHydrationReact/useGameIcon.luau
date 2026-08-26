local useGameIconForSizeModule = require(script:FindFirstAncestor("GameHydrationReact").useGameIconForSize)

return function(p1)
	-- upvalues: useGameIconForSizeModule (ref)
	return useGameIconForSizeModule(p1)
end