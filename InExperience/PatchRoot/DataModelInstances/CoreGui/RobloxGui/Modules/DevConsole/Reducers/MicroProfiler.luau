local ImmutableModule = require(script.Parent.Parent.Immutable)
local AppendRecentDumpPathModule = require(script.Parent.Parent.Actions.AppendRecentDumpPath)
local SetRCCProfilerStateModule = require(script.Parent.Parent.Actions.SetRCCProfilerState)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: SetRCCProfilerStateModule (copy), ImmutableModule (copy), AppendRecentDumpPathModule (copy)
	local P0 = p1 or {
		waitingForRecording = false,
		lastFileOutputLocation = "",
		recentDumpPaths = {}
	}
	
	return if p2.type == SetRCCProfilerStateModule.name then ImmutableModule.JoinDictionaries(P0, {
		waitingForRecording = p2.waitingForRecording,
		lastFileOutputLocation = p2.lastFileOutputLocation,
		recentDumpPaths = P0.recentDumpPaths
	}) elseif p2.type == AppendRecentDumpPathModule.name then ImmutableModule.JoinDictionaries(P0, {
		waitingForRecording = P0.waitingForRecording,
		lastFileOutputLocation = P0.lastFileOutputLocation,
		recentDumpPaths = ImmutableModule.Append(P0.recentDumpPaths, p2.dumpPath)
	}) else P0
end