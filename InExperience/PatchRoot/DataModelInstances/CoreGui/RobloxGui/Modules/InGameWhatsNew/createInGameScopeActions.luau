local CorePackages = game:GetService("CorePackages")
local WhatsNewModule = require(CorePackages.Workspace.Packages.WhatsNew)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)

return function() --[[ Line: 17 | Named "createInGameScopeActions" ]]
	-- upvalues: InExperienceSideSheetModule (copy), WhatsNewModule (copy)
	local ToggleSideSheetFunction = InExperienceSideSheetModule.toggleSideSheet
	local ScopeActions = WhatsNewModule.scopeActions.createScopeActions()
	ScopeActions:register("OpenTiltMenu", function() --[[ Line: 21 ]]
		-- upvalues: ToggleSideSheetFunction (copy)
		ToggleSideSheetFunction(true)
	end)
	ScopeActions:register("CloseTiltMenu", function() --[[ Line: 24 ]]
		-- upvalues: ToggleSideSheetFunction (copy)
		ToggleSideSheetFunction(false)
	end)
	ScopeActions:bindOpenState({
		openActionKey = "OpenTiltMenu",
		closeActionKey = "CloseTiltMenu",
		getIsOpen = InExperienceSideSheetModule.getSideSheetVisibility
	})
	
	return ScopeActions
end