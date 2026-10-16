local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AnalyticsReporters = script.Parent.AnalyticsReporters
local DiagModule = require(AnalyticsReporters.Diag)
local EventStreamModule = require(AnalyticsReporters.EventStream)
local GoogleAnalyticsModule = require(AnalyticsReporters.GoogleAnalytics)
local InfluxModule = require(AnalyticsReporters.Influx)
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule

function AnalyticsModule.new(RbxAnalyticsService1) --[[ Line: 35 ]]
	-- upvalues: RbxAnalyticsService (copy), DiagModule (copy), EventStreamModule (copy), GoogleAnalyticsModule (copy), InfluxModule (copy), AnalyticsModule (copy)
	if not RbxAnalyticsService1 then
		RbxAnalyticsService1 = RbxAnalyticsService
	end
	local config = {
		Diag = DiagModule.new(RbxAnalyticsService1),
		EventStream = EventStreamModule.new(RbxAnalyticsService1),
		GoogleAnalytics = GoogleAnalyticsModule.new(RbxAnalyticsService1),
		InfluxDb = InfluxModule.new(RbxAnalyticsService1)
	}
	setmetatable(config, AnalyticsModule)
	
	return config
end

function AnalyticsModule.mock() --[[ Line: 63 ]]
	-- upvalues: AnalyticsModule (copy)
	return AnalyticsModule.new({
		ReportCounter = function() --[[ Line: 66 ]] end,
		ReportInfluxSeries = function() --[[ Line: 67 ]] end,
		ReportStats = function() --[[ Line: 68 ]] end,
		SetRBXEvent = function() --[[ Line: 69 ]] end,
		SetRBXEventStream = function() --[[ Line: 70 ]] end,
		TrackEvent = function() --[[ Line: 71 ]] end,
		UpdateHeartbeatObject = function() --[[ Line: 72 ]] end,
		SendEventDeferred = function() --[[ Line: 73 ]] end
	})
end

return AnalyticsModule