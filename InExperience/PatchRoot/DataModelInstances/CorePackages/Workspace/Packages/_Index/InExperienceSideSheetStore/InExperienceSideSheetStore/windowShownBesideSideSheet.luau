local InExperienceSideSheetStore = script:FindFirstAncestor("InExperienceSideSheetStore")
local _ = require(InExperienceSideSheetStore.Parent.Signals)
local GetSideSheetStoreModule = require(InExperienceSideSheetStore.Stores.GetSideSheetStore)

return {
	getWindowShownBesideSideSheet = function(p1)
		-- upvalues: GetSideSheetStoreModule (copy)
		return GetSideSheetStoreModule(false).getWindowShownBesideSideSheet(p1)
	end,
	setWindowShownBesideSideSheet = function(p1)
		-- upvalues: GetSideSheetStoreModule (copy)
		GetSideSheetStoreModule(false).setWindowShownBesideSideSheet(p1)
	end
}