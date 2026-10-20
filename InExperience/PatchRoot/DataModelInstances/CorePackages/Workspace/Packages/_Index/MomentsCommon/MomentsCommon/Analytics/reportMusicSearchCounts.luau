local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local LoggingProtocolModule = require(MomentsCommon.Parent.LoggingProtocol)
local FFlagMomentsCreationMusicSearchCountTelemetryModule = require(MomentsCommon.Flags.FFlagMomentsCreationMusicSearchCountTelemetry)
local config = {
	eventName = "MomentsCreationMusicSearchRawCount",
	links = "",
	description = "Music-search result count BEFORE the creation-flow ISRC/RecordingCode filter (post creator-filter). Aggregated to p50/p95/p99; compare against MomentsCreationMusicSearchFilteredCount to see the filter drop. Dimensioned by queryPresent.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 8, 27 }
}
local config1 = {
	eventName = "MomentsCreationMusicSearchFilteredCount",
	links = "",
	description = "Music-search result count AFTER the creation-flow ISRC/RecordingCode filter (tracks shown to the user). Aggregated to p50/p95/p99; compare against MomentsCreationMusicSearchRawCount to see the filter drop. Dimensioned by queryPresent.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 8, 27 }
}

local function defaultEmit(p1, p2, p3)
	-- upvalues: LoggingProtocolModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryStat(p1, p2, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: FFlagMomentsCreationMusicSearchCountTelemetryModule (copy), defaultEmit (copy), config (copy), config1 (copy)
	if FFlagMomentsCreationMusicSearchCountTelemetryModule then
		local config2 = { queryPresent = tostring(p3.queryPresent) }
		local P6 = p4 or defaultEmit
		pcall(P6, config, p1, config2)
		pcall(P6, config1, p2, config2)
		
		return
	end
end