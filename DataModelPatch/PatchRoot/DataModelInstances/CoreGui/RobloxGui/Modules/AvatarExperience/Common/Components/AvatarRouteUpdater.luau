local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local SetAvatarSceneRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetAvatarSceneRoute
local AvatarRouteUpdater = require(CorePackages.Packages.Roact).PureComponent:extend("AvatarRouteUpdater")
AvatarRouteUpdater.validateProps = TModule.strictInterface({
	avatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.Interface,
	setAvatarSceneRoute = TModule.callback
})

function AvatarRouteUpdater:render()
	return nil
end

function AvatarRouteUpdater.didMount(p1)
	p1.props.setAvatarSceneRoute(p1.props.avatarRoute)
end

function AvatarRouteUpdater.didUpdate(p1, p2)
	local AvatarRoute = p1.props.avatarRoute
	
	if AvatarRoute ~= p2.avatarRoute then
		p1.props.setAvatarSceneRoute(AvatarRoute)
	end
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: SetAvatarSceneRouteFunction (copy)
	return {
		setAvatarSceneRoute = function(p1)
			-- upvalues: Callback (copy), SetAvatarSceneRouteFunction (upval)
			Callback(SetAvatarSceneRouteFunction(p1))
		end
	}
end)(AvatarRouteUpdater))