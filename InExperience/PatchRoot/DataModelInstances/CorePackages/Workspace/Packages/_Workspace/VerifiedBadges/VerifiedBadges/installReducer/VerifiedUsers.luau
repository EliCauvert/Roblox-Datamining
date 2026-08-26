local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local roduxModule = require(verifiedBadges.Parent.Rodux)
local cryoModule = require(verifiedBadges.Parent.Cryo)
local dependenciesModule = require(verifiedBadges.dependencies)

local var1 = function(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		t[tostring(v.id)] = if v.hasVerifiedBadge then true else cryoModule.None
	end
	return cryoModule.Dictionary.join(p1, t)
end

return roduxModule.createReducer({}, {
	[dependenciesModule.UsersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p3, p4)
		-- upvalues: var1 (ref)
		return var1(p3, { p4.responseBody })
	end,
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p3, p4)
		-- upvalues: var1 (ref)
		return var1(p3, p4.responseBody.data)
	end,
	AddGameDetails = function(p3, p4)
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p4.gameDetails) do
			local var2 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.User.Name then
				t[var2] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p3, t)
	end,
	AddGameDetailsV2 = if require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault or require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p5, p6)
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p6.gameDetails) do
			local var3 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.User.Name then
				t[var3] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p5, t)
	end else nil,
	SetAssetInfoFromCatalogItemAction = function(value, p7)
		-- upvalues: cryoModule (ref)
		return if p7.assetData.creatorType == Enum.CreatorType.User.Name then cryoModule.Dictionary.join(value, {
			[tostring(p7.assetData.creatorTargetId)] = if p7.assetData.creatorHasVerifiedBadge then true else cryoModule.None
		}) else value
	end
})