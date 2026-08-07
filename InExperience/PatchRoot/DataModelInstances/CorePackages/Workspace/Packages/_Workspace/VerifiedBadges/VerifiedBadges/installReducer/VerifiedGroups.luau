local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local cryoModule = require(verifiedBadges.Parent.Cryo)

return require(verifiedBadges.Parent.Rodux).createReducer({}, {
	AddGameDetails = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p1.gameDetails) do
			local var3 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.Group.Name then
				t[var3] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p0, t)
	end,
	AddGameDetailsV2 = if require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault or require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p2, p3) --[[ line: 33 ]]
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p3.gameDetails) do
			local var5 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.Group.Name then
				t[var5] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p2, t)
	end else nil,
	SetAssetInfoFromCatalogItemAction = function(value, p4) --[[ line: 48 ]]
		-- upvalues: cryoModule (ref)
		return if p4.assetData.creatorType == Enum.CreatorType.Group.Name then cryoModule.Dictionary.join(value, {
			[tostring(p4.assetData.creatorTargetId)] = if p4.assetData.creatorHasVerifiedBadge then true else cryoModule.None
		}) else value
	end
})