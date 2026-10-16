local DependenciesModule = require(script.Parent.Parent.dependencies)

return DependenciesModule.Roact.createContext({ fireAnalyticsEvent = DependenciesModule.Dash.noop })