local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local UseStoreModule = require(MomentsCommon.Hooks.useStore)

return function()
	-- upvalues: UseStoreModule (copy), ReactModule (copy)
	local UseStoreModuleResult = UseStoreModule()
	
	return (ReactModule.useCallback(function(...)
		-- upvalues: UseStoreModuleResult (copy)
		return UseStoreModuleResult:dispatch(...)
	end, { UseStoreModuleResult }))
end