local parent = script:FindFirstAncestor("DataHydration").Parent
local signalsModule = require(parent.Signals)
local createProfileCTAStoreModule = require(script.Parent.createProfileCTAStore)
local var1 = if require(parent.SharedFlags).FFlagJoinabilityCTARefactor then signalsModule.createComputed(function()
	-- upvalues: createProfileCTAStoreModule (ref)
	return createProfileCTAStoreModule()
end) else signalsModule.createComputed(createProfileCTAStoreModule)

return {
	get = function()
		-- upvalues: var1 (write)
		return var1(false)
	end
}