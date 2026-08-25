local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local context = dependenciesModule.SocialLibraries.Context
local react = dependenciesModule.React
local contextModule = require(script.Context)

return {
	Context = contextModule,
	Provider = contextModule.Provider,
	Consumer = contextModule.Consumer,
	with = context.getWith(contextModule),
	connect = context.getConnect(contextModule),
	useContext = function()
		-- upvalues: react (ref), contextModule (ref)
		return react.useContext(contextModule)
	end
}