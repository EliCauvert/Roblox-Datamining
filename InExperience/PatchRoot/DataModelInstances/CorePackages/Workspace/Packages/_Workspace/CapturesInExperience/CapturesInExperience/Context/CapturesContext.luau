local Parent = script.Parent.Parent.Parent

return require(Parent.React).createContext({
	chromeEnabled = nil,
	fireAnalyticsEvent = require(Parent.Dash).noop
})