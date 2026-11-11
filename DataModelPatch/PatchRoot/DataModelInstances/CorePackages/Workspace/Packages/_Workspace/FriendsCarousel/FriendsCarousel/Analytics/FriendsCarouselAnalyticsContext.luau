local DependenciesModule = require(script:FindFirstAncestor("FriendsCarousel").dependencies)

return DependenciesModule.Roact.createContext({ fireEvent = DependenciesModule.Dash.noop })