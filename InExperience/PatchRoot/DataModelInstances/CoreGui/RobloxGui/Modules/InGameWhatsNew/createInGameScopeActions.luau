local corePackagesService = game:GetService("CorePackages")
local whatsNewModule = require(corePackagesService.Workspace.Packages.WhatsNew)
local inExperienceSideSheetModule = require(corePackagesService.Workspace.Packages.InExperienceSideSheet)

return function()
	-- upvalues: inExperienceSideSheetModule (ref), whatsNewModule (ref)
	local toggleSideSheet = inExperienceSideSheetModule.toggleSideSheet
	local var1 = whatsNewModule.scopeActions.createScopeActions()
	var1:register("OpenTiltMenu", function()
		-- upvalues: toggleSideSheet (ref)
		toggleSideSheet(true)
	end)
	var1:register("CloseTiltMenu", function()
		-- upvalues: toggleSideSheet (ref)
		toggleSideSheet(false)
	end)
	var1:bindOpenState({
		openActionKey = "OpenTiltMenu",
		closeActionKey = "CloseTiltMenu",
		getIsOpen = inExperienceSideSheetModule.getSideSheetVisibility
	})
	
	return var1
end