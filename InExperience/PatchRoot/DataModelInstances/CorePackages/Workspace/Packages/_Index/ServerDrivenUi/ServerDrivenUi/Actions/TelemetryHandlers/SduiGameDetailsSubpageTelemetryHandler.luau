local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local gameDetailsSubpage = discoveryAnalyticsModule.Events.gameDetailsSubpage
local fFlagLuaAppAddUniverseIdToGameDetailsEvents = require(parent.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), fFlagLuaAppAddUniverseIdToGameDetailsEvents (ref), gameDetailsSubpage (ref), playersService (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "subpage")
	local var2 = getActionTelemetryFieldValue(p1, p2, "universeId")
	local var3 = getActionTelemetryFieldValue(p1, p2, "placeId")
	local var4 = getActionTelemetryFieldValue(p1, p2, "eventContext") or "GameInfoRow"
	local var5 = getActionTelemetryFieldValue(p1, p2, "ctx") or var4
	local var6 = getActionTelemetryFieldValue(p1, p2, "action")
	
	if typeof(var1) ~= "string" or var1 == "" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			message = "Missing or non-string `subpage` (server must set this on analyticsData or actionParams)",
			propName = "subpage"
		}, p3.appPage)
		
		return
	end
	local var7 = typeof(var3)
	
	if var7 ~= "string" and var7 ~= "number" or var3 == "" then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {var7})`
		}, p3.appPage)
		
		return
	elseif fFlagLuaAppAddUniverseIdToGameDetailsEvents then
		local var8 = typeof(var2)
		
		if (var8 == "string" or var8 == "number") and var2 ~= "" then
			gameDetailsSubpage({
				uid = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else ""),
				placeId = tostring(var3),
				subpage = var1,
				universeId = if fFlagLuaAppAddUniverseIdToGameDetailsEvents then tostring(var2) else "",
				action = var6,
				ctx = var5
			}, var4)
			
			return
		else
			p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				name = "SduiGameDetailsSubpageTelemetryHandler",
				propName = "universeId",
				message = `Invalid universeId (expected string or number, got {var8})`
			}, p3.appPage)
		end
	end
end