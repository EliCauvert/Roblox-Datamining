local dependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)

return dependenciesModule.Roact.createContext({ fireEvent = dependenciesModule.Dash.noop })