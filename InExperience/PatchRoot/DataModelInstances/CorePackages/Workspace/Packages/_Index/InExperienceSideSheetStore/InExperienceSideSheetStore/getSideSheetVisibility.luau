local Parent = script:FindFirstAncestor("InExperienceSideSheetStore").Parent
local _ = require(Parent.Signals)
local GetDrawerVisibleStoreModule = require(Parent.Drawer.GetDrawerVisibleStore)

return function(p1)
	-- upvalues: GetDrawerVisibleStoreModule (copy)
	return GetDrawerVisibleStoreModule(p1).getDrawerVisible(p1)
end