local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local getDidSideSheetOpenWithPeoplePageModule = require(inExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local registerInGameMenuPeoplePageActionsModule = require(inExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)

return function()
	-- upvalues: getDidSideSheetOpenWithPeoplePageModule (ref), registerInGameMenuPeoplePageActionsModule (ref)
	if getDidSideSheetOpenWithPeoplePageModule() then
		registerInGameMenuPeoplePageActionsModule.closePeoplePage()
	end
end