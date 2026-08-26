local getDrawerVisibleStore = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p1)
	-- upvalues: getDrawerVisibleStore (ref)
	return getDrawerVisibleStore(p1).getDrawerVisible(p1)
end