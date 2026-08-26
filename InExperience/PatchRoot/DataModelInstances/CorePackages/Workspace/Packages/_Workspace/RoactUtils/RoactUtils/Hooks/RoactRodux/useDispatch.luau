local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local useStoreModule = require(script.Parent.useStore)

return function()
	-- upvalues: useStoreModule (ref), reactModule (ref)
	local var1 = useStoreModule()
	
	return reactModule.useCallback(function(...)
		-- upvalues: var1 (ref)
		return var1:dispatch(...)
	end, { var1 })
end