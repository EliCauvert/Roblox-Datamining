local GetDrawerVisibleStoreFunction = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p1)
	-- upvalues: GetDrawerVisibleStoreFunction (copy)
	GetDrawerVisibleStoreFunction(false).setDrawerVisible(p1)
end