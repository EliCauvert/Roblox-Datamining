local ReactModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.React)
local GetModalSignalStoreModule = require(script.Parent.getModalSignalStore)

return function()
	-- upvalues: ReactModule (copy), GetModalSignalStoreModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: GetModalSignalStoreModule (upval)
		return GetModalSignalStoreModule(false)
	end, {})
end