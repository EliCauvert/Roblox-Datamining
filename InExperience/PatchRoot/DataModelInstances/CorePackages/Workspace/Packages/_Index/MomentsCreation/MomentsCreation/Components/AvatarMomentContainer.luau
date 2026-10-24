local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local AvatarMomentViewModule = require(script.Parent.AvatarMomentView)
local UseAvatarMomentViewModelModule = require(script.Parent.useAvatarMomentViewModel)

return function(p1)
	-- upvalues: UseAvatarMomentViewModelModule (copy), ReactModule (copy), AvatarMomentViewModule (copy)
	return ReactModule.createElement(AvatarMomentViewModule, (UseAvatarMomentViewModelModule(p1)))
end