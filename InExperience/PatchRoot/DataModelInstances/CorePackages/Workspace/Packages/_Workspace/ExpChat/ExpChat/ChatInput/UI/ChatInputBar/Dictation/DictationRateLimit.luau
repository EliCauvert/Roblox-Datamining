local GetDictationStateStoreModule = require(script:FindFirstAncestor("ExpChat").Stores.GetDictationStateStore)

return require(script.Parent.createDictationRateLimit)({
	getIsListening = function()
		-- upvalues: GetDictationStateStoreModule (copy)
		return GetDictationStateStoreModule(false).getIsListening(false)
	end
})