local DependenciesModule = require(script.Parent.Parent.dependencies)

return DependenciesModule.React.createContext({ fireAnalyticsEvent = DependenciesModule.Dash.noop })