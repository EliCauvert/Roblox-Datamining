local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local loggingProtocolModule = require(momentsCommon.Parent.LoggingProtocol)
local fFlagMomentsCreationMusicSearchCountTelemetryModule = require(momentsCommon.Flags.FFlagMomentsCreationMusicSearchCountTelemetry)
local t = {
	eventName = "MomentsCreationMusicSearchRawCount",
	links = "",
	description = "Music-search result count BEFORE the creation-flow ISRC/RecordingCode filter (post creator-filter). Aggregated to p50/p95/p99; compare against MomentsCreationMusicSearchFilteredCount to see the filter drop. Dimensioned by queryPresent.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 8, 27 }
}
local t_1 = {
	eventName = "MomentsCreationMusicSearchFilteredCount",
	links = "",
	description = "Music-search result count AFTER the creation-flow ISRC/RecordingCode filter (tracks shown to the user). Aggregated to p50/p95/p99; compare against MomentsCreationMusicSearchRawCount to see the filter drop. Dimensioned by queryPresent.",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 8, 27 }
}

local function defaultEmit(p1, p2, p3)
	-- upvalues: loggingProtocolModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryStat(p1, p2, p3)
end

return function(p1, p2, p3, p4)
	-- upvalues: fFlagMomentsCreationMusicSearchCountTelemetryModule (ref), defaultEmit (ref), t (ref), t_1 (ref)
	if fFlagMomentsCreationMusicSearchCountTelemetryModule then
		local t_2 = { queryPresent = tostring(p3.queryPresent) }
		p4 = p4 or defaultEmit
		pcall(p4, t, p1, t_2)
		pcall(p4, t_1, p2, t_2)
		
		return
	end
end