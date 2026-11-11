local CreateShareCountsStoreModule = require(script.createShareCountsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: CreateShareCountsStoreModule (copy)
	return CreateShareCountsStoreModule()
end)