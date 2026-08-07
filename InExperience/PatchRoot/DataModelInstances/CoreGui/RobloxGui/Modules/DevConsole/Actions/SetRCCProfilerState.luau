return require(script.Parent.Parent.Action)(script.Name, function(p0, p1) --[[ line: 4 ]]
	return {
		waitingForRecording = p0,
		lastFileOutputLocation = p1 or ""
	}
end)