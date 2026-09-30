local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local getDidSideSheetOpenWithPeoplePageModule = require(inExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local getHasRoomForPeoplePageModule = require(inExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local getSideSheetVisibilityModule = require(inExperienceSideSheet.Utils.getSideSheetVisibility)
local registerInGameMenuPeoplePageActionsModule = require(inExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)

return function(p1)
	-- upvalues: getSideSheetVisibilityModule (ref), getDidSideSheetOpenWithPeoplePageModule (ref), getHasRoomForPeoplePageModule (ref), registerInGameMenuPeoplePageActionsModule (ref)
	if not getSideSheetVisibilityModule(false) or not getDidSideSheetOpenWithPeoplePageModule(false) then
		return false
	elseif getHasRoomForPeoplePageModule(false, p1) then
		return false
	end
	registerInGameMenuPeoplePageActionsModule.closePeoplePage(p1)
	
	return true
end