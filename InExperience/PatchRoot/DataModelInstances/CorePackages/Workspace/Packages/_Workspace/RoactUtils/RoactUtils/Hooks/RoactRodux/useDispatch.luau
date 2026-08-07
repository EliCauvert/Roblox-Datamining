local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useStoreModule = require(script.Parent.useStore)

return function() --[[ line: 10 | named "useDispatch" ]]
	-- upvalues: useStoreModule (ref), reactModule (ref)
	local var2 = useStoreModule()
	
	return reactModule.useCallback(function(...) --[[ line: 13 ]]
		-- upvalues: var2 (ref)
		return var2:dispatch(...)
	end, { var2 })
end