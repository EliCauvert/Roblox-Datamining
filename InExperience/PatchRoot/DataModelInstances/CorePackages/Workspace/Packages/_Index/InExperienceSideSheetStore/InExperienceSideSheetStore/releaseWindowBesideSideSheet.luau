local InExperienceSideSheetStore = script:FindFirstAncestor("InExperienceSideSheetStore")
local Parent = InExperienceSideSheetStore.Parent
local GetDrawerVisibleStoreModule = require(Parent.Drawer.GetDrawerVisibleStore)
local FFlagKeepSideSheetOpenBesideMenuModule = require(Parent.SharedFlags.FFlagKeepSideSheetOpenBesideMenu)
local GetSideSheetStoreModule = require(InExperienceSideSheetStore.Stores.GetSideSheetStore)
local SidesheetAnalyticsModule = require(InExperienceSideSheetStore.Analytics.SidesheetAnalytics)

return function(WindowShownBesideSideSheet, p1): boolean
	-- upvalues: FFlagKeepSideSheetOpenBesideMenuModule (copy), GetSideSheetStoreModule (copy), GetDrawerVisibleStoreModule (copy), SidesheetAnalyticsModule (copy)
	if not FFlagKeepSideSheetOpenBesideMenuModule then
		return false
	end
	local SideSheetStoreModule = GetSideSheetStoreModule(false)
	
	if SideSheetStoreModule.getWindowShownBesideSideSheet(false) ~= WindowShownBesideSideSheet then
		return false
	end
	SideSheetStoreModule.setWindowShownBesideSideSheet(nil)
	local DrawerVisibleStoreModule = GetDrawerVisibleStoreModule(false)
	
	if DrawerVisibleStoreModule.getDrawerVisible(false) then
		DrawerVisibleStoreModule.setDrawerVisible(false)
		SidesheetAnalyticsModule.logSidesheetClosed(p1)
		
		return true
	else
		return true
	end
end