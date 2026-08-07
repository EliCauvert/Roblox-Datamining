local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local dashModule = require(parent.Dash)
local default = require(parent.LoggingProtocol).default
local analyticsServiceModule = require(script.Parent.AnalyticsService)
local isSpatial = require(parent.AppCommonLib).isSpatial

local function getAXStatMetadata(p0) --[[ line: 16 ]]
	-- upvalues: userInputService (ref), isSpatial (ref), runService (ref), httpService (ref), dashModule (ref)
	local t = {
		AppVersion = runService:GetRobloxVersion(),
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion(),
		Platform = if isSpatial() then "VR" else userInputService:GetPlatform()
	}
	
	if p0 and next(p0) ~= nil then
		t = dashModule.assign({}, t, p0)
	end
	return t
end

return function(p1) --[[ line: 46 | named "sendAXStat" ]]
	-- upvalues: getAXStatMetadata (ref), default (ref), analyticsServiceModule (ref)
	if not p1.excludeStat then
		default:logRobloxTelemetryStat({
			description = "Stat to track Avatar Experience latency.",
			links = "",
			eventName = p1.statName,
			backends = { "RobloxTelemetryStat" },
			lastUpdated = { 2024, 11, 19 }
		}, p1.deltaMs, getAXStatMetadata(p1.metaData))
	end
	if not p1.excludeTelemetry then
		local t = { deltaMs = p1.deltaMs, metricName = p1.statName }
		
		if p1.metaData then
			t.coldStart = p1.metaData.ColdStart
			t.category = p1.metaData.Category
			t.subcategory = p1.metaData.Subcategory
			t.page = p1.metaData.Page
			t.opaquePage = p1.metaData.OpaquePage
		end
		local var8 = getAXStatMetadata()
		t.appVersion = var8.AppVersion
		t.userAgent = var8.UserAgent
		t.coreScriptVersion = var8.CoreScriptVersion
		t.platform = var8.Platform
		analyticsServiceModule.EventStream:sendEventDeferred(p1.statName, if p1.customEventStreamSchemaName then p1.customEventStreamSchemaName else "marketplacePerformanceMetric", t)
	end
end