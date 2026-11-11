return require(script.Parent.Parent.dependencies).SocialLuaAnalytics.Analytics.FireEvent.createFireEvent({
	EventStream = require(script.Parent.EventStreamActionList),
	Diag = require(script.Parent.DiagActionList)
})