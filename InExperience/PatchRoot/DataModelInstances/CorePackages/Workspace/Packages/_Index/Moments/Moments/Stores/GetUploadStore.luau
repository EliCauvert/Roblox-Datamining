local createUploadStoreModule = require(script.createUploadStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_)
	-- upvalues: createUploadStoreModule (ref)
	return createUploadStoreModule()
end)