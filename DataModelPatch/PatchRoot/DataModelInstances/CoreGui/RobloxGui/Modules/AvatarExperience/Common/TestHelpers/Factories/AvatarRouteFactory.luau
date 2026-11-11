local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation)
local AvatarRouteFactoryModule = {
	makeMockRouteInfo = function(Key)
		return { name = Key, key = Key, params = {} }
	end,
	makeMockRoute = function(Opaque, Current, PreviousPages)
		return {
			isVisible = true,
			isOverlayVisible = false,
			current = Current,
			previousPages = PreviousPages,
			opaque = Opaque
		}
	end
}

function AvatarRouteFactoryModule.makeMockRouteSimplified(Key)
	-- upvalues: AvatarRouteFactoryModule (copy)
	local MockRouteInfo = AvatarRouteFactoryModule.makeMockRouteInfo(Key)
	
	return {
		isVisible = true,
		isOverlayVisible = false,
		current = MockRouteInfo,
		previousPages = { MockRouteInfo },
		opaque = MockRouteInfo
	}
end

return AvatarRouteFactoryModule