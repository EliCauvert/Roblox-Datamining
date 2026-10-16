local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local CryoModule = require(VerifiedBadges.Parent.Cryo)
local DependenciesModule = require(VerifiedBadges.dependencies)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(VerifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

local function v4(p1, List) --[[ Line: 24 ]]
	-- upvalues: CryoModule (copy)
	local Nones = {}
	
	for _, value in ipairs(List) do
		Nones[tostring(value.id)] = if value.hasVerifiedBadge then true else CryoModule.None
	end
	return CryoModule.Dictionary.join(p1, Nones)
end

return require(VerifiedBadges.Parent.Rodux).createReducer({}, {
	[DependenciesModule.UsersNetworking.GetUserV2FromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 35 ]]
		-- upvalues: v4 (copy)
		return v4(p2, { p3.responseBody })
	end,
	[DependenciesModule.FriendsNetworking.GetFriendsFromUserId.Succeeded.name] = function(p2, p3) --[[ Line: 39 ]]
		-- upvalues: v4 (copy)
		return v4(p2, p3.responseBody.data)
	end,
	AddGameDetails = function(p2, p3) --[[ Line: 43 ]]
		-- upvalues: CryoModule (copy)
		local Nones = {}
		
		for _, gameDetail in pairs(p3.gameDetails) do
			local Text = tostring(gameDetail.creator.id)
			local HasVerifiedBadge = gameDetail.creator.hasVerifiedBadge
			
			if gameDetail.creator.type == Enum.CreatorType.User.Name then
				Nones[Text] = if HasVerifiedBadge then true else CryoModule.None
			end
		end
		return CryoModule.Dictionary.join(p2, Nones)
	end,
	AddGameDetailsV2 = if require(VerifiedBadges.Parent.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp then function(p4, p5) --[[ Line: 60 ]]
		-- upvalues: CryoModule (copy)
		local Nones = {}
		
		for _, gameDetail in pairs(p5.gameDetails) do
			local Text = tostring(gameDetail.creator.id)
			local HasVerifiedBadge = gameDetail.creator.hasVerifiedBadge
			
			if gameDetail.creator.type == Enum.CreatorType.User.Name then
				Nones[Text] = if HasVerifiedBadge then true else CryoModule.None
			end
		end
		return CryoModule.Dictionary.join(p4, Nones)
	end else nil,
	SetAssetInfoFromCatalogItemAction = function(p6, p7) --[[ Line: 77 ]]
		-- upvalues: CryoModule (copy)
		return if p7.assetData.creatorType == Enum.CreatorType.User.Name then CryoModule.Dictionary.join(p6, {
			[tostring(p7.assetData.creatorTargetId)] = if p7.assetData.creatorHasVerifiedBadge then true else CryoModule.None
		}) else p6
	end
})