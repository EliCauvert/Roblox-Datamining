return require(script:FindFirstAncestor("CallProtocol").Parent.enumerate)(script.Name, {
	Idle = "Idle",
	Ringing = "Ringing",
	Accepting = "Accepting",
	Initializing = "Initializing",
	Connecting = "Connecting",
	Active = "Active"
})