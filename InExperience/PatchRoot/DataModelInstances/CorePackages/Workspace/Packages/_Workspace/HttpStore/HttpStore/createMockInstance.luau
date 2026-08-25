local createMockHttpStore = require(script.Parent.Parent.InternalHttpStore).createMockHttpStore

return function()
	-- upvalues: createMockHttpStore (ref)
	local var0 = createMockHttpStore()
	
	return {
		get = function()
			-- upvalues: var0 (ref)
			return var0
		end,
		_create = function()
			-- upvalues: var0 (ref)
			return var0
		end,
		_dispose = function()
			-- upvalues: var0 (ref)
			var0.reset()
		end,
		setResponse = var0.setResponse,
		reset = var0.reset,
		mockStore = var0
	}
end