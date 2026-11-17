local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local GetHasRoomForPeoplePageModule = require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local DoesMenuPageCloseSideSheetModule = require(InExperienceSideSheet.Utils.doesMenuPageCloseSideSheet)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu
local config = { Players = true, peoplepage = true }
local Flag = false

return function(p1)
	-- upvalues: Flag (ref), GetSideSheetConfigStoreModule (copy), config (copy), GetDidSideSheetOpenWithPeoplePageModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), GetHasRoomForPeoplePageModule (copy), DoesMenuPageCloseSideSheetModule (copy), ToggleSideSheetModule (copy), GetSideSheetVisibilityModule (copy)
	if not Flag then
		Flag = true
		local SideSheetConfigStoreModule = GetSideSheetConfigStoreModule(false)
		
		local function _(p2): boolean
			-- upvalues: config (upval)
			return config[p2 or ""] == true
		end
		
		local _ = function(p2)
			-- upvalues: SideSheetConfigStoreModule (copy), p1 (copy), config (upval)
			SideSheetConfigStoreModule.setIsPeoplePageOpen(p1:GetVisibility() and config[p2 or ""] == true)
		end
		
		p1.CurrentPageSignal:connect(function(p2)
			-- upvalues: config (upval), GetDidSideSheetOpenWithPeoplePageModule (upval), FFlagKeepSideSheetOpenBesideMenu (upval), GetHasRoomForPeoplePageModule (upval), DoesMenuPageCloseSideSheetModule (upval), ToggleSideSheetModule (upval), SideSheetConfigStoreModule (copy), p1 (copy), GetSideSheetVisibilityModule (upval)
			if config[p2 or ""] == true or not GetDidSideSheetOpenWithPeoplePageModule() then
				if FFlagKeepSideSheetOpenBesideMenu and DoesMenuPageCloseSideSheetModule(p2) and p1:GetVisibility() and GetSideSheetVisibilityModule() then
					ToggleSideSheetModule(false)
				end
			elseif FFlagKeepSideSheetOpenBesideMenu and (GetHasRoomForPeoplePageModule() and not DoesMenuPageCloseSideSheetModule(p2)) then
				SideSheetConfigStoreModule.setDidSideSheetOpenWithPeoplePage(false)
			else
				ToggleSideSheetModule(false)
			end
			SideSheetConfigStoreModule.setIsPeoplePageOpen(p1:GetVisibility() and config[p2 or ""] == true)
		end)
		p1.SettingsShowSignal:connect(function(p2)
			-- upvalues: SideSheetConfigStoreModule (copy), p1 (copy), config (upval)
			if p2 then
				local CurrentPage = if p1.Pages then p1.Pages.CurrentPage else nil
				local Name = if CurrentPage then CurrentPage.Page.Name else nil
				SideSheetConfigStoreModule.setIsPeoplePageOpen(p1:GetVisibility() and config[Name or ""] == true)
				
				return
			else
				SideSheetConfigStoreModule.setIsPeoplePageOpen(false)
			end
		end)
		
		return
	end
end