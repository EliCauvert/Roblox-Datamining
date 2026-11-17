local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetHasRoomForPeoplePageModule = require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)
local DoesMenuPageCloseSideSheetModule = require(InExperienceSideSheet.Utils.doesMenuPageCloseSideSheet)

return function(p1)
	-- upvalues: RegisterInGameMenuPeoplePageActionsModule (copy), GetSideSheetConfigStoreModule (copy), GetSideSheetVisibilityModule (copy), GetHasRoomForPeoplePageModule (copy), DoesMenuPageCloseSideSheetModule (copy)
	RegisterInGameMenuPeoplePageActionsModule.registerCloseMenuShownBesideSideSheet(function()
		-- upvalues: p1 (copy), GetSideSheetConfigStoreModule (upval), GetSideSheetVisibilityModule (upval), GetHasRoomForPeoplePageModule (upval), DoesMenuPageCloseSideSheetModule (upval)
		if not p1:GetVisibility() then return end
		local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
		local SideSheetVisibilityModule = GetSideSheetVisibilityModule(false)
		
		if SideSheetVisibilityModule then
			if not GetHasRoomForPeoplePageModule() then return end
		elseif not SideSheetConfigStoreModule.getIsMenuShownBesideSideSheet(false) then return end
		local Pages = p1.Pages
		local CurrentPage = if Pages then Pages.CurrentPage else nil
		local Name = if CurrentPage then CurrentPage.Page.Name else nil
		SideSheetConfigStoreModule.setIsMenuShownBesideSideSheet(false)
		
		if DoesMenuPageCloseSideSheetModule(Name) then return end
		SideSheetConfigStoreModule.setDidSideSheetOpenWithPeoplePage(false)
		
		if SideSheetVisibilityModule then
			p1:ReplaceWithWindowBesideSideSheet()
			
			return
		else
			p1:CloseForSideSheet()
		end
	end)
end