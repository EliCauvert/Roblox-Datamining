local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local useRefToStateModule = require(reactUtils.useRefToState)

return function(p1)
	-- upvalues: useRefToStateModule (ref), reactModule (ref)
	local var1 = useRefToStateModule(p1)
	
	return reactModule.useCallback(function(...)
		-- upvalues: var1 (ref)
		return var1.current(...)
	end, {})
end