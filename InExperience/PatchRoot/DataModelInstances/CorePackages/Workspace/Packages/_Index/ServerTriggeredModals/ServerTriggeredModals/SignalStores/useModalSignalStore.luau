local reactModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.React)
local getModalSignalStoreModule = require(script.Parent.getModalSignalStore)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), getModalSignalStoreModule (ref)
	return reactModule.useMemo(function() --[[ line: 9 ]]
		-- upvalues: getModalSignalStoreModule (copy)
		return getModalSignalStoreModule(false)
	end, {})
end