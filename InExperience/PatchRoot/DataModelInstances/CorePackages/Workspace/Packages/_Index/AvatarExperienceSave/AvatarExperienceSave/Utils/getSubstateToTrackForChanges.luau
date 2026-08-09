local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local dashModule = require(parent.Dash)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local AXPickStateInsteadOfOmit = game:DefineFastFlag("AXPickStateInsteadOfOmit", false)
local fFlagAXCustomizeMakeupSupport = avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local fFlagAXBackgroundsPersistence = avatarExperienceFlagsModule.FFlagAXBackgroundsPersistence

return function(p0, p1) --[[ line: 27 | named "getSubstateToTrackForChanges" ]]
	-- upvalues: fFlagAXCustomizeMakeupSupport (ref), dashModule (ref), AXPickStateInsteadOfOmit (ref), fFlagAXBackgroundsPersistence (ref)
	local var4 = if fFlagAXCustomizeMakeupSupport then {} else nil
	
	if fFlagAXCustomizeMakeupSupport and p0.tryOn.OutfitTryOn.TryOnItems then
		for i, v in p0.tryOn.OutfitTryOn.TryOnItems do
			var4[i] = if p1 then dashModule.omit(v, { "order" }) else v
		end
	end
	local var5 = if fFlagAXCustomizeMakeupSupport then {} else nil
	
	if fFlagAXCustomizeMakeupSupport and p0.equipped.EquippedAssets then
		for i, v in p0.equipped.EquippedAssets do
			var5[i] = {}
			
			for i_1, v_1 in v do
				var5[i][i_1] = if p1 then dashModule.omit(v_1, { "order" }) else v_1
			end
		end
	end
	return {
		OutfitTryOn = if AXPickStateInsteadOfOmit then {
			TryOnItems = if fFlagAXCustomizeMakeupSupport then var4 else p0.tryOn.OutfitTryOn.TryOnItems,
			LookId = p0.tryOn.OutfitTryOn.LookId,
			LookType = p0.tryOn.OutfitTryOn.LookType,
			BodyColor3s = p0.tryOn.OutfitTryOn.BodyColor3s,
			BodyPartColorRangeIds = p0.tryOn.OutfitTryOn.BodyPartColorRangeIds,
			Scale = p0.tryOn.OutfitTryOn.Scale
		} else dashModule.omit(p0.tryOn.OutfitTryOn, {
			"OutfitIdMap",
			"LastAnimOrEmoteToggledItem",
			"LastToggledItem",
			"LookAnalyticsInfo",
			"DefaultTryOnBodyColorsToggled"
		}),
		LastSavedTriedOnOutfit = p0.tryOn.LastSavedTriedOnOutfit,
		AvatarType = p0.equipped.AvatarType,
		AvatarScales = p0.equipped.AvatarScales,
		BodyColor3s = p0.equipped.BodyColor3s,
		BodyPartRangeIds = p0.equipped.BodyPartRangeIds,
		EquippedAssets = if fFlagAXCustomizeMakeupSupport then var5 else p0.equipped.EquippedAssets,
		EquippedEmotes = if AXPickStateInsteadOfOmit then { slotInfo = p0.equipped.EquippedEmotes.slotInfo } else dashModule.omit(p0.equipped.EquippedEmotes, { "selectedSlot" }),
		BackgroundAssetId = if fFlagAXBackgroundsPersistence then p0.equipped.BackgroundAssetId else nil
	}
end