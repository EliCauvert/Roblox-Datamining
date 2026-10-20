local ContextModule = require(script.Context)
local Context = require(script:FindFirstAncestor("SocialTab").dependencies).SocialLibraries.Context

return {
	Context = ContextModule,
	Provider = ContextModule.Provider,
	Consumer = ContextModule.Consumer,
	with = Context.getWith(ContextModule),
	connect = Context.getConnect(ContextModule)
}