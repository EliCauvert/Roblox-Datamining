local Parent = script:FindFirstAncestor("DataHydration").Parent
local SignalsModule = require(Parent.Signals)
local CreateProfileCTAStoreModule = require(script.Parent.createProfileCTAStore)
local Computed = nil
Computed = if require(Parent.SharedFlags).FFlagJoinabilityCTARefactor then SignalsModule.createComputed(function() --[[ Line: 15 ]]
	-- upvalues: CreateProfileCTAStoreModule (copy)
	return CreateProfileCTAStoreModule()
end) else SignalsModule.createComputed(CreateProfileCTAStoreModule)

return {
	get = function() --[[ Line: 25 ]]
		-- upvalues: Computed (ref)
		return Computed(false)
	end
}