local AccountSettingsEntryPoints = script:FindFirstAncestor("AccountSettingsEntryPoints")
local SduiCoreSystemModule = require(AccountSettingsEntryPoints.Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local OpenAccountSettingsModule = require(AccountSettingsEntryPoints.openAccountSettings)
local PersonalizedRecommendations = require(AccountSettingsEntryPoints.AccountSettingsPage).PersonalizedRecommendations

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), OpenAccountSettingsModule (copy), PersonalizedRecommendations (copy)
	local ActionParams = p1 and p1.actionParams
	local SurfaceKey = ActionParams and ActionParams.surfaceKey
	
	if typeof(SurfaceKey) == "string" and not string.match(SurfaceKey, "^%s*$") then
		OpenAccountSettingsModule(PersonalizedRecommendations, { surfaceKey = SurfaceKey })
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = SduiActionType.OpenAccountSettings,
			message = `Missing or invalid surfaceKey {SurfaceKey}`
		}, p2.appPage)
	end
end