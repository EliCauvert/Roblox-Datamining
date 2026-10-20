local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local DashModule = require(Parent.Dash)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AXPickStateInsteadOfOmit = game:DefineFastFlag("AXPickStateInsteadOfOmit", false)
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagAXBackgroundsPersistence = AvatarExperienceFlagsModule.FFlagAXBackgroundsPersistence

return function(p1, p2)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), DashModule (copy), AXPickStateInsteadOfOmit (copy), FFlagAXBackgroundsPersistence (copy)
	local T = if FFlagAXCustomizeMakeupSupport then {} else nil
	
	if FFlagAXCustomizeMakeupSupport and p1.tryOn.OutfitTryOn.TryOnItems then
		for i, tryOnItem in p1.tryOn.OutfitTryOn.TryOnItems do
			T[i] = if p2 then DashModule.omit(tryOnItem, { "order" }) else tryOnItem
		end
	end
	local T1 = if FFlagAXCustomizeMakeupSupport then {} else nil
	
	if FFlagAXCustomizeMakeupSupport and p1.equipped.EquippedAssets then
		for i1, equippedAsset in p1.equipped.EquippedAssets do
			T1[i1] = {}
			
			for i2, value in equippedAsset do
				T1[i1][i2] = if p2 then DashModule.omit(value, { "order" }) else value
			end
		end
	end
	return {
		OutfitTryOn = if AXPickStateInsteadOfOmit then {
			TryOnItems = if FFlagAXCustomizeMakeupSupport then T else p1.tryOn.OutfitTryOn.TryOnItems,
			LookId = p1.tryOn.OutfitTryOn.LookId,
			LookType = p1.tryOn.OutfitTryOn.LookType,
			BodyColor3s = p1.tryOn.OutfitTryOn.BodyColor3s,
			BodyPartColorRangeIds = p1.tryOn.OutfitTryOn.BodyPartColorRangeIds,
			Scale = p1.tryOn.OutfitTryOn.Scale
		} else DashModule.omit(p1.tryOn.OutfitTryOn, {
			"OutfitIdMap",
			"LastAnimOrEmoteToggledItem",
			"LastToggledItem",
			"LookAnalyticsInfo",
			"DefaultTryOnBodyColorsToggled"
		}),
		LastSavedTriedOnOutfit = p1.tryOn.LastSavedTriedOnOutfit,
		AvatarType = p1.equipped.AvatarType,
		AvatarScales = p1.equipped.AvatarScales,
		BodyColor3s = p1.equipped.BodyColor3s,
		BodyPartRangeIds = p1.equipped.BodyPartRangeIds,
		EquippedAssets = if FFlagAXCustomizeMakeupSupport then T1 else p1.equipped.EquippedAssets,
		EquippedEmotes = if AXPickStateInsteadOfOmit then { slotInfo = p1.equipped.EquippedEmotes.slotInfo } else DashModule.omit(p1.equipped.EquippedEmotes, { "selectedSlot" }),
		BackgroundAssetId = if FFlagAXBackgroundsPersistence then p1.equipped.BackgroundAssetId else nil
	}
end