local verifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local roduxModule = require(verifiedBadges.Parent.Rodux)
local cryoModule = require(verifiedBadges.Parent.Cryo)
local dependenciesModule = require(verifiedBadges.dependencies)

local var4 = function(p0, p1) --[[ line: 24 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tostring(v.id)] = if v.hasVerifiedBadge then true else cryoModule.None
	end
	return cryoModule.Dictionary.join(p0, t)
end

return roduxModule.createReducer({}, {
	[dependenciesModule.UsersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p2, p3) --[[ line: 35 ]]
		-- upvalues: var4 (ref)
		return var4(p2, { p3.responseBody })
	end,
	[dependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p4, p5) --[[ line: 39 ]]
		-- upvalues: var4 (ref)
		return var4(p4, p5.responseBody.data)
	end,
	AddGameDetails = function(p6, p7) --[[ line: 43 ]]
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p7.gameDetails) do
			local var7 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.User.Name then
				t[var7] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p6, t)
	end,
	AddGameDetailsV2 = if require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault or require(verifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p8, p9) --[[ line: 60 ]]
		-- upvalues: cryoModule (ref)
		local t = {}
		
		for i, v in pairs(p9.gameDetails) do
			local var9 = tostring(v.creator.id)
			local hasVerifiedBadge = v.creator.hasVerifiedBadge
			
			if v.creator.type == Enum.CreatorType.User.Name then
				t[var9] = if hasVerifiedBadge then true else cryoModule.None
			end
		end
		return cryoModule.Dictionary.join(p8, t)
	end else nil,
	SetAssetInfoFromCatalogItemAction = function(value, p10) --[[ line: 77 ]]
		-- upvalues: cryoModule (ref)
		return if p10.assetData.creatorType == Enum.CreatorType.User.Name then cryoModule.Dictionary.join(value, {
			[tostring(p10.assetData.creatorTargetId)] = if p10.assetData.creatorHasVerifiedBadge then true else cryoModule.None
		}) else value
	end
})