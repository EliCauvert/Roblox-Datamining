local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local UseRefToStateModule = require(ReactUtils.useRefToState)

return function(p1) --[[ Line: 10 | Named "useEventCallback" ]]
	-- upvalues: UseRefToStateModule (copy), ReactModule (copy)
	local UseRefToStateModuleResult = UseRefToStateModule(p1)
	
	return ReactModule.useCallback(function(...) --[[ Line: 12 ]]
		-- upvalues: UseRefToStateModuleResult (copy)
		return UseRefToStateModuleResult.current(...)
	end, {})
end