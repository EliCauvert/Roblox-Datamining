local CreateUploadStoreModule = require(script.createUploadStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ Line: 7 ]]
	-- upvalues: CreateUploadStoreModule (copy)
	return CreateUploadStoreModule()
end)