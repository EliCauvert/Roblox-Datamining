local GetSearchAutocompleteConfigKeyModule = require(script.Parent.getSearchAutocompleteConfigKey)

return function(p1, p2, Callback)
	-- upvalues: GetSearchAutocompleteConfigKeyModule (copy)
	local SearchAutocompleteConfigKeyModule = GetSearchAutocompleteConfigKeyModule(p1)
	
	return SearchAutocompleteConfigKeyModule, function(): boolean
		-- upvalues: Callback (copy), p1 (copy), p2 (copy), GetSearchAutocompleteConfigKeyModule (upval), SearchAutocompleteConfigKeyModule (copy)
		local CallbackResult, CallbackResult2, CallbackResult3 = Callback()
		
		return CallbackResult and (CallbackResult2 == p1 and CallbackResult3 == p2 and GetSearchAutocompleteConfigKeyModule(p1) == SearchAutocompleteConfigKeyModule)
	end
end