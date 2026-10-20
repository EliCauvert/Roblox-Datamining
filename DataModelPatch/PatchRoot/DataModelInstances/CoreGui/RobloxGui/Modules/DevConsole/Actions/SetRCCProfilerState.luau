return require(script.Parent.Parent.Action)(script.Name, function(WaitingForRecording, p1)
	return {
		waitingForRecording = WaitingForRecording,
		lastFileOutputLocation = p1 or ""
	}
end)