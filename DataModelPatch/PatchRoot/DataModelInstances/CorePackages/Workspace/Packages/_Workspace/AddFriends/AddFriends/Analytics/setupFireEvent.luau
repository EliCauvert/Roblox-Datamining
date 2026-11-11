return (require(script:FindFirstAncestor("AddFriends").Parent.SocialLuaAnalytics).Analytics.FireEvent.createFireEvent({
	EventStream = require(script.Parent.EventStreamActionList),
	Telemetry = require(script.Parent.TelemetryActionList)
}))