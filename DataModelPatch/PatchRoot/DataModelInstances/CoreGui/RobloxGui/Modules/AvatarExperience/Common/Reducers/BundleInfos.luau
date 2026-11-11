local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local BundleInfoModule = require(Modules.AvatarExperience.Common.Models.BundleInfo)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXSubscriptionRefetchClearCatalogData = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchClearCatalogData
local FFlagAXSubscriptionRefetchEvictStores = AvatarExperienceFlagsModule.FFlagAXSubscriptionRefetchEvictStores

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), BundleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.bundleId, "string", "bundleId must be a string.")
		ArgCheckModule.isType(p2.bundleData, "table", "bundleData must be a table.")
		local Text = tostring(p2.bundleId)
		
		return CryoModule.Dictionary.join(p1, {
			[Text] = BundleInfoModule.fromGetCatalogItemData(p2.bundleData, p1[Text])
		})
	end,
	[require(Modules.AvatarExperience.AvatarEditor.Actions.SetBundleInfoFromAvatarEditorRecommendedItemsV2).name] = function(p1, p2)
		-- upvalues: ArgCheckModule (copy), BundleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p2.bundles, "table", "bundles must be a table.")
		local FromGetRecommendedItemsDataV2Results = {}
		
		for _, bundle in p2.bundles do
			local Text = tostring(bundle.id)
			FromGetRecommendedItemsDataV2Results[Text] = BundleInfoModule.fromGetRecommendedItemsDataV2(bundle, p1[Text])
		end
		return CryoModule.Dictionary.join(p1, FromGetRecommendedItemsDataV2Results)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetHydratedWidgetData).name] = function(p3, p4)
		-- upvalues: ArgCheckModule (copy), WidgetConstants (copy), BundleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p4.payload, "table", "payload must be a table.")
		
		if not p4.payload[WidgetConstants.ContentType.Bundle] then
			return p3
		end
		local FromHydrateWidgetInfoResults = {}
		
		for _, value in p4.payload[WidgetConstants.ContentType.Bundle] do
			local Text = tostring(value.id)
			FromHydrateWidgetInfoResults[Text] = BundleInfoModule.fromHydrateWidgetInfo(value, p3[Text])
		end
		return CryoModule.Dictionary.join(p3, FromHydrateWidgetInfoResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromSortResults).name] = function(p5, p6)
		-- upvalues: ArgCheckModule (copy), BundleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p6.sortResults, "table", "sortResults must be a table.")
		local FromSortResultsResults = {}
		
		for _, sortResult in p6.sortResults do
			local Text = tostring(sortResult.id)
			FromSortResultsResults[Text] = BundleInfoModule.fromSortResults(sortResult, p5[Text])
		end
		return CryoModule.Dictionary.join(p5, FromSortResultsResults)
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.SetRecommendedBundlesAction).name] = function(p7, p8)
		-- upvalues: ArgCheckModule (copy), BundleInfoModule (copy), ConstantsModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p8.bundleId, "string", "bundleId must be a string.")
		ArgCheckModule.isType(p8.recommendedItems, "table", "recommendedItems must be a table.")
		local Text = tostring(p8.bundleId)
		local FromGetRecommendedItemsDataV2Results = {}
		local t = {}
		
		for _, recommendedItem in p8.recommendedItems do
			local Text1 = tostring(recommendedItem.id)
			FromGetRecommendedItemsDataV2Results[Text1] = BundleInfoModule.fromGetRecommendedItemsDataV2(recommendedItem, p7[Text1])
			t[#t + 1] = {
				id = Text1,
				type = ConstantsModule.ItemType.Bundle,
				subType = tostring(recommendedItem.bundleType)
			}
		end
		FromGetRecommendedItemsDataV2Results[Text] = BundleInfoModule.fromRecommendedItemSummaries(t, p7[Text])
		
		return CryoModule.Dictionary.join(p7, FromGetRecommendedItemsDataV2Results)
	end,
	[require(Modules.AvatarExperience.Common.Actions.SetBundleOwned).name] = function(p9, p10)
		-- upvalues: ArgCheckModule (copy), BundleInfoModule (copy), CryoModule (copy)
		ArgCheckModule.isType(p10.bundleId, "string", "bundleId must be a string.")
		ArgCheckModule.isType(p10.isOwned, "boolean", "isOwned must be a bool.")
		local Text = tostring(p10.bundleId)
		
		return CryoModule.Dictionary.join(p9, {
			[Text] = BundleInfoModule.fromIsOwned(p10.isOwned, p9[Text])
		})
	end,
	[require(Modules.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData).name] = if require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Experiments.AXRecentlyViewedSearchItemsIXPTest.isEnabled() then function(Tbl, p9)
		-- upvalues: BundleInfoModule (copy)
		local Copy = table.clone(Tbl)
		local BundleData = p9.bundleData or {}
		for _, value in BundleData do
			local Text = tostring(value.id)
			Copy[Text] = BundleInfoModule.fromSortResults(value, Tbl[Text])
		end
		return Copy
	end else nil,
	[AvatarExperienceCatalogModule.State.Actions.PurchaseItemsSuccess.name] = if FFlagAXMISEnableMultiShopping then function(p10, p11)
		-- upvalues: CryoModule (copy)
		local P13 = p10 or {}
		local JoinResults = {}
		
		for _, item in p11.items do
			if item.itemType == Enum.AvatarItemType.Bundle.Name then
				local Text = tostring(item.itemId)
				local Entry = P13[Text]
				
				if Entry then
					JoinResults[Text] = CryoModule.Dictionary.join(Entry, { isOwned = true })
				end
			end
		end
		return CryoModule.Dictionary.join(P13, JoinResults)
	end else nil,
	[AvatarExperienceCatalogModule.State.Actions.FetchAssetOrBundleInfoBatchedSuccess.name] = if FFlagAXMISEnableMultiShopping then function(p12, p13)
		-- upvalues: BundleInfoModule (copy), CryoModule (copy)
		local P15 = p12 or {}
		local FromGetCatalogItemDataResults = {}
		
		for _, hydratedBundle in p13.hydratedBundles do
			local Text = tostring(hydratedBundle.id)
			FromGetCatalogItemDataResults[Text] = BundleInfoModule.fromGetCatalogItemData(hydratedBundle, P15[Text])
		end
		return CryoModule.Dictionary.join(P15, FromGetCatalogItemDataResults)
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