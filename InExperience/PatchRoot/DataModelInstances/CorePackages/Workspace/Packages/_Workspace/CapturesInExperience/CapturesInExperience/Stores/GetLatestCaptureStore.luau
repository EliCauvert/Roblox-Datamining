local CreateLatestCaptureStoreModule = require(script.createLatestCaptureStore)

return require(script.Parent.Parent.Parent.Signals).createComputed(function(_)
	-- upvalues: CreateLatestCaptureStoreModule (copy)
	return CreateLatestCaptureStoreModule()
end)