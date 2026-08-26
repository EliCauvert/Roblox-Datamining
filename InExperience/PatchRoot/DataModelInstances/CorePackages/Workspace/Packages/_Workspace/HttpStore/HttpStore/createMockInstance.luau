local createMockHttpStore = require(script.Parent.Parent.InternalHttpStore).createMockHttpStore

return function()
	-- upvalues: createMockHttpStore (ref)
	local var1 = createMockHttpStore()
	
	return {
		get = function()
			-- upvalues: var1 (ref)
			return var1
		end,
		_create = function()
			-- upvalues: var1 (ref)
			return var1
		end,
		_dispose = function()
			-- upvalues: var1 (ref)
			var1.reset()
		end,
		setResponse = var1.setResponse,
		reset = var1.reset,
		mockStore = var1
	}
end