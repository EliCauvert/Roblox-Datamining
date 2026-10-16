local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local GetHasRoomForPeoplePageModule = require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local GetSideSheetVisibilityModule = require(InExperienceSideSheet.Utils.getSideSheetVisibility)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)

return function(p1): boolean --[[ Line: 10 ]]
	-- upvalues: GetSideSheetVisibilityModule (copy), GetDidSideSheetOpenWithPeoplePageModule (copy), GetHasRoomForPeoplePageModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy)
	local SideSheetVisibilityModule = GetSideSheetVisibilityModule(false)
	local DidSideSheetOpenWithPeoplePageModule = GetDidSideSheetOpenWithPeoplePageModule(false)
	
	if not SideSheetVisibilityModule or not DidSideSheetOpenWithPeoplePageModule then
		return false
	elseif GetHasRoomForPeoplePageModule(false, p1) then
		return false
	else
		RegisterInGameMenuPeoplePageActionsModule.closePeoplePage(p1)
		
		return true
	end
end