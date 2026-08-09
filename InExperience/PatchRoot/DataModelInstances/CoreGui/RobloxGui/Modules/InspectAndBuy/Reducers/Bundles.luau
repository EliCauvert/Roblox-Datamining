local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roduxModule = require(corePackagesService.Packages.Rodux)
local parent = script.Parent.Parent
local setBundlesModule = require(parent.Actions.SetBundles)
local setFavoriteBundleModule = require(parent.Actions.SetFavoriteBundle)
local updateBulkPuchaseResultsModule = require(parent.Actions.UpdateBulkPuchaseResults)
local setAvatarPreviewDetailsModule = require(parent.Actions.SetAvatarPreviewDetails)
local itemTypeEnum = require(corePackagesService.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local fFlagAXEnableFetchAvatarPreviewModule = require(parent.Flags.FFlagAXEnableFetchAvatarPreview)
local fFlagAXEnableInspectAndBuyBulkPurchase = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase
local fFlagAXEnableFavoritesInfoForAssetsAndBundlesModule = require(parent.Flags.FFlagAXEnableFavoritesInfoForAssetsAndBundles)
local bundleInfoModule = require(parent.Models.BundleInfo)

return roduxModule.createReducer({}, {
	[setFavoriteBundleModule.name] = if fFlagAXEnableFavoritesInfoForAssetsAndBundlesModule then function(p0, p1) --[[ line: 35 ]]
		-- upvalues: cryoModule (ref), bundleInfoModule (ref)
		p0[p1.id] = cryoModule.Dictionary.join(cryoModule.Dictionary.join({}, p0[p1.id] or {}), bundleInfoModule.fromGetFavoriteForAsset(p1.id, p1.isFavorite))
		
		return p0
	end else nil,
	[updateBulkPuchaseResultsModule.name] = if fFlagAXEnableInspectAndBuyBulkPurchase then function(p2, p3) --[[ line: 47 ]]
		-- upvalues: cryoModule (ref), bundleInfoModule (ref)
		for i, v in p3.result.Items do
			if v.type == Enum.MarketplaceProductType.AvatarBundle then
				local var10 = cryoModule.Dictionary.join({}, p2[v.id])
				p2[v.id] = cryoModule.Dictionary.join(var10, bundleInfoModule.fromBulkPurchaseResult(v, var10))
			end
		end
		return p2
	end else nil,
	[setAvatarPreviewDetailsModule.name] = if fFlagAXEnableFetchAvatarPreviewModule then function(p4, p5) --[[ line: 63 ]]
		-- upvalues: itemTypeEnum (ref), bundleInfoModule (ref), cryoModule (ref)
		local look = p5.avatarPreviewDetails.look
		local t = {}
		
		if look.items then
			for i, v in look.items do
				if v.itemType == itemTypeEnum.Bundle then
					t[tostring(v.id)] = bundleInfoModule.fromAvatarPreviewItem(v)
				end
			end
		end
		return cryoModule.Dictionary.join(p4, t)
	end else nil,
	[setBundlesModule.name] = function(p6, p7) --[[ line: 80 ]]
		-- upvalues: fFlagAXEnableFavoritesInfoForAssetsAndBundlesModule (ref), cryoModule (ref), bundleInfoModule (ref)
		local t_1
		local t = {}
		
		for i, v in ipairs(p7.bundles) do
			assert(v.bundleId ~= nil, "Expected a bundle id when setting a bundle's information.")
			local bundleId = p6[v.bundleId] or {}
			
			if fFlagAXEnableFavoritesInfoForAssetsAndBundlesModule and v.assetsInBundle then
				t_1 = {}
				
				for i_1, v_1 in v.assetsInBundle do
					for i_2, v_2 in bundleId.assetsInBundle or {} do
						if v_2.id == v_1.id then
							table.insert(t_1, cryoModule.Dictionary.join(v_2, v_1))
							continue
						end
					end
				end
				v.assetsInBundle = t_1
			end
			t[v.bundleId] = cryoModule.Dictionary.join(bundleId, v)
			
			if t[v.bundleId] then
				t[v.bundleId] = bundleInfoModule.getSaleDetailsForCollectibles(t[v.bundleId])
			end
		end
		return cryoModule.Dictionary.join(p6, t)
	end
})