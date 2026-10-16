local ReactModule = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.React)
local GetModalSignalStoreModule = require(script.Parent.getModalSignalStore)

return function() --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), GetModalSignalStoreModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 9 ]]
		-- upvalues: GetModalSignalStoreModule (upval)
		return GetModalSignalStoreModule(false)
	end, {})
end