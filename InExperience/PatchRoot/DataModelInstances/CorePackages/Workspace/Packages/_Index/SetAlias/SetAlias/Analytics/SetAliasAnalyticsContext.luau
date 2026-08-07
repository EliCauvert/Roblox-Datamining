local dependenciesModule = require(script.Parent.Parent.dependencies)

return dependenciesModule.React.createContext({ fireAnalyticsEvent = dependenciesModule.Dash.noop })