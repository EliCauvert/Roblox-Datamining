local CreateShareLinkV2StoreModule = require(script.createShareLinkV2Store)

return require(script:FindFirstAncestor("AppChat").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateShareLinkV2StoreModule (copy)
	return CreateShareLinkV2StoreModule()
end)