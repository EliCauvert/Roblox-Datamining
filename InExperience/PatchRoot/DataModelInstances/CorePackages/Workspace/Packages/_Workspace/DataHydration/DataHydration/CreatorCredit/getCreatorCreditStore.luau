local signalsModule = require(script:FindFirstAncestor("DataHydration").Parent.Signals)
local createCreatorCreditStoreModule = require(script.Parent.createCreatorCreditStore)
local _ = require(script.Parent.types)

return signalsModule.createComputed(function()
	-- upvalues: createCreatorCreditStoreModule (ref)
	return createCreatorCreditStoreModule()
end)