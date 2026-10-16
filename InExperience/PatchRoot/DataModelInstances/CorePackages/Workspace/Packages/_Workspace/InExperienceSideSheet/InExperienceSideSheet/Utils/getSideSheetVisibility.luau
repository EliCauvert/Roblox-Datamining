local GetDrawerVisibleStoreFunction = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p1) --[[ Line: 6 ]]
	-- upvalues: GetDrawerVisibleStoreFunction (copy)
	return GetDrawerVisibleStoreFunction(p1).getDrawerVisible(p1)
end