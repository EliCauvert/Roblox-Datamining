local CreateUploadStoreModule = require(script.createUploadStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: CreateUploadStoreModule (copy)
	return CreateUploadStoreModule()
end)