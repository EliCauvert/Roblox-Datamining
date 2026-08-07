local createUploadStoreModule = require(script.createUploadStore)

return require(script:FindFirstAncestor("Moments").Parent.Signals).createComputed(function(_) --[[ line: 7 ]]
	-- upvalues: createUploadStoreModule (ref)
	return createUploadStoreModule()
end)