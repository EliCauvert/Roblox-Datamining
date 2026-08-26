local loggingProtocolModule = require(script:FindFirstAncestor("AppLaunchTracker").Parent.LoggingProtocol)
local _ = require(script.Parent.AppLaunchTrackerTypes)
local discoveryAppLaunchMilestonesHundredthsPercent = game:DefineFastInt("DiscoveryAppLaunchMilestonesHundredthsPercent", 0)
local t = {
	eventName = "DiscoveryAppLaunch_Milestones",
	description = "App launch rodux actions",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = discoveryAppLaunchMilestonesHundredthsPercent,
	lastUpdated = { 24, 11, 4 }
}
local t_1 = {
	eventName = "DiscoveryAppLaunch_Error",
	description = "Error related to discovery app launch metric tracking",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("DiscoveryAppLaunchErrorHundredthsPercent", 0),
	lastUpdated = { 24, 11, 4 }
}

return {
	reportStatsforMilestone = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: discoveryAppLaunchMilestonesHundredthsPercent (ref), t (ref)
		assert(p1, "LoggingProtocol must exist")
		
		if discoveryAppLaunchMilestonesHundredthsPercent > 0 then
			local t_1 = {
				milestone = p2,
				milestoneSpan = `{p3}-{p2}`,
				durationMs = p4,
				numTilesInit = p6,
				numTileRenders = p7,
				numFeedItems = p8,
				numFeedRenders = p9,
				totalSduiDurationMs = p10
			}
			
			for i, v in p5 do
				t_1[i] = v
			end
			p1:logRobloxTelemetryEvent(t, { p1.StandardizedFields.addOsInfo }, t_1)
		end
	end,
	reportError = function(p11, p12)
		-- upvalues: t_1 (ref)
		p11:logRobloxTelemetryCounter(t_1, 1, { errorTag = p12 })
	end
}