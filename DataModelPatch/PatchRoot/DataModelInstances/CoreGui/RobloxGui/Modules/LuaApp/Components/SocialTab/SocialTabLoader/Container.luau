local SocialTabLoaderModule = require(script.Parent.SocialTabLoader)
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)

return require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(require(CorePackages.Packages.RoactRodux).connect(require(script.Parent.mapStateToProps), (require(script.Parent.mapDispatchToProps))), require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy.connect(function(p1, _)
	return { showUserAlias = p1.getShowAlias() }
end))(function(p1)
	-- upvalues: RoactModule (copy), SocialTabLoaderModule (copy)
	return RoactModule.createElement(SocialTabLoaderModule, p1)
end)