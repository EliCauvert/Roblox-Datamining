local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local AssetInfoModule = require(Parent.Models.AssetInfo)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local FFlagAXEnableFetchAvatarPreviewModule = require(Parent.Flags.FFlagAXEnableFetchAvatarPreview)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Parent.Actions.SetFavoriteAsset).name] = function(JoinResults, p1)
		-- upvalues: CryoModule (copy), AssetInfoModule (copy)
		JoinResults[p1.id] = CryoModule.Dictionary.join(CryoModule.Dictionary.join({}, JoinResults[p1.id] or {}), AssetInfoModule.fromGetFavoriteForAsset(p1.id, p1.isFavorite))
		
		return JoinResults
	end,
	[require(Parent.Actions.UpdateBulkPuchaseResults).name] = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(JoinResults, p1)
		-- upvalues: CryoModule (copy), AssetInfoModule (copy)
		for _, item in p1.result.Items do
			if item.type == Enum.MarketplaceProductType.AvatarAsset then
				local JoinResult = CryoModule.Dictionary.join({}, JoinResults[item.id])
				JoinResults[item.id] = CryoModule.Dictionary.join(JoinResult, AssetInfoModule.fromBulkPurchaseResult(item, JoinResult))
			end
		end
		return JoinResults
	end else nil,
	[require(Parent.Actions.SetAssets).name] = function(p2, p3)
		-- upvalues: CryoModule (copy), AssetInfoModule (copy)
		local JoinResults = {}
		
		for _, asset in ipairs(p3.assets) do
			assert(asset.assetId ~= nil, "Expected an asset id when setting an asset's information.")
			JoinResults[asset.assetId] = CryoModule.Dictionary.join(p2[asset.assetId] or {}, asset)
			
			if JoinResults[asset.assetId] then
				JoinResults[asset.assetId] = AssetInfoModule.getSaleDetailsForCollectibles(JoinResults[asset.assetId])
			end
		end
		return (CryoModule.Dictionary.join(p2, JoinResults))
	end,
	[require(Parent.Actions.SetAvatarPreviewDetails).name] = if FFlagAXEnableFetchAvatarPreviewModule then function(p4, p5)
		-- upvalues: ItemTypeEnum (copy), AssetInfoModule (copy), CryoModule (copy)
		local Look = p5.avatarPreviewDetails.look
		
		if not Look.items then
			return p4
		end
		local FromAvatarPreviewItemResults = {}
		
		for _, item in Look.items do
			if item.itemType == ItemTypeEnum.Asset then
				FromAvatarPreviewItemResults[tostring(item.id)] = AssetInfoModule.fromAvatarPreviewItem(item)
			end
		end
		return CryoModule.Dictionary.join(p4, FromAvatarPreviewItemResults)
	end else nil,
	[require(Parent.Actions.SetBundlesAssetIsPartOf).name] = function(p6, p7)
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local Text = tostring(p7.assetId)
		
		return CryoModule.Dictionary.join(p6, {
			[Text] = CryoModule.Dictionary.join(p6[Text] or {}, (AssetInfoModule.fromGetAssetBundles(Text, p7.bundleIds)))
		})
	end,
	[require(Parent.Actions.SetAssetFromBundleInfo).name] = function(p6, p7)
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local Text = tostring(p7.assetId)
		
		return CryoModule.Dictionary.join(p6, {
			[Text] = CryoModule.Dictionary.join(p6[Text] or {}, (AssetInfoModule.fromBundleInfo(Text, p7.bundleInfo)))
		})
	end
})