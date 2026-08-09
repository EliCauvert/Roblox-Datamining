local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local assetInfoModule = require(parent.Models.AssetInfo)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum

return roduxModule.createReducer({}, {
	[require(parent.Actions.SetFavoriteAsset).name] = if require(parent.Flags.FFlagAXEnableFavoritesInfoForAssetsAndBundles) then function(p0, p1) --[[ line: 26 ]]
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		p0[p1.id] = cryoModule.Dictionary.join(cryoModule.Dictionary.join({}, p0[p1.id] or {}), assetInfoModule.fromGetFavoriteForAsset(p1.id, p1.isFavorite))
		
		return p0
	end else nil,
	[require(parent.Actions.UpdateBulkPuchaseResults).name] = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(p2, p3) --[[ line: 38 ]]
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		for i, v in p3.result.Items do
			if v.type == Enum.MarketplaceProductType.AvatarAsset then
				local var4 = cryoModule.Dictionary.join({}, p2[v.id])
				p2[v.id] = cryoModule.Dictionary.join(var4, assetInfoModule.fromBulkPurchaseResult(v, var4))
			end
		end
		return p2
	end else nil,
	[require(parent.Actions.SetAssets).name] = function(p4, p5) --[[ line: 53 ]]
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		local t = {}
		
		for i, v in ipairs(p5.assets) do
			assert(v.assetId ~= nil, "Expected an asset id when setting an asset's information.")
			t[v.assetId] = cryoModule.Dictionary.join(p4[v.assetId] or {}, v)
			
			if t[v.assetId] then
				t[v.assetId] = assetInfoModule.getSaleDetailsForCollectibles(t[v.assetId])
			end
		end
		return cryoModule.Dictionary.join(p4, t)
	end,
	[require(parent.Actions.SetAvatarPreviewDetails).name] = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then function(p6, p7) --[[ line: 74 ]]
		-- upvalues: itemTypeEnum (ref), assetInfoModule (ref), cryoModule (ref)
		local look = p7.avatarPreviewDetails.look
		
		if not look.items then
			return p6
		end
		local t = {}
		
		for i, v in look.items do
			if v.itemType == itemTypeEnum.Asset then
				t[tostring(v.id)] = assetInfoModule.fromAvatarPreviewItem(v)
			end
		end
		return cryoModule.Dictionary.join(p6, t)
	end else nil,
	[require(parent.Actions.SetBundlesAssetIsPartOf).name] = function(p8, p9) --[[ line: 95 ]]
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local var7 = tostring(p9.assetId)
		
		return cryoModule.Dictionary.join(p8, {
			[var7] = cryoModule.Dictionary.join(p8[var7] or {}, assetInfoModule.fromGetAssetBundles(var7, p9.bundleIds))
		})
	end,
	[require(parent.Actions.SetAssetFromBundleInfo).name] = function(p10, p11) --[[ line: 104 ]]
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local var8 = tostring(p11.assetId)
		
		return cryoModule.Dictionary.join(p10, {
			[var8] = cryoModule.Dictionary.join(p10[var8] or {}, assetInfoModule.fromBundleInfo(var8, p11.bundleInfo))
		})
	end
})