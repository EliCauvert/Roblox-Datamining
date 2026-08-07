local dependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)

return dependenciesModule.Roact.createContext({ fireEvent = dependenciesModule.Dash.noop })