local reactModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.React)
local getModalSignalStoreModule = require(script.Parent.getModalSignalStore)

return function()
	-- upvalues: reactModule (ref), getModalSignalStoreModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: getModalSignalStoreModule (copy)
		return getModalSignalStoreModule(false)
	end, {})
end