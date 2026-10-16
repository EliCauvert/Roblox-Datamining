local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ Line: 3 | Named "useSetDrawerVisible" ]]
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(false).setDrawerVisible
end