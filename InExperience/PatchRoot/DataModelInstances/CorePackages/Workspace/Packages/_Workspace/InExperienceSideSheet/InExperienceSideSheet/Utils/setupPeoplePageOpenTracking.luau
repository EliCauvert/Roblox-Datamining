local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getDidSideSheetOpenWithPeoplePageModule = require(inExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local toggleSideSheetModule = require(inExperienceSideSheet.Utils.toggleSideSheet)
local t = { Players = true, peoplepage = true }
local var1 = false

return function(p1)
	-- upvalues: var1 (write), getSideSheetConfigStoreModule (ref), t (ref), getDidSideSheetOpenWithPeoplePageModule (ref), toggleSideSheetModule (ref)
	if var1 then
		return
	end
	var1 = true
	local var2 = getSideSheetConfigStoreModule(false)
	
	local function _(p2)
		-- upvalues: t (copy)
		return t[p2 or ""] == true
	end
	
	local _ = function(p2)
		-- upvalues: var2 (ref), p1 (ref), t (copy)
		var2.setIsPeoplePageOpen(p1:GetVisibility() and t[p2 or ""] == true)
	end
	
	p1.CurrentPageSignal:connect(function(p2)
		-- upvalues: t (copy), getDidSideSheetOpenWithPeoplePageModule (copy), toggleSideSheetModule (copy), var2 (ref), p1 (ref)
		if t[p2 or ""] ~= true and getDidSideSheetOpenWithPeoplePageModule() then
			toggleSideSheetModule(false)
		end
		var2.setIsPeoplePageOpen(p1:GetVisibility() and t[p2 or ""] == true)
	end)
	p1.SettingsShowSignal:connect(function(p2)
		-- upvalues: var2 (ref), p1 (ref), t (copy)
		if p2 then
			local var3 = if p1.Pages then p1.Pages.CurrentPage else nil
			var2.setIsPeoplePageOpen(p1:GetVisibility() and t[(if var3 then var3.Page.Name else nil) or ""] == true)
			
			return
		end
		var2.setIsPeoplePageOpen(false)
	end)
end