local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ line: 3 | named "useDrawerShouldMount" ]]
	-- upvalues: getDrawerVisibleStoreModule (ref)
	return getDrawerVisibleStoreModule(false).useDrawerShouldMount()
end