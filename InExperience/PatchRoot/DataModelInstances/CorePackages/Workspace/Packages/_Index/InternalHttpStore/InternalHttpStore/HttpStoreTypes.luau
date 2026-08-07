local parent = script.Parent.Parent
local _ = require(parent.Signals)
local _ = require(parent.HttpSignals)

return {
	HttpResponseStatus = table.freeze({
		NotStarted = "NotStarted",
		Fetching = "Fetching",
		Success = "Success",
		Failed = "Failed"
	})
}