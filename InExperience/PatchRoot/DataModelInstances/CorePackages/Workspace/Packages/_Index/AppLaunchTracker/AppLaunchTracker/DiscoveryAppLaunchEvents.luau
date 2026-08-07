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
	reportStatsforMilestone = function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 37 ]]
		-- upvalues: discoveryAppLaunchMilestonesHundredthsPercent (ref), t (ref)
		assert(p0, "LoggingProtocol must exist")
		
		if discoveryAppLaunchMilestonesHundredthsPercent > 0 then
			local t_1 = {
				milestone = p1,
				milestoneSpan = `{p2}-{p1}`,
				durationMs = p3,
				numTilesInit = p5,
				numTileRenders = p6,
				numFeedItems = p7,
				numFeedRenders = p8,
				totalSduiDurationMs = p9
			}
			
			for i, v in p4 do
				t_1[i] = v
			end
			p0:logRobloxTelemetryEvent(t, { p0.StandardizedFields.addOsInfo }, t_1)
		end
	end,
	reportError = function(p10, p11) --[[ line: 72 ]]
		-- upvalues: t_1 (ref)
		p10:logRobloxTelemetryCounter(t_1, 1, { errorTag = p11 })
	end
}