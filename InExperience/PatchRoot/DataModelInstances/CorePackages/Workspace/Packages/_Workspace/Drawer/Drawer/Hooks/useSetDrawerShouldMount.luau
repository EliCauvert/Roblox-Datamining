local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ Line: 3 | Named "useSetDrawerShouldMount" ]]
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(false).setDrawerShouldMount
end