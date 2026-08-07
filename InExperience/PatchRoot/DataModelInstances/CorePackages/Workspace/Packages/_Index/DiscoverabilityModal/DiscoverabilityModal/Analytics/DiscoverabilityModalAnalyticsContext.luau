local dependenciesModule = require(script.Parent.Parent.dependencies)

return dependenciesModule.Roact.createContext({ fireAnalyticsEvent = dependenciesModule.Dash.noop })