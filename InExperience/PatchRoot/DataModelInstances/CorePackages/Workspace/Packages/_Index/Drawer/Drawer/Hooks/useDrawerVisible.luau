local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ line: 3 | named "useDrawerVisible" ]]
	-- upvalues: getDrawerVisibleStoreModule (ref)
	return getDrawerVisibleStoreModule(false).useDrawerVisible()
end