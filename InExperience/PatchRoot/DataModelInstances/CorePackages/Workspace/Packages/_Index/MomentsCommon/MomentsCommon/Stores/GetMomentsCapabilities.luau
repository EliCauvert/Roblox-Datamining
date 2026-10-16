local CreateMomentsCapabilitiesModule = require(script.createMomentsCapabilities)

return require(script:FindFirstAncestor("MomentsCommon").Parent.Signals).createComputed(function(_) --[[ Line: 13 ]]
	-- upvalues: CreateMomentsCapabilitiesModule (copy)
	return CreateMomentsCapabilitiesModule()
end)