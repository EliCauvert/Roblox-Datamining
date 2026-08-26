local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local tutilsModule = require(avatarExperienceSave.Parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)

return function(p1)
	-- upvalues: tutilsModule (ref)
	return tutilsModule.fieldCount(if p1.tryOn.OutfitTryOn then p1.tryOn.OutfitTryOn.TryOnItems else {}) > 0
end