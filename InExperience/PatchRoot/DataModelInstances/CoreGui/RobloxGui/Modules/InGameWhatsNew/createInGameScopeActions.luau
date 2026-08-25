local corePackagesService = game:GetService("CorePackages")
local whatsNewModule = require(corePackagesService.Workspace.Packages.WhatsNew)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)

return function()
	-- upvalues: inExperienceSideSheetModule (ref), whatsNewModule (ref)
	local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
	local var3 = whatsNewModule.scopeActions.createScopeActions()
	var3:register("OpenTiltMenu", function()
		-- upvalues: toggleSideSheet (ref)
		toggleSideSheet(true)
	end)
	var3:register("CloseTiltMenu", function()
		-- upvalues: toggleSideSheet (ref)
		toggleSideSheet(false)
	end)
	var3:bindOpenState({
		openActionKey = "OpenTiltMenu",
		closeActionKey = "CloseTiltMenu",
		getIsOpen = inExperienceSideSheetModule.getSideSheetVisibility
	})
	
	return var3
end