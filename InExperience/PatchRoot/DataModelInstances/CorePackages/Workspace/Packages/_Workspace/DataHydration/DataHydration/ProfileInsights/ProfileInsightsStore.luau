local createProfileInsightsStoreModule = require(script.Parent.createProfileInsightsStore)
local var1 = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(function()
	-- upvalues: createProfileInsightsStoreModule (ref)
	return createProfileInsightsStoreModule()
end)

return {
	get = function()
		-- upvalues: var1 (ref)
		return var1(false)
	end
}