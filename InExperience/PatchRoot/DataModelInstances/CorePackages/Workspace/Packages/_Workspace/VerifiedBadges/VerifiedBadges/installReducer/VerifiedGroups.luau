local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local cryoModule = require(verifiedBadges.Parent.Cryo)

return require(verifiedBadges.Parent.Rodux).createReducer({}, {
	AddGameDetails = function(p1, p2)
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p2.gameDetails) do
			local var1 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.Group.Name then
				t[var1] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p1, t)
	end,
	AddGameDetailsV2 = if require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault or require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p3, p4)
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p4.gameDetails) do
			local var2 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.Group.Name then
				t[var2] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p3, t)
	end else nil,
	SetAssetInfoFromCatalogItemAction = function(value, p5)
		-- upvalues: cryoModule (ref)
		return if p5.assetData.creatorType == Enum.CreatorType.Group.Name then cryoModule.Dictionary.join(value, {
			[tostring(p5.assetData.creatorTargetId)] = if p5.assetData.creatorHasVerifiedBadge then true else cryoModule.None
		}) else value
	end
})