local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ Line: 3 | Named "useDrawerShouldMount" ]]
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(false).useDrawerShouldMount()
end