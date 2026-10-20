local CreateMomentsCapabilitiesModule = require(script.createMomentsCapabilities)

return require(script:FindFirstAncestor("MomentsCommon").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateMomentsCapabilitiesModule (copy)
	return CreateMomentsCapabilitiesModule()
end)