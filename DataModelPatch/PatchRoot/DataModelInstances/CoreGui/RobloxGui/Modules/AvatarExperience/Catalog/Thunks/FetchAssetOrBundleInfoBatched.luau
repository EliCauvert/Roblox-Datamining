local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchCollectibleItemDataBatchedModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleItemDataBatched)
local FetchCollectibResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances)
local FetchCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local FetchCollectibleResaleDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData)
local FetchAssetOrBundleInfoBatchedSuccessFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).State.Actions.FetchAssetOrBundleInfoBatchedSuccess
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXInventoryDurablesExpiredFilter = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesExpiredFilter

local function _(p1)
	-- upvalues: CatalogUtilsModule (copy)
	return CatalogUtilsModule.GetBatchItemDetailsKey(p1)
end

local _ = function(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false
end

local function v17(p1, p2, CollectibleItemId, HasResellers)
	-- upvalues: FetchCollectibleResellableInstancesModule (copy), FetchCollectibResellersInstancesModule (copy), CatalogConstantsModule (copy), FetchCollectibleResaleDataModule (copy), PromiseModule (copy)
	local DispatchResults = {}
	table.insert(DispatchResults, p1:dispatch(FetchCollectibleResellableInstancesModule(p2, CollectibleItemId, p1:getState().LocalUserId)))
	
	if HasResellers then
		table.insert(DispatchResults, p1:dispatch(FetchCollectibResellersInstancesModule(p2, CollectibleItemId, nil, CatalogConstantsModule.MaxResellersPerPage)))
		table.insert(DispatchResults, p1:dispatch(FetchCollectibleResaleDataModule(p2, CollectibleItemId)))
	end
	return PromiseModule.all(DispatchResults)
end

return function(p1, _, p2, p3)
	-- upvalues: PerformFetch (copy), CatalogUtilsModule (copy), WebApiModule (copy), FFlagAXInventoryDurablesExpiredFilter (copy), ConstantsModule (copy), v17 (copy), FetchAssetOrBundleInfoBatchedSuccessFunction (copy), FetchCollectibleItemDataBatchedModule (copy)
	return function(p4, _)
		-- upvalues: p2 (copy), PerformFetch (upval), CatalogUtilsModule (upval), WebApiModule (upval), p1 (copy), FFlagAXInventoryDurablesExpiredFilter (upval), p3 (copy), ConstantsModule (upval), v17 (upval), FetchAssetOrBundleInfoBatchedSuccessFunction (upval), FetchCollectibleItemDataBatchedModule (upval)
		local Ids = {}
		local List = {}
		local t = {}
		
		for _, value in p2 do
			table.insert(Ids, value.id)
			local Number: number? = tonumber(value.id)
			
			if Number then
				table.insert(List, { id = Number, itemType = value.itemType })
				t[Number] = value
			end
		end
		return PerformFetch.Single(CatalogUtilsModule.GetBatchItemDetailsKey(Ids), function(p5)
			-- upvalues: WebApiModule (upval), p1 (upval), List (copy), FFlagAXInventoryDurablesExpiredFilter (upval), t (copy), p3 (upval), ConstantsModule (upval), v17 (upval), FetchAssetOrBundleInfoBatchedSuccessFunction (upval), FetchCollectibleItemDataBatchedModule (upval)
			local t1 = {}
			
			return WebApiModule.FetchItemDetails(p1, List):andThen(function(Result)
				-- upvalues: p5 (copy), t1 (ref), FFlagAXInventoryDurablesExpiredFilter (upval), t (upval), p3 (upval), ConstantsModule (upval), v17 (upval), p1 (upval), FetchAssetOrBundleInfoBatchedSuccessFunction (upval), FetchCollectibleItemDataBatchedModule (upval)
				local State = p5:getState()
				t1 = if Result.responseBody and Result.responseBody.data then Result.responseBody.data else {}
				local HydratedBundles = {}
				local AssetsInBundle = {}
				local HydratedAssets = {}
				
				for _, value in t1 do
					if FFlagAXInventoryDurablesExpiredFilter then
						local Entry = t[value.id]
						
						if Entry then
							value.owned = Entry.quantityOwned ~= nil and Entry.quantityOwned > 0
							value.isPurchasable = Entry.isPurchasable
						end
					else
						value.owned = t[value.id].quantityOwned > 0
						value.isPurchasable = t[value.id].isPurchasable
					end
					if FFlagAXInventoryDurablesExpiredFilter and p3 then
						value.skipReceivedCatalogData = true
					end
					if FFlagAXInventoryDurablesExpiredFilter and value.assetType and type(value.assetType) == "number" then
						value.assetType = ConstantsModule.AssetTypeIdStringToName[tostring(value.assetType)]
					end
					local ItemType = value.itemType
					
					if ItemType == ConstantsModule.ItemType.Bundle then
						table.insert(HydratedBundles, value)
						
						if value.bundledItems then
							for _, bundledItem in value.bundledItems do
								local Text = tostring(bundledItem.id)
								
								if bundledItem.Type == ConstantsModule.ItemType.Asset then
									local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text]
									
									if not (if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false) then
										table.insert(AssetsInBundle, bundledItem)
									end
								end
							end
						end
					elseif ItemType == ConstantsModule.ItemType.Asset then
						table.insert(HydratedAssets, value)
					end
					local CollectibleItemId = value.collectibleItemId
					local HasResellers = value.hasResellers
					
					if CollectibleItemId then
						v17(p5, p1, CollectibleItemId, HasResellers)
					end
				end
				local CollectibleItemIds = {}
				
				for _, value1 in t1 do
					if value1.collectibleItemId then
						table.insert(CollectibleItemIds, value1.collectibleItemId)
					end
				end
				p5:dispatch(FetchAssetOrBundleInfoBatchedSuccessFunction({
					hydratedBundles = HydratedBundles,
					assetsInBundle = AssetsInBundle,
					hydratedAssets = HydratedAssets
				}))
				p5:dispatch(FetchCollectibleItemDataBatchedModule(p1, CollectibleItemIds))
			end)
		end)(p4)
	end
end