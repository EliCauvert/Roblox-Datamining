local CreateMockHttpStoreFunction = require(script.Parent.Parent.InternalHttpStore).createMockHttpStore

return function()
	-- upvalues: CreateMockHttpStoreFunction (copy)
	local MockHttpStore = CreateMockHttpStoreFunction()
	
	return {
		get = function()
			-- upvalues: MockHttpStore (copy)
			return MockHttpStore
		end,
		_create = function()
			-- upvalues: MockHttpStore (copy)
			return MockHttpStore
		end,
		_dispose = function()
			-- upvalues: MockHttpStore (copy)
			MockHttpStore.reset()
		end,
		setResponse = MockHttpStore.setResponse,
		reset = MockHttpStore.reset,
		mockStore = MockHttpStore
	}
end