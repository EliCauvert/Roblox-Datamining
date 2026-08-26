local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local analyticsReporters = script.Parent.AnalyticsReporters
local diagModule = require(analyticsReporters.Diag)
local eventStreamModule = require(analyticsReporters.EventStream)
local googleAnalyticsModule = require(analyticsReporters.GoogleAnalytics)
local influxModule = require(analyticsReporters.Influx)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: rbxAnalyticsService (ref), diagModule (ref), eventStreamModule (ref), googleAnalyticsModule (ref), influxModule (ref), t (ref)
	if not p1 then
		p1 = rbxAnalyticsService
	end
	local t_1 = {
		Diag = diagModule.new(p1),
		EventStream = eventStreamModule.new(p1),
		GoogleAnalytics = googleAnalyticsModule.new(p1),
		InfluxDb = influxModule.new(p1)
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t.mock()
	-- upvalues: t (ref)
	return t.new({
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

return t