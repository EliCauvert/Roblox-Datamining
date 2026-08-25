local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local dashModule = require(parent.Dash)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local fFlagAXBackgroundsPersistence = require(parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p0, p1)
	-- upvalues: dashModule (ref), fFlagAXBackgroundsPersistence (ref)
	local t = {}
	
	if p0.tryOn.OutfitTryOn.TryOnItems then
		for i, v in p0.tryOn.OutfitTryOn.TryOnItems do
			t[i] = if p1 then dashModule.omit(v, { "order" }) else v
		end
	end
	local t_1 = {}
	
	if p0.equipped.EquippedAssets then
		for i, v in p0.equipped.EquippedAssets do
			t_1[i] = {}
			
			for i_1, v_1 in v do
				t_1[i][i_1] = if p1 then dashModule.omit(v_1, { "order" }) else v_1
			end
		end
	end
	return {
		OutfitTryOn = {
			TryOnItems = t,
			LookId = p0.tryOn.OutfitTryOn.LookId,
			LookType = p0.tryOn.OutfitTryOn.LookType,
			BodyColor3s = p0.tryOn.OutfitTryOn.BodyColor3s,
			BodyPartColorRangeIds = p0.tryOn.OutfitTryOn.BodyPartColorRangeIds,
			Scale = p0.tryOn.OutfitTryOn.Scale
		},
		LastSavedTriedOnOutfit = p0.tryOn.LastSavedTriedOnOutfit,
		AvatarType = p0.equipped.AvatarType,
		AvatarScales = p0.equipped.AvatarScales,
		BodyColor3s = p0.equipped.BodyColor3s,
		BodyPartRangeIds = p0.equipped.BodyPartRangeIds,
		EquippedAssets = t_1,
		EquippedEmotes = { slotInfo = p0.equipped.EquippedEmotes.slotInfo },
		BackgroundAssetId = if fFlagAXBackgroundsPersistence then p0.equipped.BackgroundAssetId else nil
	}
end