local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local DashModule = require(Parent.Dash)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local FFlagAXBackgroundsPersistence = require(Parent.AvatarExperienceFlags).FFlagAXBackgroundsPersistence

return function(p1, p2)
	-- upvalues: DashModule (copy), FFlagAXBackgroundsPersistence (copy)
	local TryOnItems = {}
	
	if p1.tryOn.OutfitTryOn.TryOnItems then
		for i, tryOnItem in p1.tryOn.OutfitTryOn.TryOnItems do
			TryOnItems[i] = if p2 then DashModule.omit(tryOnItem, { "order" }) else tryOnItem
		end
	end
	local EquippedAssets = {}
	
	if p1.equipped.EquippedAssets then
		for i1, equippedAsset in p1.equipped.EquippedAssets do
			EquippedAssets[i1] = {}
			
			for i2, value in equippedAsset do
				EquippedAssets[i1][i2] = if p2 then DashModule.omit(value, { "order" }) else value
			end
		end
	end
	return {
		OutfitTryOn = {
			TryOnItems = TryOnItems,
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
		EquippedAssets = EquippedAssets,
		EquippedEmotes = { slotInfo = p1.equipped.EquippedEmotes.slotInfo },
		BackgroundAssetId = if FFlagAXBackgroundsPersistence then p1.equipped.BackgroundAssetId else nil
	}
end