local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local NavigateDownToAvatarScreenModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.NavigateDownToAvatarScreen)
local RedirectToAppRouterScreen = require(CorePackages.Packages.Roact).Component:extend("RedirectToAppRouterScreen")

function RedirectToAppRouterScreen.didMount(p1)
	local Navigation = p1.props.navigation
	p1.props.navigateDownToAvatarScreen(Navigation.state.routeName, Navigation.state.key, Navigation.state.params)
	Navigation.pop()
end

function RedirectToAppRouterScreen:render()
	return nil
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: NavigateDownToAvatarScreenModule (copy)
	return {
		navigateDownToAvatarScreen = function(p1, p2, p3)
			-- upvalues: Callback (copy), NavigateDownToAvatarScreenModule (upval)
			return Callback(NavigateDownToAvatarScreenModule(p1, p2, p3))
		end
	}
end)(RedirectToAppRouterScreen)