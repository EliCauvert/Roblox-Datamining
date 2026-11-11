local FullView = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local SetFullViewModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Thunks.SetFullView)

return function(p1, p2)
	-- upvalues: FullView (copy), SetFullViewModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), FullView (upval), SetFullViewModule (upval), p1 (copy)
		if p3:getState().AvatarExperience.Common.FullView[p2] == FullView.SceneFullView then
			p3:dispatch(SetFullViewModule(p1, p2, FullView.None))
		end
	end
end