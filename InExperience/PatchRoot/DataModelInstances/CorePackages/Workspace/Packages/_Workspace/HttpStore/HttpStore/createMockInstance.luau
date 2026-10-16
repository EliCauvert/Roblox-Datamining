local CreateMockHttpStoreFunction = require(script.Parent.Parent.InternalHttpStore).createMockHttpStore

return function() --[[ Line: 67 | Named "createMockInstance" ]]
	-- upvalues: CreateMockHttpStoreFunction (copy)
	local MockHttpStore = CreateMockHttpStoreFunction()
	
	return {
		get = function() --[[ Line: 72 ]]
			-- upvalues: MockHttpStore (copy)
			return MockHttpStore
		end,
		_create = function() --[[ Line: 75 ]]
			-- upvalues: MockHttpStore (copy)
			return MockHttpStore
		end,
		_dispose = function() --[[ Line: 78 ]]
			-- upvalues: MockHttpStore (copy)
			MockHttpStore.reset()
		end,
		setResponse = MockHttpStore.setResponse,
		reset = MockHttpStore.reset,
		mockStore = MockHttpStore
	}
end