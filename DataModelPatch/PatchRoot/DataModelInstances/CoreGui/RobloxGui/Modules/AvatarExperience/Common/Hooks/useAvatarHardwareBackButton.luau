local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local AndroidBackButtonConnectionModule = require(Modules.LuaApp.Navigation.AndroidBackButtonConnection)
local IsAvatarRouteVisibleModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)

return function(p1)
	-- upvalues: ReactModule (copy), AndroidBackButtonConnectionModule (copy), IsAvatarRouteVisibleModule (copy)
	local Navigation = p1.navigation
	local AvatarRoute = p1.avatarRoute
	local OnBack = p1.onBack
	local IsEnabled = p1.enabled ~= false
	local Current = ReactModule.useRef(AndroidBackButtonConnectionModule()).current
	local IsAvatarRouteVisibleModule1 = IsEnabled and IsAvatarRouteVisibleModule({ navigation = Navigation, avatarRoute = AvatarRoute })
	ReactModule.useEffect(function()
		-- upvalues: IsAvatarRouteVisibleModule1 (copy), Current (copy), OnBack (copy)
		if IsAvatarRouteVisibleModule1 then
			Current.connect(OnBack)
		end
		return function()
			-- upvalues: Current (upval)
			Current.disconnect()
		end
	end, { IsAvatarRouteVisibleModule1, OnBack, Current })
end