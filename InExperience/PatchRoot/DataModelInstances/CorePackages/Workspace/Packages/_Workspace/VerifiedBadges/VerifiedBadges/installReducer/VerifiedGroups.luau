local VerifiedBadges = script:FindFirstAncestor("VerifiedBadges")
local CryoModule = require(VerifiedBadges.Parent.Cryo)

return require(VerifiedBadges.Parent.Rodux).createReducer({}, {
	AddGameDetails = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local Nones = {}
		
		for _, gameDetail in pairs(p2.gameDetails) do
			local Text = tostring(gameDetail.creator.id)
			local HasVerifiedBadge = gameDetail.creator.hasVerifiedBadge
			
			if gameDetail.creator.type == Enum.CreatorType.Group.Name then
				Nones[Text] = if HasVerifiedBadge then true else CryoModule.None
			end
		end
		return CryoModule.Dictionary.join(p1, Nones)
	end,
	AddGameDetailsV2 = function(p3, p4)
		-- upvalues: CryoModule (copy)
		local Nones = {}
		
		for _, gameDetail in pairs(p4.gameDetails) do
			local Text = tostring(gameDetail.creator.id)
			local HasVerifiedBadge = gameDetail.creator.hasVerifiedBadge
			
			if gameDetail.creator.type == Enum.CreatorType.Group.Name then
				Nones[Text] = if HasVerifiedBadge then true else CryoModule.None
			end
		end
		return CryoModule.Dictionary.join(p3, Nones)
	end,
	SetAssetInfoFromCatalogItemAction = function(p5, p6)
		-- upvalues: CryoModule (copy)
		return if p6.assetData.creatorType == Enum.CreatorType.Group.Name then CryoModule.Dictionary.join(p5, {
			[tostring(p6.assetData.creatorTargetId)] = if p6.assetData.creatorHasVerifiedBadge then true else CryoModule.None
		}) else p5
	end
})