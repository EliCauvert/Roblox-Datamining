local createMomentsCapabilitiesModule = require(script.createMomentsCapabilities)

return require(script:FindFirstAncestor("MomentsCommon").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsCapabilitiesModule (ref)
	return createMomentsCapabilitiesModule()
end)