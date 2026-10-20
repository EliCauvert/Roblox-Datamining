local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local AnalyticsReporters = script.Parent.AnalyticsReporters
local DiagModule = require(AnalyticsReporters.Diag)
local EventStreamModule = require(AnalyticsReporters.EventStream)
local GoogleAnalyticsModule = require(AnalyticsReporters.GoogleAnalytics)
local InfluxModule = require(AnalyticsReporters.Influx)
local AnalyticsModule = {}
AnalyticsModule.__index = AnalyticsModule

function AnalyticsModule.new(RbxAnalyticsService1)
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

function AnalyticsModule.mock()
	-- upvalues: AnalyticsModule (copy)
	return AnalyticsModule.new({
		ReportCounter = function() end,
		ReportInfluxSeries = function() end,
		ReportStats = function() end,
		SetRBXEvent = function() end,
		SetRBXEventStream = function() end,
		TrackEvent = function() end,
		UpdateHeartbeatObject = function() end,
		SendEventDeferred = function() end
	})
end

return AnalyticsModule