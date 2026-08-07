local createShareCountsStoreModule = require(script.createShareCountsStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function() --[[ line: 11 ]]
	-- upvalues: createShareCountsStoreModule (ref)
	return createShareCountsStoreModule()
end)