local getDrawerVisibleStore = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p0)
	-- upvalues: getDrawerVisibleStore (ref)
	return getDrawerVisibleStore(p0).getDrawerVisible(p0)
end