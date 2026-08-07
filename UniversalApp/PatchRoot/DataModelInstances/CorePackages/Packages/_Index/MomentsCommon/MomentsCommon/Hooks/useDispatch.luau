local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local useStoreModule = require(momentsCommon.Hooks.useStore)

return function() --[[ line: 8 | named "useDispatch" ]]
	-- upvalues: useStoreModule (ref), reactModule (ref)
	local var3 = useStoreModule()
	
	return reactModule.useCallback(function(...) --[[ line: 11 ]]
		-- upvalues: var3 (ref)
		return var3:dispatch(...)
	end, { var3 })
end