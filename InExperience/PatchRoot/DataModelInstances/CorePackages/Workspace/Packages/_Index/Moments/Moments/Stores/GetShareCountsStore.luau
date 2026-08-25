local createShareCountsStoreModule = require(script.createShareCountsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function()
	-- upvalues: createShareCountsStoreModule (ref)
	return createShareCountsStoreModule()
end)