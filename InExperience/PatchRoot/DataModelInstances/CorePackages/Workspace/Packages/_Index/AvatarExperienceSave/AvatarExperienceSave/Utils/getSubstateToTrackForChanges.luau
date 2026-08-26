local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local dashModule = require(parent.Dash)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local fFlagAXBackgroundsPersistence = require(parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p1, p2)
	-- upvalues: dashModule (ref), fFlagAXBackgroundsPersistence (ref)
	local t = {}
	
	if p1.tryOn.OutfitTryOn.TryOnItems then
		for i, v in p1.tryOn.OutfitTryOn.TryOnItems do
			t[i] = if p2 then dashModule.omit(v, { "order" }) else v
		end
	end
	local t_1 = {}
	
	if p1.equipped.EquippedAssets then
		for i, v in p1.equipped.EquippedAssets do
			t_1[i] = {}
			
			for i_1, v_1 in v do
				t_1[i][i_1] = if p2 then dashModule.omit(v_1, { "order" }) else v_1
			end
		end
	end
	return {
		OutfitTryOn = {
			TryOnItems = t,
			LookId = p1.tryOn.OutfitTryOn.LookId,
			LookType = p1.tryOn.OutfitTryOn.LookType,
			BodyColor3s = p1.tryOn.OutfitTryOn.BodyColor3s,
			BodyPartColorRangeIds = p1.tryOn.OutfitTryOn.BodyPartColorRangeIds,
			Scale = p1.tryOn.OutfitTryOn.Scale
		},
		LastSavedTriedOnOutfit = p1.tryOn.LastSavedTriedOnOutfit,
		AvatarType = p1.equipped.AvatarType,
		AvatarScales = p1.equipped.AvatarScales,
		BodyColor3s = p1.equipped.BodyColor3s,
		BodyPartRangeIds = p1.equipped.BodyPartRangeIds,
		EquippedAssets = t_1,
		EquippedEmotes = { slotInfo = p1.equipped.EquippedEmotes.slotInfo },
		BackgroundAssetId = if fFlagAXBackgroundsPersistence then p1.equipped.BackgroundAssetId else nil
	}
end