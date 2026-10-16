local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("IntervalPerformanceTracker").Parent
local NewResult = require(Parent.Analytics).Analytics.new((game:GetService("RbxAnalyticsService")))
local DashModule = require(Parent.Dash)
local Default = require(Parent.LoggingProtocol).default
local IsSpatialFunction = require(Parent.AppCommonLib).isSpatial

local function getDefaultMetadata(MetaData) --[[ Line: 17 ]]
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy), RunService (copy), HttpService (copy), DashModule (copy)
	return (DashModule.assign({
		appVersion = RunService:GetRobloxVersion(),
		userAgent = HttpService:GetUserAgent(),
		coreScriptVersion = RunService:GetCoreScriptVersion(),
		platform = if IsSpatialFunction() then "VR" else UserInputService:GetPlatform()
	}, MetaData))
end

return function(p1) --[[ Line: 42 | Named "sendFPSStat" ]]
	-- upvalues: getDefaultMetadata (copy), Default (copy), NewResult (copy)
	local IsExcludeEventStream = p1.excludeEventStream ~= false
	local DefaultMetadata = getDefaultMetadata(p1.metaData)
	
	if not p1.excludeStat then
		Default:logRobloxTelemetryStat({
			description = "Stat to track FPS metrics.",
			links = "",
			eventName = p1.statName,
			backends = { "RobloxTelemetryStat" },
			lastUpdated = { 2025, 4, 28 }
		}, p1.interval, DefaultMetadata)
	end
	if not IsExcludeEventStream and p1.eventStreamName then
		NewResult.EventStream:sendEventDeferred(p1.eventStreamName, "robloxFPSMetrics", DefaultMetadata)
	end
end