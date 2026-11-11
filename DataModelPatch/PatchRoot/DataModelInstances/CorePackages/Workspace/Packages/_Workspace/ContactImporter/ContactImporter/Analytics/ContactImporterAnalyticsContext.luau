local DependenciesModule = require(script:FindFirstAncestor("ContactImporter").dependencies)

return DependenciesModule.Roact.createContext({ fireAnalyticsEvent = DependenciesModule.Dash.noop })