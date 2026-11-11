local CorePackages = game:GetService("CorePackages")
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView

return function(OnOverlayClosed, p1)
	-- upvalues: FullView (copy), AvatarScreen (copy)
	return function(p2)
		-- upvalues: FullView (upval), p1 (copy), AvatarScreen (upval), OnOverlayClosed (copy)
		for _, value in p2:getState().AvatarExperience.Common.FullView do
			if value == FullView.SceneFullView then return end
		end
		p1.navigate(AvatarScreen.AvatarExperienceQuickMenu, { onOverlayClosed = OnOverlayClosed })
	end
end