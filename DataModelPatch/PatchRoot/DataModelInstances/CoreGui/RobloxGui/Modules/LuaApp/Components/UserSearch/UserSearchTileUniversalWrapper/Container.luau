local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UserSearchTileUniversalWrapperModule = require(script.Parent.UserSearchTileUniversalWrapper)

return require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	networking = require(script:FindFirstAncestor("Modules").LuaApp.Services.RoactNetworking)
}))(function(p1)
	-- upvalues: RoactModule (copy), UserSearchTileUniversalWrapperModule (copy)
	return RoactModule.createElement(UserSearchTileUniversalWrapperModule, p1)
end)