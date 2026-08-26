local immutableModule = require(script.Parent.Parent.Immutable)
local appendRecentDumpPathModule = require(script.Parent.Parent.Actions.AppendRecentDumpPath)
local setRCCProfilerStateModule = require(script.Parent.Parent.Actions.SetRCCProfilerState)

return function(p1, p2)
	-- upvalues: setRCCProfilerStateModule (ref), immutableModule (ref), appendRecentDumpPathModule (ref)
	p1 = p1 or {
		waitingForRecording = false,
		lastFileOutputLocation = "",
		recentDumpPaths = {}
	}
	
	return if p2.type == setRCCProfilerStateModule.name then immutableModule.JoinDictionaries(p1, {
		waitingForRecording = p2.waitingForRecording,
		lastFileOutputLocation = p2.lastFileOutputLocation,
		recentDumpPaths = p1.recentDumpPaths
	}) elseif p2.type == appendRecentDumpPathModule.name then immutableModule.JoinDictionaries(p1, {
		waitingForRecording = p1.waitingForRecording,
		lastFileOutputLocation = p1.lastFileOutputLocation,
		recentDumpPaths = immutableModule.Append(p1.recentDumpPaths, p2.dumpPath)
	}) else p1
end