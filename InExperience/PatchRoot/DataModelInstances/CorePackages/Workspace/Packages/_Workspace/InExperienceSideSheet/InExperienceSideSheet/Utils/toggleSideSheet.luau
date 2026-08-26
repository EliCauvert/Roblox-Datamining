local getDrawerVisibleStore = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p1)
	-- upvalues: getDrawerVisibleStore (ref)
	getDrawerVisibleStore(false).setDrawerVisible(p1)
end