local corePackagesService = game:GetService("CorePackages")

return require(corePackagesService.Packages.React).createContext({
	fireAnalyticsEvent = require(corePackagesService.Packages.Dash).noop
})