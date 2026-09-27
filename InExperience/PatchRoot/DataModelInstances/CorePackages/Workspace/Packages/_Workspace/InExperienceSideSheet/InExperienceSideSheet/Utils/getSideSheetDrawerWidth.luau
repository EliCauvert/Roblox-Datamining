local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(inExperienceSideSheet.Parent.Signals)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)

return function(p1)
	-- upvalues: getSideSheetConfigStoreModule (ref)
	return getSideSheetConfigStoreModule(p1).getSideSheetDrawerWidth(p1)
end