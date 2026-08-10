local createMomentsCapabilitiesModule = require(script.createMomentsCapabilities)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ line: 13 ]]
	-- upvalues: createMomentsCapabilitiesModule (ref)
	return createMomentsCapabilitiesModule()
end)