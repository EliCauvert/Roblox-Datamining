local immutableModule = require(script.Parent.Parent.Immutable)
local appendRecentDumpPathModule = require(script.Parent.Parent.Actions.AppendRecentDumpPath)
local setRCCProfilerStateModule = require(script.Parent.Parent.Actions.SetRCCProfilerState)

return function(p0, p1) --[[ line: 12 ]]
	-- upvalues: setRCCProfilerStateModule (ref), immutableModule (ref), appendRecentDumpPathModule (ref)
	p0 = p0 or {
		waitingForRecording = false,
		lastFileOutputLocation = "",
		recentDumpPaths = {}
	}
	
	return if p1.type == setRCCProfilerStateModule.name then immutableModule.JoinDictionaries(p0, {
		waitingForRecording = p1.waitingForRecording,
		lastFileOutputLocation = p1.lastFileOutputLocation,
		recentDumpPaths = p0.recentDumpPaths
	}) elseif p1.type == appendRecentDumpPathModule.name then immutableModule.JoinDictionaries(p0, {
		waitingForRecording = p0.waitingForRecording,
		lastFileOutputLocation = p0.lastFileOutputLocation,
		recentDumpPaths = immutableModule.Append(p0.recentDumpPaths, p1.dumpPath)
	}) else p0
end