local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local useStoreModule = require(momentsCommon.Hooks.useStore)

return function()
	-- upvalues: useStoreModule (ref), reactModule (ref)
	local var1 = useStoreModule()
	
	return reactModule.useCallback(function(...)
		-- upvalues: var1 (ref)
		return var1:dispatch(...)
	end, { var1 })
end