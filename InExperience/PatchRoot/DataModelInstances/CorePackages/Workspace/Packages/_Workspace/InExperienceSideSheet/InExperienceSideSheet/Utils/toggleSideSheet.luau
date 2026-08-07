local getDrawerVisibleStore = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.Drawer).Stores.GetDrawerVisibleStore

return function(p0) --[[ line: 6 ]]
	-- upvalues: getDrawerVisibleStore (ref)
	getDrawerVisibleStore(false).setDrawerVisible(p0)
end