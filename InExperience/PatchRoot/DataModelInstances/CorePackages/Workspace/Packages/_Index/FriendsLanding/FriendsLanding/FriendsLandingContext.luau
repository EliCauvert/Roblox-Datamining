local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Context = DependenciesModule.SocialLibraries.Context
local React = DependenciesModule.React
local ContextModule = require(script.Context)

return {
	Context = ContextModule,
	Provider = ContextModule.Provider,
	Consumer = ContextModule.Consumer,
	with = Context.getWith(ContextModule),
	connect = Context.getConnect(ContextModule),
	useContext = function() --[[ Line: 14 ]]
		-- upvalues: React (copy), ContextModule (copy)
		return (React.useContext(ContextModule))
	end
}