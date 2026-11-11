local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local TutilsModule = require(AvatarExperienceSave.Parent.tutils)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)

return function(p1): boolean
	-- upvalues: TutilsModule (copy)
	return TutilsModule.fieldCount(p1.tryOn.OutfitTryOn and p1.tryOn.OutfitTryOn.TryOnItems or {}) > 0
end