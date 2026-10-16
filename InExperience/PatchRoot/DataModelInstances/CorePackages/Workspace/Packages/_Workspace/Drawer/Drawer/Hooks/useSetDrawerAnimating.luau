local GetDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ Line: 3 | Named "useSetDrawerAnimating" ]]
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(false).setDrawerAnimating
end