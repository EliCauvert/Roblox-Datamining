local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local GetSideSheetStoreModule = require(Parent.InExperienceSideSheetStore.GetSideSheetStore)
local GetSideSheetDrawerWidthModule = require(InExperienceSideSheet.Utils.getSideSheetDrawerWidth)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local SideSheetBesideMenuPolicyModule = require(InExperienceSideSheet.Utils.sideSheetBesideMenuPolicy)

return function()
	-- upvalues: GetSideSheetStoreModule (copy), SignalsModule (copy), GetSideSheetVisibilityModule (copy), GetSideSheetDrawerWidthModule (copy), DisplayModule (copy), SideSheetBesideMenuPolicyModule (copy)
	local SideSheetStoreModule = GetSideSheetStoreModule(false)
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: SideSheetStoreModule (copy), GetSideSheetVisibilityModule (upval), GetSideSheetDrawerWidthModule (upval), DisplayModule (upval), SideSheetBesideMenuPolicyModule (upval)
		local WindowShownBesideSideSheet = SideSheetStoreModule.getWindowShownBesideSideSheet(p1)
		
		if WindowShownBesideSideSheet == nil then
			SideSheetStoreModule.setClaimedWindowArea(nil)
			
			return
		else
			GetSideSheetVisibilityModule(p1)
			GetSideSheetDrawerWidthModule(p1)
			local DisplayStore = DisplayModule.GetDisplayStore(p1)
			DisplayStore.getViewportSize(p1)
			DisplayStore.getDeviceSafePadding(p1)
			local BesideSideSheetWindowArea = SideSheetBesideMenuPolicyModule.getBesideSideSheetWindowArea()
			SideSheetStoreModule.setClaimedWindowArea(if BesideSideSheetWindowArea then {
				integrationId = WindowShownBesideSideSheet,
				area = BesideSideSheetWindowArea
			} else nil)
		end
	end)
	
	return function()
		-- upvalues: Effect (copy), SideSheetStoreModule (copy)
		Effect()
		SideSheetStoreModule.setClaimedWindowArea(nil)
	end
end