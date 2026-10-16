local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)
local UseStoreModule = require(script.Parent.useStore)

return function() --[[ Line: 10 | Named "useDispatch" ]]
	-- upvalues: UseStoreModule (copy), ReactModule (copy)
	local UseStoreModuleResult = UseStoreModule()
	
	return (ReactModule.useCallback(function(...) --[[ Line: 13 ]]
		-- upvalues: UseStoreModuleResult (copy)
		return UseStoreModuleResult:dispatch(...)
	end, { UseStoreModuleResult }))
end