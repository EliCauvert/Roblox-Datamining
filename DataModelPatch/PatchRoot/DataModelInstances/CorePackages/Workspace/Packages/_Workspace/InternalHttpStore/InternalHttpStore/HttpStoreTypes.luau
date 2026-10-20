local Parent = script.Parent.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.HttpSignals)

return {
	HttpResponseStatus = table.freeze({
		NotStarted = "NotStarted",
		Fetching = "Fetching",
		Success = "Success",
		Failed = "Failed"
	})
}