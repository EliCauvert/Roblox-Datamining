local getDrawerVisibleStoreModule = require(script.Parent.Parent.Stores.GetDrawerVisibleStore)

return function() --[[ line: 3 | named "useSetDrawerShouldMount" ]]
	-- upvalues: getDrawerVisibleStoreModule (ref)
	return getDrawerVisibleStoreModule(false).setDrawerShouldMount
end