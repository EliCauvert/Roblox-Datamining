local ClearTryOnsFunction = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local SetLastSavedTriedOnOutfitModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Actions.SetLastSavedTriedOnOutfit)

return function()
	-- upvalues: SetLastSavedTriedOnOutfitModule (copy), ClearTryOnsFunction (copy)
	return function(p1)
		-- upvalues: SetLastSavedTriedOnOutfitModule (upval), ClearTryOnsFunction (upval)
		p1:dispatch(SetLastSavedTriedOnOutfitModule(p1:getState().AvatarExperience.AvatarScene.OutfitTryOn))
		p1:dispatch(ClearTryOnsFunction())
	end
end