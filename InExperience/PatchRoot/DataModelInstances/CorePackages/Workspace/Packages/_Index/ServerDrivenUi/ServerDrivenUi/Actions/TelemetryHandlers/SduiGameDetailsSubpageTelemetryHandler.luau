local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local gameDetailsSubpage = discoveryAnalyticsModule.Events.gameDetailsSubpage
local fFlagLuaAppAddUniverseIdToGameDetailsEvents = require(parent.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents

return function(p0, p1, p2)
	-- upvalues: getActionTelemetryFieldValue (ref), sduiErrorType (ref), fFlagLuaAppAddUniverseIdToGameDetailsEvents (ref), gameDetailsSubpage (ref), playersService (ref)
	local var3 = getActionTelemetryFieldValue(p0, p1, "subpage")
	local var4 = getActionTelemetryFieldValue(p0, p1, "universeId")
	local var5 = getActionTelemetryFieldValue(p0, p1, "placeId")
	local var6 = getActionTelemetryFieldValue(p0, p1, "eventContext") or "GameInfoRow"
	local var7 = getActionTelemetryFieldValue(p0, p1, "ctx") or var6
	local var8 = getActionTelemetryFieldValue(p0, p1, "action")
	
	if typeof(var3) ~= "string" or var3 == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			message = "Missing or non-string `subpage` (server must set this on analyticsData or actionParams)",
			propName = "subpage"
		}, p2.appPage)
		
		return
	end
	local var9 = typeof(var5)
	
	if var9 ~= "string" and var9 ~= "number" or var5 == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiGameDetailsSubpageTelemetryHandler",
			propName = "placeId",
			message = `Invalid placeId (expected string or number, got {var9})`
		}, p2.appPage)
		
		return
	elseif fFlagLuaAppAddUniverseIdToGameDetailsEvents then
		local var10 = typeof(var4)
		
		if (var10 == "string" or var10 == "number") and var4 ~= "" then
			gameDetailsSubpage({
				uid = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else ""),
				placeId = tostring(var5),
				subpage = var3,
				universeId = if fFlagLuaAppAddUniverseIdToGameDetailsEvents then tostring(var4) else "",
				action = var8,
				ctx = var7
			}, var6)
			
			return
		else
			p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				name = "SduiGameDetailsSubpageTelemetryHandler",
				propName = "universeId",
				message = `Invalid universeId (expected string or number, got {var10})`
			}, p2.appPage)
		end
	end
end