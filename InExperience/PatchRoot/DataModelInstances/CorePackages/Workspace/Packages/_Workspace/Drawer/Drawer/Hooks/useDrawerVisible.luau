local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ Line: 3 | Named "useDrawerVisible" ]]
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(false).useDrawerVisible()
end