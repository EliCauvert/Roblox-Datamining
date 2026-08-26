local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local avatarBackground = require(avatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

local function scanTryOnForBackground(value)
	-- upvalues: avatarBackground (ref)
	if not value then
		return nil
	end
	for i, v in value do
		if not v.isUnequipped and v.itemType == "Asset" and v.itemSubType == avatarBackground then
			local var1 = tonumber(v.itemId)
			
			if var1 then
				return var1
			end
		end
	end
	return nil
end

local function _(value)
	-- upvalues: avatarBackground (ref)
	if not value then
		return nil
	end
	local var2 = value[avatarBackground]
	
	if not var2 then
		return nil
	end
	for i in var2 do
		local var3 = tonumber(i)
		
		if var3 then
			return var3
		end
	end
	return nil
end

return function(value)
	-- upvalues: avatarBackground (ref), avatarExperienceFlagsModule (ref), scanTryOnForBackground (ref), nOBACKGROUNDASSETID (ref)
	if not avatarBackground then
		return nil
	end
	local var4 = value and value.AvatarExperience
	
	if avatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration then
		local outfitTryOn = var4 and (var4.AvatarScene and var4.AvatarScene.OutfitTryOn)
		local var5 = scanTryOnForBackground(outfitTryOn and outfitTryOn.TryOnItems)
		
		if var5 then
			return var5
		end
	end
	local profileConfiguration = var4 and (var4.AvatarScene and var4.AvatarScene.ProfileConfiguration)
	
	if profileConfiguration and profileConfiguration.BackgroundAssetId ~= nil then
		local backgroundAssetId = profileConfiguration.BackgroundAssetId
		
		return if backgroundAssetId == nOBACKGROUNDASSETID then nil else backgroundAssetId
	end
	local character = var4 and (var4.AvatarEditor and var4.AvatarEditor.Character)
	local equippedAssets = character and character.EquippedAssets
	
	if not equippedAssets then
		return nil
	end
	local var6 = equippedAssets[avatarBackground]
	
	if not var6 then
		return nil
	end
	for i in var6 do
		local var7 = tonumber(i)
		
		if var7 then
			return var7
		end
	end
	return nil
end