local LoggingProtocolModule = require(script:FindFirstAncestor("AppLaunchTracker").Parent.LoggingProtocol)
local _ = require(script.Parent.AppLaunchTrackerTypes)
local DiscoveryAppLaunchMilestonesHundredthsPercent = game:DefineFastInt("DiscoveryAppLaunchMilestonesHundredthsPercent", 0)
local config = {
	eventName = "DiscoveryAppLaunch_Milestones",
	description = "App launch rodux actions",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = DiscoveryAppLaunchMilestonesHundredthsPercent,
	lastUpdated = { 24, 11, 4 }
}
local config1 = {
	eventName = "DiscoveryAppLaunch_Error",
	description = "Error related to discovery app launch metric tracking",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	throttlingPercentage = game:DefineFastInt("DiscoveryAppLaunchErrorHundredthsPercent", 0),
	lastUpdated = { 24, 11, 4 }
}

return {
	reportStatsforMilestone = function(p1, Milestone, p2, DurationMs, List, NumTilesInit, NumTileRenders, NumFeedItems, NumFeedRenders, TotalSduiDurationMs) --[[ Line: 37 ]]
		-- upvalues: DiscoveryAppLaunchMilestonesHundredthsPercent (copy), config (copy)
		assert(p1, "LoggingProtocol must exist")
		
		if DiscoveryAppLaunchMilestonesHundredthsPercent > 0 then
			local config1 = {
				milestone = Milestone,
				milestoneSpan = `{p2}-{Milestone}`,
				durationMs = DurationMs,
				numTilesInit = NumTilesInit,
				numTileRenders = NumTileRenders,
				numFeedItems = NumFeedItems,
				numFeedRenders = NumFeedRenders,
				totalSduiDurationMs = TotalSduiDurationMs
			}
			
			for i, value in List do
				config1[i] = value
			end
			p1:logRobloxTelemetryEvent(config, { p1.StandardizedFields.addOsInfo }, config1)
		end
	end,
	reportError = function(p3, ErrorTag) --[[ Line: 72 ]]
		-- upvalues: config1 (copy)
		p3:logRobloxTelemetryCounter(config1, 1, { errorTag = ErrorTag })
	end
}