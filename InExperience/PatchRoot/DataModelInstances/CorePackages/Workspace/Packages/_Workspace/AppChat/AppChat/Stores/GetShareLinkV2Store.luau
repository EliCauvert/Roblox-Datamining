local createShareLinkV2StoreModule = require(script.createShareLinkV2Store)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_) --[[ line: 8 ]]
	-- upvalues: createShareLinkV2StoreModule (ref)
	return createShareLinkV2StoreModule()
end)