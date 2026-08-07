local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local avatarExperienceFlagsModule = require(avatarExperienceCommon.Parent.AvatarExperienceFlags)
local avatarBackground = require(avatarExperienceCommon.Constants).ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground
local nOBACKGROUNDASSETID = require(script.Parent.constants).NO_BACKGROUND_ASSET_ID

local function scanTryOnForBackground(value) --[[ line: 32 ]]
	-- upvalues: avatarBackground (ref)
	if not value then
		return nil
	end
	for i, v in value do
		if not v.isUnequipped and v.itemType == "Asset" and v.itemSubType == avatarBackground then
			local var3 = tonumber(v.itemId)
			
			if var3 then
				return var3
			end
		end
	end
	return nil
end

local function _(value) --[[ line: 50 | named "firstEquippedBackgroundId" ]]
	-- upvalues: avatarBackground (ref)
	if not value then
		return nil
	end
	local var4 = value[avatarBackground]
	
	if not var4 then
		return nil
	end
	for i in var4 do
		local var5 = tonumber(i)
		
		if var5 then
			return var5
		end
	end
	return nil
end

return function(value) --[[ line: 67 | named "selectActiveBackground" ]]
	-- upvalues: avatarBackground (ref), avatarExperienceFlagsModule (ref), scanTryOnForBackground (ref), nOBACKGROUNDASSETID (ref)
	if not avatarBackground then
		return nil
	end
	local var6 = value and value.AvatarExperience
	
	if avatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration then
		local outfitTryOn = var6 and (var6.AvatarScene and var6.AvatarScene.OutfitTryOn)
		local var8 = scanTryOnForBackground(outfitTryOn and outfitTryOn.TryOnItems)
		
		if var8 then
			return var8
		end
	end
	local profileConfiguration = var6 and (var6.AvatarScene and var6.AvatarScene.ProfileConfiguration)
	
	if profileConfiguration and profileConfiguration.BackgroundAssetId ~= nil then
		local backgroundAssetId = profileConfiguration.BackgroundAssetId
		
		return if backgroundAssetId == nOBACKGROUNDASSETID then nil else backgroundAssetId
	end
	local character = var6 and (var6.AvatarEditor and var6.AvatarEditor.Character)
	local equippedAssets = character and character.EquippedAssets
	
	if not equippedAssets then
		return nil
	end
	local var12 = equippedAssets[avatarBackground]
	
	if not var12 then
		return nil
	end
	for i in var12 do
		local var13 = tonumber(i)
		
		if var13 then
			return var13
		end
	end
	return nil
end