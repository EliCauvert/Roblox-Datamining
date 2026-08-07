local var0 = require(script:FindFirstAncestor("DataHydration").Parent.Signals).createComputed(require(script.Parent.createTrustedConnectionsStore))

return {
	get = function() --[[ line: 11 ]]
		-- upvalues: var0 (ref)
		return var0(false)
	end
}