local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ line: 3 | named "useSetDrawerVisible" ]]
	-- upvalues: getDrawerVisibleStoreModule (ref)
	return getDrawerVisibleStoreModule(false).setDrawerVisible
end