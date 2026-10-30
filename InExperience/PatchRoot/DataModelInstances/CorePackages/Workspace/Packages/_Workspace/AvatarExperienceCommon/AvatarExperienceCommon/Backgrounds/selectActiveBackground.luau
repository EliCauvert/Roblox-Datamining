local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local AvatarExperienceFlagsModule = require(AvatarExperienceCommon.Parent.AvatarExperienceFlags)
local FFlagAXOutfitSaveSkipUnownedTryOnBackground = AvatarExperienceFlagsModule.FFlagAXOutfitSaveSkipUnownedTryOnBackground
local AvatarBackground = require(AvatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local NOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

local function scanTryOnForBackground(TryOnItems): number?
	-- upvalues: AvatarBackground (copy)
	if not TryOnItems then
		return nil
	end
	local Number = nil
	for _, tryOnItem in TryOnItems do
		if not tryOnItem.isUnequipped and tryOnItem.itemType == "Asset" and tryOnItem.itemSubType == AvatarBackground then
			Number = tonumber(tryOnItem.itemId)
			
			if Number then
				return Number
			end
		end
	end
	return nil
end

local function _(p1): number?
	-- upvalues: AvatarBackground (copy)
	if not p1 then
		return nil
	end
	local v1 = p1[AvatarBackground]
	
	if not v1 then
		return nil
	end
	local Number = nil
	for i in v1 do
		Number = tonumber(i)
		
		if Number then
			return Number
		end
	end
	return nil
end

return function(p2, p3)
	-- upvalues: AvatarBackground (copy), FFlagAXOutfitSaveSkipUnownedTryOnBackground (copy), AvatarExperienceFlagsModule (copy), scanTryOnForBackground (copy), NOBACKGROUNDASSETID (copy)
	if not AvatarBackground then
		return nil
	end
	local AvatarExperience = p2 and p2.AvatarExperience or p2
	local IsIgnoreTryOn: boolean = FFlagAXOutfitSaveSkipUnownedTryOnBackground and (p3 ~= nil and p3.ignoreTryOn == true)
	
	if AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration and not IsIgnoreTryOn then
		local OutfitTryOn = AvatarExperience and (AvatarExperience.AvatarScene and AvatarExperience.AvatarScene.OutfitTryOn)
		local ScanTryOnForBackgroundResult = scanTryOnForBackground(OutfitTryOn and OutfitTryOn.TryOnItems)
		
		if ScanTryOnForBackgroundResult then
			return ScanTryOnForBackgroundResult
		end
	end
	local ProfileConfiguration = AvatarExperience and (AvatarExperience.AvatarScene and AvatarExperience.AvatarScene.ProfileConfiguration)
	
	if ProfileConfiguration and ProfileConfiguration.BackgroundAssetId ~= nil then
		local BackgroundAssetId = ProfileConfiguration.BackgroundAssetId
		
		return if BackgroundAssetId == NOBACKGROUNDASSETID then nil else BackgroundAssetId
	end
	local Character = AvatarExperience and (AvatarExperience.AvatarEditor and AvatarExperience.AvatarEditor.Character)
	local EquippedAssets = Character and Character.EquippedAssets
	
	if not EquippedAssets then
		return nil
	end
	local EquippedAsset = EquippedAssets[AvatarBackground]
	
	if not EquippedAsset then
		return nil
	end
	local Number = nil
	for i in EquippedAsset do
		Number = tonumber(i)
		
		if Number then
			return Number
		end
	end
	return nil
end