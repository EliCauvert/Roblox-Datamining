local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local NavigateIntoAvatarExperienceModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Thunks.NavigateIntoAvatarExperience)
local RedirectToAvatarScreen = require(CorePackages.Packages.Roact).Component:extend("RedirectToAvatarScreen")

function RedirectToAvatarScreen.didMount(p1)
	local Navigation = p1.props.navigation
	p1.props.navigateIntoAvatarExperience(Navigation.state.routeName, Navigation.state.params)
	Navigation.pop()
end

function RedirectToAvatarScreen:render()
	return nil
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: NavigateIntoAvatarExperienceModule (copy)
	return {
		navigateIntoAvatarExperience = function(p1, p2)
			-- upvalues: Callback (copy), NavigateIntoAvatarExperienceModule (upval)
			return Callback(NavigateIntoAvatarExperienceModule(p1, p2, true))
		end
	}
end)(RedirectToAvatarScreen)