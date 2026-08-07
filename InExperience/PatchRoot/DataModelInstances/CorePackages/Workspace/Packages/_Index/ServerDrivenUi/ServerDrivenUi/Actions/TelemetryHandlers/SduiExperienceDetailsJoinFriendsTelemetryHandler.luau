local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local gameJoinFriendsInGame = require(parent.DiscoveryAnalytics).Events.gameJoinFriendsInGame
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, p1, p2) --[[ line: 19 | named "SduiExperienceDetailsJoinFriendsTelemetryHandler" ]]
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), playersService (ref), gameJoinFriendsInGame (ref)
	local var2 = getActionTelemetryFieldValue(p0, p1, "placeId")
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "ExperienceDetailsJoinFriends telemetry missing placeId"
		}, p2.appPage)
		
		return
	end
	local var3 = getActionTelemetryFieldValue(p0, p1, "ctx") or "ExperienceDetailsOverflow"
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer == nil then
		return
	end
	gameJoinFriendsInGame({
		ctx = var3,
		uid = tostring(localPlayer.UserId),
		placeId = tostring(var2)
	}, var3)
end