local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameCreatePrivateGame = require(parent.DiscoveryAnalytics).Events.gameCreatePrivateGame
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), playersService (ref), gameCreatePrivateGame (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "placeId")
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "ExperienceDetailsCreatePrivateServer telemetry missing placeId"
		}, p3.appPage)
		
		return
	end
	local var2 = getActionTelemetryFieldValue(p1, p2, "ctx") or "ExperienceDetailsOverflow"
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return
	end
	gameCreatePrivateGame({
		ctx = var2,
		uid = tostring(localPlayer.UserId),
		placeId = tostring(var1)
	}, var2)
end