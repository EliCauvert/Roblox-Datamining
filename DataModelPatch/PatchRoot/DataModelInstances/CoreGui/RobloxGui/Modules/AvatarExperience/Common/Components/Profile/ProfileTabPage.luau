local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ProfilePlatformNavigatorModule = require(CorePackages.Workspace.Packages.ProfilePlatform.ProfilePlatformNavigator)
local ProfileTabPageContainerModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.Profile.ProfileTabPageContainer)
local ProfileTabPage = ReactModule.PureComponent:extend("ProfileTabPage")

function ProfileTabPage.render(p1)
	-- upvalues: ReactModule (copy), ProfileTabPageContainerModule (copy)
	return ReactModule.createElement(ProfileTabPageContainerModule, p1.props)
end

ProfileTabPage.router = ProfilePlatformNavigatorModule.router

return ProfileTabPage