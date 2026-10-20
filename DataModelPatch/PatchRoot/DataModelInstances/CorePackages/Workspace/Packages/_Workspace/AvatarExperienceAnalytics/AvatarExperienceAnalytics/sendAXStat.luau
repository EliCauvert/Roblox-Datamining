local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local DashModule = require(Parent.Dash)
local Default = require(Parent.LoggingProtocol).default
local AnalyticsServiceModule = require(script.Parent.AnalyticsService)
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial

local function getAXStatMetadata(MetaData)
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	local AssignResult = {
		AppVersion = RunService:GetRobloxVersion(),
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion(),
		Platform = if IsSpatialFunction() then "VR" else UserInputService:GetPlatform()
	}
	
	if MetaData and next(MetaData) ~= nil then
		AssignResult = DashModule.assign({}, AssignResult, MetaData)
	end
	return AssignResult
end

return function(p1)
	-- upvalues: getAXStatMetadata (copy), Default (copy), AnalyticsServiceModule (copy)
	if not p1.excludeStat then
		Default:logRobloxTelemetryStat({
			description = "Stat to track Avatar Experience latency.",
			links = "",
			eventName = p1.statName,
			backends = { "RobloxTelemetryStat" },
			lastUpdated = { 2024, 11, 19 }
		}, p1.deltaMs, (getAXStatMetadata(p1.metaData)))
	end
	if not p1.excludeTelemetry then
		local config = { deltaMs = p1.deltaMs, metricName = p1.statName }
		
		if p1.metaData then
			config.coldStart = p1.metaData.ColdStart
			config.category = p1.metaData.Category
			config.subcategory = p1.metaData.Subcategory
			config.page = p1.metaData.Page
			config.opaquePage = p1.metaData.OpaquePage
		end
		local AXStatMetadata = getAXStatMetadata()
		config.appVersion = AXStatMetadata.AppVersion
		config.userAgent = AXStatMetadata.UserAgent
		config.coreScriptVersion = AXStatMetadata.CoreScriptVersion
		config.platform = AXStatMetadata.Platform
		AnalyticsServiceModule.EventStream:sendEventDeferred(p1.statName, if p1.customEventStreamSchemaName then p1.customEventStreamSchemaName else "marketplacePerformanceMetric", config)
	end
end