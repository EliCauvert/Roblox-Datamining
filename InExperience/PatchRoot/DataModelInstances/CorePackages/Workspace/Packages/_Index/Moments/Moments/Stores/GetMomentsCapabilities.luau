local createMomentsCapabilitiesModule = require(script.createMomentsCapabilities)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createMomentsCapabilitiesModule (ref)
	return createMomentsCapabilitiesModule()
end)