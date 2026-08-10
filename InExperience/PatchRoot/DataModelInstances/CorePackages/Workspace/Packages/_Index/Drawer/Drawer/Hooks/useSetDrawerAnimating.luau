local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ line: 3 | named "useSetDrawerAnimating" ]]
	-- upvalues: getDrawerVisibleStoreModule (ref)
	return getDrawerVisibleStoreModule(false).setDrawerAnimating
end