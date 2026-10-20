local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetAvailableToSellAssetsFromFetchSellData).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [p2.assetId] = p2.userAssetIdList })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.AddAvailableToSellAsset).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local AssetId = p2.assetId
		local JoinResult = { p2.userAssetId }
		local v1 = p1[AssetId]
		
		if v1 then
			JoinResult = CryoModule.List.join(v1, JoinResult)
		end
		return CryoModule.Dictionary.join(p1, { [AssetId] = JoinResult })
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.RemoveAvailableToSellAsset).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		local AssetId = p2.assetId
		local v1 = p1[AssetId]
		
		return if v1 then CryoModule.Dictionary.join(p1, {
			[AssetId] = CryoModule.List.removeValue(v1, p2.userAssetId)
		}) else p1
	end
})