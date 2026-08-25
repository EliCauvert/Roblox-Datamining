local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local tutilsModule = require(avatarExperienceSave.Parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)

return function(p0)
	-- upvalues: tutilsModule (ref)
	return tutilsModule.fieldCount(if p0.tryOn.OutfitTryOn then p0.tryOn.OutfitTryOn.TryOnItems else {}) > 0
end