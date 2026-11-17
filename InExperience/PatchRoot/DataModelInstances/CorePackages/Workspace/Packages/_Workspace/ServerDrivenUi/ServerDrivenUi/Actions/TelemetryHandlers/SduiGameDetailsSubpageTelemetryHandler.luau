local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local GameDetailsSubpageFunction = DiscoveryAnalyticsModule.Events.gameDetailsSubpage

return function(p1, p2, p3)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), SduiErrorType (copy), GameDetailsSubpageFunction (copy), Players (copy)
	local Subpage = GetActionTelemetryFieldValueFunction(p1, p2, "subpage")
	local UniverseId = GetActionTelemetryFieldValueFunction(p1, p2, "universeId")
	local PlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
	local EventContext = GetActionTelemetryFieldValueFunction(p1, p2, "eventContext") or "GameInfoRow"
	local Ctx = GetActionTelemetryFieldValueFunction(p1, p2, "ctx") or EventContext
	local Action = GetActionTelemetryFieldValueFunction(p1, p2, "action")
	
	if typeof(Subpage) ~= "string" or Subpage == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			message = "Missing or non-string `subpage` (server must set this on analyticsData or actionParams)",
			propName = "subpage"
		}, p3.appPage)
		
		return
	end
	local ValueType = typeof(PlaceId)
	
	if ValueType ~= "string" and ValueType ~= "number" or PlaceId == "" then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {ValueType})`
		}, p3.appPage)
		
		return
	end
	local ValueType1 = typeof(UniverseId)
	
	if (ValueType1 == "string" or ValueType1 == "number") and UniverseId ~= "" then
		GameDetailsSubpageFunction({
			uid = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else ""),
			placeId = tostring(PlaceId),
			subpage = Subpage,
			universeId = tostring(UniverseId),
			action = Action,
			ctx = Ctx
		}, EventContext)
		
		return
	else
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			propName = "universeId",
			message = `Invalid universeId (expected string or number, got {ValueType1})`
		}, p3.appPage)
	end
end