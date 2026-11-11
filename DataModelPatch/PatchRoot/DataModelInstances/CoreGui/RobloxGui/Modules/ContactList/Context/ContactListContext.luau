local CorePackages = game:GetService("CorePackages")

return require(CorePackages.Packages.React).createContext({
	fireAnalyticsEvent = require(CorePackages.Packages.Dash).noop
})