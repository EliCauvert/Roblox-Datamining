local CreateShareCountsStoreModule = require(script.createShareCountsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ Line: 11 ]]
	-- upvalues: CreateShareCountsStoreModule (copy)
	return CreateShareCountsStoreModule()
end)