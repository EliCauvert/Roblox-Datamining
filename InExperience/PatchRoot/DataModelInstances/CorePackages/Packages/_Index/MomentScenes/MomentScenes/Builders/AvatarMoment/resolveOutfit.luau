local Players = game:GetService("Players")
local R15 = Enum.HumanoidRigType.R15

local function resolveRigType(OutfitId)
	-- upvalues: R15 (copy)
	local Success, Result = pcall(function()
		-- upvalues: OutfitId (copy)
		return game:GetService("AvatarEditorService"):GetOutfitDetailsAsync(OutfitId)
	end)
	
	if not Success or typeof(Result) ~= "table" then
		warn(`resolveOutfit: outfit {OutfitId} details unavailable, assuming R15 ({Result})`)
		
		return R15
	end
	local PlayerAvatarType = Result.PlayerAvatarType
	
	if PlayerAvatarType ~= "R6" and PlayerAvatarType ~= "R15" then
		warn(`resolveOutfit: unrecognized PlayerAvatarType {PlayerAvatarType}, assuming R15`)
	end
	return if PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else R15
end

local function resolveUserRigType(UserId)
	-- upvalues: Players (copy), R15 (copy)
	local Success, Result = pcall(function()
		-- upvalues: Players (upval), UserId (copy)
		return Players:GetCharacterAppearanceInfoAsync(UserId)
	end)
	
	if not Success or typeof(Result) ~= "table" then
		warn(`resolveOutfit: user {UserId} appearance info unavailable, assuming R15 ({Result})`)
		
		return R15
	end
	local PlayerAvatarType = Result.playerAvatarType
	
	if PlayerAvatarType ~= "R6" and PlayerAvatarType ~= "R15" then
		warn(`resolveOutfit: unrecognized PlayerAvatarType {PlayerAvatarType}, assuming R15`)
	end
	return if PlayerAvatarType == "R6" then Enum.HumanoidRigType.R6 else R15
end

return {
	resolve = function(OutfitId)
		-- upvalues: Players (copy), resolveRigType (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), OutfitId (copy)
			return Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId)
		end)
		
		if not Success or typeof(Result) ~= "Instance" then
			error(`resolveOutfit: outfit {OutfitId} did not resolve ({Result})`)
		end
		return {
			rigType = resolveRigType(OutfitId),
			humanoidDescription = Result
		}
	end,
	resolveUser = function(UserId)
		-- upvalues: Players (copy), resolveUserRigType (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), UserId (copy)
			return Players:GetHumanoidDescriptionFromUserIdAsync(UserId)
		end)
		
		if not Success or typeof(Result) ~= "Instance" then
			error(`resolveOutfit: user {UserId} did not resolve ({Result})`)
		end
		return {
			rigType = resolveUserRigType(UserId),
			humanoidDescription = Result
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
	end
}