local createMonetizationOptionsStoreModule = require(script.Parent.createMonetizationOptionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createMonetizationOptionsStoreModule (ref)
	return createMonetizationOptionsStoreModule()
end)