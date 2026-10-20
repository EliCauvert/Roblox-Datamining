local CreateCreatorCreditStoreModule = require(script.Parent.createCreatorCreditStore)
local _ = require(script.Parent.types)

return require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: CreateCreatorCreditStoreModule (copy)
	return CreateCreatorCreditStoreModule()
end)