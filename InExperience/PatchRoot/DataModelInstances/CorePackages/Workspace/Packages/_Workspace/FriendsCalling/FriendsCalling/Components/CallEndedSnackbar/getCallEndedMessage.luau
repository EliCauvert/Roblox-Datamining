local config = {
	LocalHangup = "You left the call",
	RemoteHangup = "Call ended",
	Missed = "Call missed",
	Declined = "Call declined",
	Failed = "Call failed",
	Canceled = "Call canceled",
	NoReason = "Call ended"
}

return function(p1)
	-- upvalues: config (copy)
	return config[p1.Name]
end