local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local FFlagAXEnableFetchAvatarPreviewModule = require(Parent.Flags.FFlagAXEnableFetchAvatarPreview)
local BundleInfoModule = require(Parent.Models.BundleInfo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Parent.Actions.SetFavoriteBundle).name] = function(JoinResults, p1)
		-- upvalues: CryoModule (copy), BundleInfoModule (copy)
		JoinResults[p1.id] = CryoModule.Dictionary.join(CryoModule.Dictionary.join({}, JoinResults[p1.id] or {}), BundleInfoModule.fromGetFavoriteForAsset(p1.id, p1.isFavorite))
		
		return JoinResults
	end,
	[require(Parent.Actions.UpdateBulkPuchaseResults).name] = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXEnableInspectAndBuyBulkPurchase then function(JoinResults, p1)
		-- upvalues: CryoModule (copy), BundleInfoModule (copy)
		for _, item in p1.result.Items do
			if item.type == Enum.MarketplaceProductType.AvatarBundle then
				local JoinResult = CryoModule.Dictionary.join({}, JoinResults[item.id])
				JoinResults[item.id] = CryoModule.Dictionary.join(JoinResult, BundleInfoModule.fromBulkPurchaseResult(item, JoinResult))
			end
		end
		return JoinResults
	end else nil,
	[require(Parent.Actions.SetAvatarPreviewDetails).name] = if FFlagAXEnableFetchAvatarPreviewModule then function(p2, p3)
		-- upvalues: ItemTypeEnum (copy), BundleInfoModule (copy), CryoModule (copy)
		local Look = p3.avatarPreviewDetails.look
		local FromAvatarPreviewItemResults = {}
		
		if Look.items then
			for _, item in Look.items do
				if item.itemType == ItemTypeEnum.Bundle then
					FromAvatarPreviewItemResults[tostring(item.id)] = BundleInfoModule.fromAvatarPreviewItem(item)
				end
			end
		end
		return CryoModule.Dictionary.join(p2, FromAvatarPreviewItemResults)
	end else nil,
	[require(Parent.Actions.SetBundles).name] = function(p4, p5)
		-- upvalues: CryoModule (copy), BundleInfoModule (copy)
		local JoinResults = {}
		local AssetsInBundle = nil
		
		for _, bundle in ipairs(p5.bundles) do
			assert(bundle.bundleId ~= nil, "Expected a bundle id when setting a bundle's information.")
			local v1 = p4[bundle.bundleId] or {}
			
			if bundle.assetsInBundle then
				AssetsInBundle = {}
				
				for _, value in bundle.assetsInBundle do
					local AssetsInBundle1 = v1.assetsInBundle or {}
					for _, value1 in AssetsInBundle1 do
						if value1.id == value.id then
							table.insert(AssetsInBundle, (CryoModule.Dictionary.join(value1, value)))
							break
						end
					end
				end
				bundle.assetsInBundle = AssetsInBundle
			end
			JoinResults[bundle.bundleId] = CryoModule.Dictionary.join(v1, bundle)
			
			if JoinResults[bundle.bundleId] then
				JoinResults[bundle.bundleId] = BundleInfoModule.getSaleDetailsForCollectibles(JoinResults[bundle.bundleId])
			end
		end
		return CryoModule.Dictionary.join(p4, JoinResults)
	end
})