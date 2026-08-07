local parent = script.Parent.Parent.Parent

return require(parent.React).createContext({
	chromeEnabled = nil,
	fireAnalyticsEvent = require(parent.Dash).noop
})