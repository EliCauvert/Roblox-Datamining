local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local UseRefToStateModule = require(ReactUtils.useRefToState)

return function(p1)
	-- upvalues: UseRefToStateModule (copy), ReactModule (copy)
	local UseRefToStateModuleResult = UseRefToStateModule(p1)
	
	return ReactModule.useCallback(function(...)
		-- upvalues: UseRefToStateModuleResult (copy)
		return UseRefToStateModuleResult.current(...)
	end, {})
end