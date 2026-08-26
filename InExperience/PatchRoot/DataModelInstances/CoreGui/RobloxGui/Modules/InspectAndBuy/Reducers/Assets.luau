local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local assetInfoModule = require(parent.Models.AssetInfo)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum

return roduxModule.createReducer({}, {
	[require(parent.Actions.SetFavoriteAsset).name] = function(p1, p2)
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		p1[p2.id] = cryoModule.Dictionary.join(cryoModule.Dictionary.join({}, p1[p2.id] or {}), assetInfoModule.fromGetFavoriteForAsset(p2.id, p2.isFavorite))
		
		return p1
	end,
	[require(parent.Actions.UpdateBulkPuchaseResults).name] = if require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(p1, p2)
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		for i, v in p2.result.Items do
			if v.type == Enum.MarketplaceProductType.AvatarAsset then
				local var1 = cryoModule.Dictionary.join({}, p1[v.id])
				p1[v.id] = cryoModule.Dictionary.join(var1, assetInfoModule.fromBulkPurchaseResult(v, var1))
			end
		end
		return p1
	end else nil,
	[require(parent.Actions.SetAssets).name] = function(p3, p4)
		-- upvalues: cryoModule (ref), assetInfoModule (ref)
		local t = {}
		
		for i, v in ipairs(p4.assets) do
			assert(v.assetId ~= nil, "Expected an asset id when setting an asset's information.")
			t[v.assetId] = cryoModule.Dictionary.join(p3[v.assetId] or {}, v)
			
			if t[v.assetId] then
				t[v.assetId] = assetInfoModule.getSaleDetailsForCollectibles(t[v.assetId])
			end
		end
		return cryoModule.Dictionary.join(p3, t)
	end,
	[require(parent.Actions.SetAvatarPreviewDetails).name] = if require(parent.Flags.FFlagAXEnableFetchAvatarPreview) then function(p5, p6)
		-- upvalues: itemTypeEnum (ref), assetInfoModule (ref), cryoModule (ref)
		local look = p6.avatarPreviewDetails.look
		
		if not look.items then
			return p5
		end
		local t = {}
		
		for i, v in look.items do
			if v.itemType == itemTypeEnum.Asset then
				t[tostring(v.id)] = assetInfoModule.fromAvatarPreviewItem(v)
			end
		end
		return cryoModule.Dictionary.join(p5, t)
	end else nil,
	[require(parent.Actions.SetBundlesAssetIsPartOf).name] = function(p7, p8)
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local var2 = tostring(p8.assetId)
		
		return cryoModule.Dictionary.join(p7, {
			[var2] = cryoModule.Dictionary.join(p7[var2] or {}, assetInfoModule.fromGetAssetBundles(var2, p8.bundleIds))
		})
	end,
	[require(parent.Actions.SetAssetFromBundleInfo).name] = function(p7, p8)
		-- upvalues: assetInfoModule (ref), cryoModule (ref)
		local var2 = tostring(p8.assetId)
		
		return cryoModule.Dictionary.join(p7, {
			[var2] = cryoModule.Dictionary.join(p7[var2] or {}, assetInfoModule.fromBundleInfo(var2, p8.bundleInfo))
		})
	end
})