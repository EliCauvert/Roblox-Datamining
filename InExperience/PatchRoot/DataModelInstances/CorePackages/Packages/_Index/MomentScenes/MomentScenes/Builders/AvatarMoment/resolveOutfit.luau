local Players = game:GetService("Players")
local R15 = Enum.HumanoidRigType.R15

local function gearAssetIdFromAssets(Assets)
	if typeof(Assets) ~= "table" then
		return nil
	end
	local Id = nil
	for _, asset in Assets do
		if typeof(asset) == "table" then
			local AssetType = asset.AssetType or asset.assetType
			
			if (if typeof(AssetType) == "table" then AssetType.Id or AssetType.id else nil) == Enum.AssetType.Gear.Value then
				Id = asset.Id or asset.id
				
				if typeof(Id) == "number" and Id > 0 then
					return Id
				end
			end
		end
	end
	return nil
end

local function resolveDetails(OutfitId)
	-- upvalues: R15 (copy), gearAssetIdFromAssets (copy)
	local Success, Result = pcall(function()
		-- upvalues: OutfitId (copy)
		return game:GetService("AvatarEditorService"):GetOutfitDetailsAsync(OutfitId)
	end)
	
	if not Success or typeof(Result) ~= "table" then
		warn(`resolveOutfit: outfit {OutfitId} details unavailable, assuming R15 ({Result})`)
		
		return { gearAssetId = nil, rigType = R15 }
	end
	local t = {}
	local PlayerAvatarType = Result.PlayerAvatarType
	
	if PlayerAvatarType ~= "R6" and PlayerAvatarType ~= "R15" then
		warn(`resolveOutfit: unrecognized PlayerAvatarType {PlayerAvatarType}, assuming R15`)
	end
	t.rigType = if PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else R15
	t.gearAssetId = gearAssetIdFromAssets(Result.Assets)
	
	return t
end

local function resolveUserDetails(UserId)
	-- upvalues: Players (copy), R15 (copy), gearAssetIdFromAssets (copy)
	local Success, Result = pcall(function()
		-- upvalues: Players (upval), UserId (copy)
		return Players:GetCharacterAppearanceInfoAsync(UserId)
	end)
	
	if not Success or typeof(Result) ~= "table" then
		warn(`resolveOutfit: user {UserId} appearance info unavailable, assuming R15 ({Result})`)
		
		return { gearAssetId = nil, rigType = R15 }
	end
	local t = {}
	local PlayerAvatarType = Result.playerAvatarType
	
	if PlayerAvatarType ~= "R6" and PlayerAvatarType ~= "R15" then
		warn(`resolveOutfit: unrecognized PlayerAvatarType {PlayerAvatarType}, assuming R15`)
	end
	t.rigType = if PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else R15
	t.gearAssetId = gearAssetIdFromAssets(Result.assets)
	
	return t
end

return {
	resolve = function(OutfitId)
		-- upvalues: Players (copy), resolveDetails (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), OutfitId (copy)
			return Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId)
		end)
		
		if not Success or typeof(Result) ~= "Instance" then
			error(`resolveOutfit: outfit {OutfitId} did not resolve ({Result})`)
		end
		local ResolveDetailsResult = resolveDetails(OutfitId)
		
		return {
			rigType = ResolveDetailsResult.rigType,
			humanoidDescription = Result,
			gearAssetId = ResolveDetailsResult.gearAssetId
		}
	end,
	resolveUser = function(UserId)
		-- upvalues: Players (copy), resolveUserDetails (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), UserId (copy)
			return Players:GetHumanoidDescriptionFromUserIdAsync(UserId)
		end)
		
		if not Success or typeof(Result) ~= "Instance" then
			error(`resolveOutfit: user {UserId} did not resolve ({Result})`)
		end
		local ResolveUserDetailsResult = resolveUserDetails(UserId)
		
		return {
			rigType = ResolveUserDetailsResult.rigType,
			humanoidDescription = Result,
			gearAssetId = ResolveUserDetailsResult.gearAssetId
		}
	end,
	rigTypeFromName = function(p1)
		-- upvalues: R15 (copy)
		if p1 ~= "R6" and p1 ~= "R15" then
			warn(`resolveOutfit: unrecognized PlayerAvatarType {p1}, assuming R15`)
		end
		return if p1 == "R6" then Enum.HumanoidRigType.R6 else R15
	end,
	isKnownAvatarType = function(p1): boolean
		return p1 == "R6" or p1 == "R15"
	end,
	gearAssetIdFromAssets = gearAssetIdFromAssets
}