local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(VerifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(VerifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(p1, p2): boolean --[[ Line: 48 | Named "isCreatorOfGameVerified" ]]
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	local Creator = nil
	
	if (FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp) and p2.shouldUseV2GameDetails then
		if p1.GameDetailsV2 and p1.GameDetailsV2[p2.universeId] then
			Creator = p1.GameDetailsV2[p2.universeId].creator
		end
	elseif p1.GameDetails and p1.GameDetails[p2.universeId] then
		Creator = p1.GameDetails[p2.universeId].creator
	end
	if Creator == nil or Creator.id == nil then
		return false
	end
	local Text = tostring(Creator.id)
	
	if Creator and p1.VerifiedBadges then
		if p1.VerifiedBadges.VerifiedUsers and Creator.type == Enum.CreatorType.User.Name then
			return p1.VerifiedBadges.VerifiedUsers[tostring(Text)] == true
		elseif p1.VerifiedBadges.VerifiedGroups and Creator.type == Enum.CreatorType.Group.Name then
			return p1.VerifiedBadges.VerifiedGroups[tostring(Text)] == true
		end
	end
	return false
end