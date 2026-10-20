local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)

return function()
	-- upvalues: GetDidSideSheetOpenWithPeoplePageModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy)
	if GetDidSideSheetOpenWithPeoplePageModule() then
		RegisterInGameMenuPeoplePageActionsModule.closePeoplePage()
	end
end