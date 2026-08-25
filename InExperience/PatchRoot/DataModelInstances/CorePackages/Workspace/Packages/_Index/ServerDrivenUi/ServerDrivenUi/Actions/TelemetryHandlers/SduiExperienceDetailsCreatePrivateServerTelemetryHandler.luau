local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameCreatePrivateGame = require(parent.DiscoveryAnalytics).Events.gameCreatePrivateGame
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, p1, p2)
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), playersService (ref), gameCreatePrivateGame (ref)
	local var2 = getActionTelemetryFieldValue(p0, p1, "placeId")
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "ExperienceDetailsCreatePrivateServer telemetry missing placeId"
		}, p2.appPage)
		
		return
	end
	local var3 = getActionTelemetryFieldValue(p0, p1, "ctx") or "ExperienceDetailsOverflow"
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return
	end
	gameCreatePrivateGame({
		ctx = var3,
		uid = tostring(localPlayer.UserId),
		placeId = tostring(var2)
	}, var3)
end