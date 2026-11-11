local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GameCreatePrivateGameFunction = require(Parent.DiscoveryAnalytics).Events.gameCreatePrivateGame
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, p2, p3)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), Players (copy), GameCreatePrivateGameFunction (copy)
	local PlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
	
	if PlaceId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "ExperienceDetailsCreatePrivateServer telemetry missing placeId"
		}, p3.appPage)
		
		return
	end
	local Ctx = GetActionTelemetryFieldValueFunction(p1, p2, "ctx") or "ExperienceDetailsOverflow"
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer ~= nil then
		GameCreatePrivateGameFunction({
			ctx = Ctx,
			uid = tostring(LocalPlayer.UserId),
			placeId = tostring(PlaceId)
		}, Ctx)
		
		return
	end
end