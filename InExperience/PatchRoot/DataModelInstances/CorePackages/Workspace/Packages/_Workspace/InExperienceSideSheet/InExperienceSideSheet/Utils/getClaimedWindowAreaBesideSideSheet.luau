local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local SideSheetBesideMenuPolicyModule = require(InExperienceSideSheet.Utils.sideSheetBesideMenuPolicy)

return function(WindowShownBesideSideSheet)
	-- upvalues: GetSideSheetConfigStoreModule (copy), SideSheetBesideMenuPolicyModule (copy)
	return if GetSideSheetConfigStoreModule(false).getWindowShownBesideSideSheet(false) == WindowShownBesideSideSheet then SideSheetBesideMenuPolicyModule.getBesideSideSheetWindowArea() else nil
end