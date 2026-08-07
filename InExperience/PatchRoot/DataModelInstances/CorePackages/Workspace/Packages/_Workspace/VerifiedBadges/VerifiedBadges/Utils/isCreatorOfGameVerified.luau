local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local fFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local fFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(p0, p1) --[[ line: 48 | named "isCreatorOfGameVerified" ]]
	-- upvalues: fFlagLuaAppEdpBackendV2HydrateLegacyDefault (ref), fFlagLuaAppEdpBackendV2HydrateLegacyIxp (ref)
	local creator = nil
	
	if (fFlagLuaAppEdpBackendV2HydrateLegacyDefault or fFlagLuaAppEdpBackendV2HydrateLegacyIxp) and p1.shouldUseV2GameDetails then
		if p0.GameDetailsV2 and p0.GameDetailsV2[p1.universeId] then
			creator = p0.GameDetailsV2[p1.universeId].creator
		end
	elseif p0.GameDetails and p0.GameDetails[p1.universeId] then
		creator = p0.GameDetails[p1.universeId].creator
	end
	local _ = ""
	
	if creator == nil or creator.id == nil then
		return false
	end
	local var1 = tostring(creator.id)
	
	if creator and p0.VerifiedBadges then
		return if p0.VerifiedBadges.VerifiedUsers and creator.type == Enum.CreatorType.User.Name then p0.VerifiedBadges.VerifiedUsers[tostring(var1)] == true elseif p0.VerifiedBadges.VerifiedGroups and creator.type == Enum.CreatorType.Group.Name then p0.VerifiedBadges.VerifiedGroups[tostring(var1)] == true else false
	end
end