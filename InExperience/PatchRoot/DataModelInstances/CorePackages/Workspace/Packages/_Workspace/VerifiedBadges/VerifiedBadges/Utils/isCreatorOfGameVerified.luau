local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local fFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local fFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(p1, p2)
	-- upvalues: fFlagLuaAppEdpBackendV2HydrateLegacyDefault (ref), fFlagLuaAppEdpBackendV2HydrateLegacyIxp (ref)
	local creator = nil
	
	if (fFlagLuaAppEdpBackendV2HydrateLegacyDefault or fFlagLuaAppEdpBackendV2HydrateLegacyIxp) and p2.shouldUseV2GameDetails then
		if p1.GameDetailsV2 and p1.GameDetailsV2[p2.universeId] then
			creator = p1.GameDetailsV2[p2.universeId].creator
		end
	elseif p1.GameDetails and p1.GameDetails[p2.universeId] then
		creator = p1.GameDetails[p2.universeId].creator
	end
	local _ = ""
	
	if creator == nil or creator.id == nil then
		return false
	end
	local var1 = tostring(creator.id)
	
	if creator and p1.VerifiedBadges then
		return if p1.VerifiedBadges.VerifiedUsers and creator.type == Enum.CreatorType.User.Name then p1.VerifiedBadges.VerifiedUsers[tostring(var1)] == true elseif p1.VerifiedBadges.VerifiedGroups and creator.type == Enum.CreatorType.Group.Name then p1.VerifiedBadges.VerifiedGroups[tostring(var1)] == true else false
	end
end