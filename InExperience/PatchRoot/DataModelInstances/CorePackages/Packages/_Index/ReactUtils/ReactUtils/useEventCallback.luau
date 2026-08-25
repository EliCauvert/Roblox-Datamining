local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local useRefToStateModule = require(reactUtils.useRefToState)

return function(p0)
	-- upvalues: useRefToStateModule (ref), reactModule (ref)
	local var3 = useRefToStateModule(p0)
	
	return reactModule.useCallback(function(...)
		-- upvalues: var3 (ref)
		return var3.current(...)
	end, {})
end