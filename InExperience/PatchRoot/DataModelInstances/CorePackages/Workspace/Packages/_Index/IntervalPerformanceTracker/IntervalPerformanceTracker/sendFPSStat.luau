local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("IntervalPerformanceTracker").Parent
local var4 = require(parent.Analytics).Analytics.new(rbxAnalyticsService)
local dashModule = require(parent.Dash)
local default = require(parent.LoggingProtocol).default
local isSpatial = require(parent.AppCommonLib).isSpatial

local function getDefaultMetadata(p0)
	-- upvalues: userInputService (ref), isSpatial (ref), runService (ref), httpService (ref), dashModule (ref)
	return dashModule.assign({
		appVersion = runService:GetRobloxVersion(),
		userAgent = httpService:GetUserAgent(),
		coreScriptVersion = runService:GetCoreScriptVersion(),
		platform = if isSpatial() then "VR" else userInputService:GetPlatform()
	}, p0)
end

return function(p1)
	-- upvalues: getDefaultMetadata (ref), default (ref), var4 (ref)
	local var7 = p1.excludeEventStream ~= false
	local var8 = getDefaultMetadata(p1.metaData)
	
	if not p1.excludeStat then
		default:logRobloxTelemetryStat({
			description = "Stat to track FPS metrics.",
			links = "",
			eventName = p1.statName,
			backends = { "RobloxTelemetryStat" },
			lastUpdated = { 2025, 4, 28 }
		}, p1.interval, var8)
	end
	if not var7 and p1.eventStreamName then
		var4.EventStream:sendEventDeferred(p1.eventStreamName, "robloxFPSMetrics", var8)
	end
end