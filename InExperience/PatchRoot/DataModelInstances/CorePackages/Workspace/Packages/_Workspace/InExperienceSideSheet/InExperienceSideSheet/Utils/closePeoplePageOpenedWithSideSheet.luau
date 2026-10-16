local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetDidSideSheetOpenWithPeoplePageModule = require(InExperienceSideSheet.Utils.getDidSideSheetOpenWithPeoplePage)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)

return function() --[[ Line: 8 ]]
	-- upvalues: GetDidSideSheetOpenWithPeoplePageModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy)
	if GetDidSideSheetOpenWithPeoplePageModule() then
		RegisterInGameMenuPeoplePageActionsModule.closePeoplePage()
	end
end