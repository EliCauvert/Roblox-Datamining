local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local UseStoreModule = require(script.Parent.useStore)

return function()
	-- upvalues: UseStoreModule (copy), ReactModule (copy)
	local UseStoreModuleResult = UseStoreModule()
	
	return (ReactModule.useCallback(function(...)
		-- upvalues: UseStoreModuleResult (copy)
		return UseStoreModuleResult:dispatch(...)
	end, { UseStoreModuleResult }))
end