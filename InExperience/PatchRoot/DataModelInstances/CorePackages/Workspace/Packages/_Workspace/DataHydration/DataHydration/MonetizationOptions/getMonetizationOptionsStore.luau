local CreateMonetizationOptionsStoreModule = require(script.Parent.createMonetizationOptionsStore)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateMonetizationOptionsStoreModule (copy)
	return CreateMonetizationOptionsStoreModule()
end)