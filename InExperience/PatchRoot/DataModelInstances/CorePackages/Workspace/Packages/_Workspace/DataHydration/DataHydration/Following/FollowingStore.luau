local var0 = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(require(script.Parent.createFollowingStore))

return {
	get = function()
		-- upvalues: var0 (ref)
		return var0(false)
	end
}