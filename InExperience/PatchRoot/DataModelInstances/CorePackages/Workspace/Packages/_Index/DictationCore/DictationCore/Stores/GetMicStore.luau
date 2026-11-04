local CreateMicStoreModule = require(script.createMicStore)

return require(script:FindFirstAncestor("DictationCore").Parent.Signals).createComputed(function()
	-- upvalues: CreateMicStoreModule (copy)
	return CreateMicStoreModule()
end)