local CreateAppAttentionStoreModule = require(script.createAppAttentionStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateAppAttentionStoreModule (copy)
	return CreateAppAttentionStoreModule()
end)