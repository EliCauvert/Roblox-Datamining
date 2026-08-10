local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local useRefToStateModule = require(reactUtils.useRefToState)

return function(p0) --[[ line: 10 | named "useEventCallback" ]]
	-- upvalues: useRefToStateModule (ref), reactModule (ref)
	local var3 = useRefToStateModule(p0)
	
	return reactModule.useCallback(function(...) --[[ line: 12 ]]
		-- upvalues: var3 (ref)
		return var3.current(...)
	end, {})
end