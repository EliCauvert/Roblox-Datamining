local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local FFlagHeadRefinementFacialAnimationToggle = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceFlags).FFlagHeadRefinementFacialAnimationToggle

return function(p1)
	-- upvalues: FFlagHeadRefinementFacialAnimationToggle (copy), CharacterManagerUtilsModule (copy)
	if FFlagHeadRefinementFacialAnimationToggle then
		local TryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems or {}
		
		return if next(TryOnItems) ~= nil then CharacterManagerUtilsModule.getStaticFacialAnimationFromTryOn(p1) else CharacterManagerUtilsModule.getStaticFacialAnimationFromEquippedAssets(p1)
	else
		return nil
	end
end