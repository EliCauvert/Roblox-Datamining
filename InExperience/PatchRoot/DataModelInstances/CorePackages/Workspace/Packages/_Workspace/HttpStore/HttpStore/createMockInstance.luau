local createMockHttpStore = require(script.Parent.Parent.InternalHttpStore).createMockHttpStore

return function() --[[ line: 67 | named "createMockInstance" ]]
	-- upvalues: createMockHttpStore (ref)
	local var0 = createMockHttpStore()
	
	return {
		get = function() --[[ line: 72 ]]
			-- upvalues: var0 (ref)
			return var0
		end,
		_create = function() --[[ line: 75 ]]
			-- upvalues: var0 (ref)
			return var0
		end,
		_dispose = function() --[[ line: 78 ]]
			-- upvalues: var0 (ref)
			var0.reset()
		end,
		setResponse = var0.setResponse,
		reset = var0.reset,
		mockStore = var0
	}
end