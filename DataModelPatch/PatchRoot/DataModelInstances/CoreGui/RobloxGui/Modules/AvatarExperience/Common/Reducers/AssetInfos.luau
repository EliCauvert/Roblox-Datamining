local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local AssetInfoModule = require(Modules.AvatarExperience.Common.Models.AssetInfo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local AXRecentlyViewedSearchItemsIXPTest = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXInventoryDurablesExpiredFilter = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesExpiredFilter
local FFlagAXSubscriptionRefetchClearCatalogData = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchClearCatalogData
local FFlagAXSubscriptionRefetchEvictStores = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchEvictStores

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.assetId, "string", "assetId must be a string.")
		ArgCheckModule.isType(p2.assetData, "table", "assetData must be a table.")
		local Text = tostring(p2.assetId)
		
		return CryoModule.Dictionary.join(p1, {
			[Text] = AssetInfoModule.fromGetCatalogItemData(p2.assetData, p1[Text])
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.assets, "table", "assets data must be a table.")
		local FromBundleItemDataResults = {}
		
		for _, asset in p2.assets do
			local Text = tostring(asset.id)
			FromBundleItemDataResults[Text] = AssetInfoModule.fromBundleItemData(asset, p1[Text])
		end
		return CryoModule.Dictionary.join(p1, FromBundleItemDataResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromSortResults).name] = function(p3, p4)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p4.sortResults, "table", "sortResults must be a table.")
		local FromSortResultsResults = {}
		
		for _, sortResult in p4.sortResults do
			local Text = tostring(sortResult.id)
			FromSortResultsResults[Text] = AssetInfoModule.fromSortResults(sortResult, p3[Text])
		end
		return CryoModule.Dictionary.join(p3, FromSortResultsResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults).name] = function(p5, p6)
		-- upvalues: ConstantsModule (copy), AssetInfoModule (copy), CryoModule (copy)
		local FromBundledItemsResults = {}
		
		for _, sortResult in p6.sortResults do
			if sortResult.bundledItems then
				for _, bundledItem in sortResult.bundledItems do
					if bundledItem.type == ConstantsModule.ItemType.Asset then
						local Text = tostring(bundledItem.id)
						FromBundledItemsResults[Text] = AssetInfoModule.fromBundledItems(bundledItem, p5[Text])
					end
				end
			end
		end
		return CryoModule.Dictionary.join(p5, FromBundledItemsResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction).name] = function(p7, p8)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), ConstantsModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p8.recommendedItems, "table", "recommendedItems must be a table.")
		local Text = tostring(p8.assetId)
		local FromGetRecommendedItemsDataResults = {}
		local List = {}
		
		for _, recommendedItem in p8.recommendedItems do
			local Text1 = tostring(recommendedItem.item.assetId)
			local AssetTypeId = p8.assetTypeId
			FromGetRecommendedItemsDataResults[Text1] = AssetInfoModule.fromGetRecommendedItemsData(recommendedItem, p8.assetTypeId, p7[Text1])
			table.insert(List, {
				id = Text1,
				type = ConstantsModule.ItemType.Asset,
				subType = AssetTypeId
			})
		end
		FromGetRecommendedItemsDataResults[Text] = AssetInfoModule.fromRecommendedItemSummaries(List, p7[Text])
		
		return CryoModule.Dictionary.join(p7, FromGetRecommendedItemsDataResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetResaleData).name] = function(p9, p10)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p10.assetResaleData, "table", "assetResaleData must be a table.")
		local Text = tostring(p10.assetId)
		
		return CryoModule.Dictionary.join(p9, {
			[Text] = AssetInfoModule.fromResaleData(p10.assetResaleData, p9[Text])
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch).name] = function(p9, p10)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p10.assets, "table", "assets must be a table.")
		local FromInventoryFetchResults = {}
		
		for _, asset in p10.assets do
			local Text = tostring(asset.assetId)
			FromInventoryFetchResults[Text] = AssetInfoModule.fromInventoryFetch(asset, p9[Text])
		end
		return CryoModule.Dictionary.join(p9, FromInventoryFetchResults)
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails).name] = function(p11, p12)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p12.assets, "table", "assets must be a table.")
		local FromOutfitDetailsResults = {}
		
		for _, asset in p12.assets do
			local Text = tostring(asset.id)
			FromOutfitDetailsResults[Text] = AssetInfoModule.fromOutfitDetails(asset, p11[Text], p12.outfitModerationStatus)
		end
		return CryoModule.Dictionary.join(p11, FromOutfitDetailsResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetResellersList).name] = function(p13, p14)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p14.assetId, "string", "assetId must be a sting.")
		ArgCheckModule.isType(p14.userAssetIds, "table", "userAssetIds must be a table.")
		local Text = tostring(p14.assetId)
		
		return CryoModule.Dictionary.join(p13, {
			[Text] = AssetInfoModule.fromGetResellers(p14.userAssetIds, p13[Text])
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.AppendAssetResellersList).name] = function(p13, p14)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p14.assetId, "string", "assetId must be a sting.")
		ArgCheckModule.isType(p14.userAssetIds, "table", "userAssetIds must be a table.")
		local Text = tostring(p14.assetId)
		local MockResult = if p13[Text] then p13[Text] else AssetInfoModule.mock()
		local ResellerUserAssetIds = MockResult.resellerUserAssetIds
		
		return CryoModule.Dictionary.join(p13, {
			[Text] = CryoModule.Dictionary.join(MockResult, (AssetInfoModule.fromGetResellers(if ResellerUserAssetIds then CryoModule.List.join(ResellerUserAssetIds, p14.userAssetIds) else p14.userAssetIds, MockResult)))
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetLowestPrice).name] = function(p13, p14)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p14.assetId, "string", "assetId must be a sting.")
		ArgCheckModule.isType(p14.priceInRobux, "number", "price must be a number.")
		local AssetId = p14.assetId
		
		return CryoModule.Dictionary.join(p13, {
			[AssetId] = AssetInfoModule.fromLowestPrice(p14.priceInRobux, p13[AssetId])
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromAvatarEditorRecommendedItemsV2).name] = function(p13, p14)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p14.assets, "table", "assets must be a table.")
		ArgCheckModule.isType(p14.assetTypeId, "string", "assetTypeId must be a string.")
		local AssetTypeId = p14.assetTypeId
		local FromGetRecommendedItemsDataV2Results = {}
		
		for _, asset in p14.assets do
			local Text = tostring(asset.id)
			FromGetRecommendedItemsDataV2Results[Text] = AssetInfoModule.fromGetRecommendedItemsDataV2(asset, AssetTypeId, p13[Text])
		end
		return CryoModule.Dictionary.join(p13, FromGetRecommendedItemsDataV2Results)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData).name] = function(p15, p16)
		-- upvalues: ArgCheckModule (copy), WidgetConstants (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p16.payload, "table", "payload must be a table.")
		
		if not p16.payload[WidgetConstants.ContentType.Asset] then
			return p15
		end
		local JoinResults = {}
		
		for _, value in p16.payload[WidgetConstants.ContentType.Asset] do
			local Text = tostring(value.id)
			local FromHydrateWidgetInfoResult = AssetInfoModule.fromHydrateWidgetInfo(value, p15[Text])
			JoinResults[Text] = CryoModule.Dictionary.join(FromHydrateWidgetInfoResult, FromHydrateWidgetInfoResult)
		end
		return CryoModule.Dictionary.join(p15, JoinResults)
	end,
	[require(Modules.AvatarExperience.Common.Actions.SetAssetOwned).name] = function(p17, p18)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p18.assetId, "string", "assetId must be a string.")
		ArgCheckModule.isType(p18.isOwned, "boolean", "isOwned must be a bool.")
		local Text = tostring(p18.assetId)
		
		return CryoModule.Dictionary.join(p17, {
			[Text] = AssetInfoModule.fromIsOwned(p18.isOwned, p17[Text])
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.GrantAsset).name] = function(p17, p18)
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local Text = tostring(p18.assetId)
		local FromAssetGrantResult = AssetInfoModule.fromAssetGrant(Text, (tostring(p18.assetTypeId)))
		local v1 = p17[Text]
		
		if v1 and v1.assetType then
			return p17
		end
		if v1 then
			FromAssetGrantResult = CryoModule.Dictionary.join(v1, FromAssetGrantResult)
		end
		return CryoModule.Dictionary.join(p17, { [Text] = FromAssetGrantResult })
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAssetModerationStatus).name] = function(p17, p18)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p18.assetId, "string", "assetId must be a string.")
		local Text = tostring(p18.assetId)
		local v1 = p17[Text]
		
		return CryoModule.Dictionary.join(p17, {
			[Text] = AssetInfoModule.fromModerationStatusUpdate(p18.moderationStatus, if v1 and v1.updateCounter then v1.updateCounter + 1 else 1, Text, p18.assetName, p18.universeId, v1)
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData).name] = function(p17, p18)
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local Assets = p18.avatarData.assets
		
		if Assets == nil then
			return p17
		end
		local FromReceivedAvatarDataResults = {}
		
		for _, asset in Assets do
			local Text = tostring(asset.id)
			local FromReceivedAvatarDataResult = AssetInfoModule.fromReceivedAvatarData(asset)
			local v1 = p17[Text]
			
			if v1 then
				FromReceivedAvatarDataResults[Text] = CryoModule.Dictionary.join(FromReceivedAvatarDataResult, v1)
			else
				FromReceivedAvatarDataResults[Text] = FromReceivedAvatarDataResult
			end
		end
		return CryoModule.Dictionary.join(p17, FromReceivedAvatarDataResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetAssetVersionData).name] = function(p19, p20)
		-- upvalues: ArgCheckModule (copy), AssetInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p20.assetVersionData, "table", "assetVersionData must be a table.")
		local Text = tostring(p20.assetId)
		
		return CryoModule.Dictionary.join(p19, {
			[Text] = AssetInfoModule.fromVersionData(p20.assetVersionData, p19[Text])
		})
	end,
	[require(Modules.AvatarExperience.Common.Actions.OutfitInformationReceived).name] = if require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP).isEnabled() then function(Tbl, p19)
		-- upvalues: AssetInfoModule (copy)
		local Copy = table.clone(Tbl)
		
		for _, outfit in p19.outfits do
			local AssetsToUpdate = outfit.assetsToUpdate
			local OutfitModerationStatus = outfit.outfitModerationStatus
			
			if AssetsToUpdate then
				for _, value in AssetsToUpdate do
					local Text = tostring(value.id)
					Copy[Text] = AssetInfoModule.fromOutfitDetails(value, Tbl[Text], OutfitModerationStatus)
				end
			end
		end
		return Copy
	end else nil,
	[require(Modules.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData).name] = if AXRecentlyViewedSearchItemsIXPTest.isEnabled() then function(Tbl, p20)
		-- upvalues: AssetInfoModule (copy)
		local Copy = table.clone(Tbl)
		local AssetData = p20.assetData or {}
		for _, value in AssetData do
			local Text = tostring(value.id)
			Copy[Text] = AssetInfoModule.fromSortResults(value, Tbl[Text])
		end
		return Copy
	end else nil,
	[AvatarExperienceCatalogModule.State.Actions.PurchaseItemsSuccess.name] = if FFlagAXMISEnableMultiShopping then function(p21, p22)
		-- upvalues: CryoModule (copy)
		local P38 = p21 or {}
		local JoinResults = {}
		
		for _, item in p22.items do
			if item.itemType == Enum.AvatarItemType.Asset.Name then
				local Text = tostring(item.itemId)
				local Entry = P38[Text]
				
				if Entry then
					JoinResults[Text] = CryoModule.Dictionary.join(Entry, { isOwned = true })
				end
			end
		end
		return CryoModule.Dictionary.join(P38, JoinResults)
	end else nil,
	[AvatarExperienceCatalogModule.State.Actions.FetchAssetOrBundleInfoBatchedSuccess.name] = if FFlagAXMISEnableMultiShopping or FFlagAXInventoryDurablesExpiredFilter then function(p23, p24)
		-- upvalues: AssetInfoModule (copy), CryoModule (copy)
		local P40 = p23 or {}
		local HydratedAssets = p24.hydratedAssets
		local AssetsInBundle = p24.assetsInBundle
		
		if #HydratedAssets > 0 then
			local FromGetCatalogItemDataResults = {}
			
			for _, hydratedAsset in HydratedAssets do
				local Text = tostring(hydratedAsset.id)
				FromGetCatalogItemDataResults[Text] = AssetInfoModule.fromGetCatalogItemData(hydratedAsset, P40[Text])
			end
			P40 = CryoModule.Dictionary.join(P40, FromGetCatalogItemDataResults)
		end
		if #AssetsInBundle > 0 then
			local FromBundleItemDataResults = {}
			
			for _, value in AssetsInBundle do
				local Text = tostring(value.id)
				FromBundleItemDataResults[Text] = AssetInfoModule.fromBundleItemData(value, P40[Text])
			end
			P40 = CryoModule.Dictionary.join(P40, FromBundleItemDataResults)
		end
		return P40
	end else nil,
	[require(Modules.AvatarExperience.Common.Actions.ClearReceivedCatalogData).name] = if FFlagAXSubscriptionRefetchClearCatalogData then function(List, _)
		-- upvalues: FFlagAXSubscriptionRefetchEvictStores (copy), CryoModule (copy)
		if FFlagAXSubscriptionRefetchEvictStores then
			return if next(List) == nil then List else {}
		end
		local JoinResults = {}
		
		for i, value in List do
			if value.receivedCatalogData then
				JoinResults[i] = CryoModule.Dictionary.join(value, { receivedCatalogData = false })
			end
		end
		return if next(JoinResults) == nil then List else CryoModule.Dictionary.join(List, JoinResults)
	end else nil
})