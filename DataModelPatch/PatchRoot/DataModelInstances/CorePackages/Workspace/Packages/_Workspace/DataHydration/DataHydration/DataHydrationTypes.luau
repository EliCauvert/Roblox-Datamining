local _ = require(script:FindFirstAncestor("DataHydration").Parent.Signals)

return {
	DataStatus = {
		NotReady = "NotReady",
		Ready = "Ready",
		Failed = "Failed"
	}
}