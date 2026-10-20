local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local ToggleSideSheetModule = require(InExperienceSideSheet.Utils.toggleSideSheet)
local config = { Players = true, peoplepage = true }
local Flag = false

return function(p1)
	-- upvalues: Flag (ref), GetSideSheetConfigStoreModule (copy), config (copy), GetDidSideSheetOpenWithPeoplePageModule (copy), ToggleSideSheetModule (copy)
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
			-- upvalues: config (upval), GetDidSideSheetOpenWithPeoplePageModule (upval), ToggleSideSheetModule (upval), SideSheetConfigStoreModule (copy), p1 (copy)
			if config[p2 or ""] ~= true and GetDidSideSheetOpenWithPeoplePageModule() then
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