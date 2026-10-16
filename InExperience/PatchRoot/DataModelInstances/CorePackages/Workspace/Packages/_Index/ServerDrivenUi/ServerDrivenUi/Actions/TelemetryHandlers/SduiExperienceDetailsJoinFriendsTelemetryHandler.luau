local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local GameJoinFriendsInGameFunction = require(Parent.DiscoveryAnalytics).Events.gameJoinFriendsInGame
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, p2, p3) --[[ Line: 19 | Named "SduiExperienceDetailsJoinFriendsTelemetryHandler" ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), Players (copy), GameJoinFriendsInGameFunction (copy)
	local PlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
	
	if PlaceId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "ExperienceDetailsJoinFriends telemetry missing placeId"
		}, p3.appPage)
		
		return
	end
	local Ctx = GetActionTelemetryFieldValueFunction(p1, p2, "ctx") or "ExperienceDetailsOverflow"
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer ~= nil then
		GameJoinFriendsInGameFunction({
			ctx = Ctx,
			uid = tostring(LocalPlayer.UserId),
			placeId = tostring(PlaceId)
		}, Ctx)
		
		return
	end
end