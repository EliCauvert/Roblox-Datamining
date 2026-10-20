local DependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)

return DependenciesModule.Roact.createContext({ fireEvent = DependenciesModule.Dash.noop })