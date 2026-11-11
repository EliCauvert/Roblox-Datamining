local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation)

local function _(p1, p2): boolean
	return p1.state.key == p2.key
end

local _ = function(p1, List): boolean
	for _, value in List do
		if p1.state.key == value.key then
			return true
		end
	end
	return false
end

return function(p2): boolean
	local AvatarRoute = p2.avatarRoute
	local Navigation = p2.navigation
	local IsKeyMatch = Navigation.state.key == AvatarRoute.current.key
	local Flag = false
	
	for _, previousPage in AvatarRoute.previousPages do
		if Navigation.state.key == previousPage.key then
			Flag = true
			break
		end
	end
	local IsKeyMatch1 = Navigation.state.key == AvatarRoute.opaque.key
	
	return IsKeyMatch or (Flag or IsKeyMatch1)
end