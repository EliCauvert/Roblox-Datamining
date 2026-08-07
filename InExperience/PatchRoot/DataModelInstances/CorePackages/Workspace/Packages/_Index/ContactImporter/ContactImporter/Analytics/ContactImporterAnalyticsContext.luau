local dependenciesModule = require(script:FindFirstAncestor("ContactImporter").dependencies)

return dependenciesModule.Roact.createContext({ fireAnalyticsEvent = dependenciesModule.Dash.noop })