local AccountSettingsEntryPointsModule = require(game:GetService("CorePackages").Workspace.Packages.AccountSettingsEntryPoints)

return function(Callback: (any, any, any) -> (), p1)
	-- upvalues: AccountSettingsEntryPointsModule (copy)
	(p1 and p1.openAccountSettings or AccountSettingsEntryPointsModule.openAccountSettings)(AccountSettingsEntryPointsModule.Page.AccountDataDeactivationAndDeletion, { surfaceKey = "InExperienceSettings" })
	
	if Callback then
		Callback("account_management", "", "pressed")
	end
end