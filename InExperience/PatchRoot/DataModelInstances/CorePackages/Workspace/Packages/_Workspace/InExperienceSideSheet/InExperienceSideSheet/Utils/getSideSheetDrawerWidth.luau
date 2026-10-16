local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local _ = require(InExperienceSideSheet.Parent.Signals)
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: GetSideSheetConfigStoreModule (copy)
	return GetSideSheetConfigStoreModule(p1).getSideSheetDrawerWidth(p1)
end