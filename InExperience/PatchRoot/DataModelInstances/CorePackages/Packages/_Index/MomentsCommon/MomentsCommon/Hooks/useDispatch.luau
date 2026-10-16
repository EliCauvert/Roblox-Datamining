local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local UseStoreModule = require(MomentsCommon.Hooks.useStore)

return function() --[[ Line: 8 | Named "useDispatch" ]]
	-- upvalues: UseStoreModule (copy), ReactModule (copy)
	local UseStoreModuleResult = UseStoreModule()
	
	return (ReactModule.useCallback(function(...) --[[ Line: 11 ]]
		-- upvalues: UseStoreModuleResult (copy)
		return UseStoreModuleResult:dispatch(...)
	end, { UseStoreModuleResult }))
end