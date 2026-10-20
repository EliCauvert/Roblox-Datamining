local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SetBundleInfoFromCatalogItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction)
local SetAssetInfoFromCatalogItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromCatalogItemAction)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetAssetInfoFromBundleItemActionModule = require(Modules.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchAssetResellersModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetResellers)
local FetchCollectibleItemDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleItemData)
local FetchCollectibResellersInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibResellersInstances)
local FetchCollectibleResaleDataModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResaleData)
local FetchCollectibleResellableInstancesModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchCollectibleResellableInstances)
local AssetInfoModule = require(Modules.AvatarExperience.Common.Models.AssetInfo)
local BundleInfoModule = require(Modules.AvatarExperience.Common.Models.BundleInfo)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.LuaApp.Types.RoduxTypes)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local FFlagAXInventoryDurablesSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXInventoryDurablesSupport
local LuaAppsPageLoadTimeItemDetailsFVariable = settings():GetFVariable("LuaAppsPageLoadTimeItemDetails")

local function _(p1, p2)
	-- upvalues: CatalogUtilsModule (copy)
	return CatalogUtilsModule.GetItemDetailsKey(p1, p2)
end

local _ = function(p1, p2): boolean
	local AssetInfo = p1.AvatarExperience.Common.AssetInfos[p2]
	
	return if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false
end

local function v28(p1, p2, CollectibleItemId, HasResellers)
	-- upvalues: FetchCollectibleItemDataModule (copy), FetchCollectibleResellableInstancesModule (copy), FetchCollectibResellersInstancesModule (copy), CatalogConstantsModule (copy), FetchCollectibleResaleDataModule (copy), PromiseModule (copy)
	local DispatchResults = {
		p1:dispatch(FetchCollectibleItemDataModule(p2, CollectibleItemId))
	}
	table.insert(DispatchResults, p1:dispatch(FetchCollectibleResellableInstancesModule(p2, CollectibleItemId, p1:getState().LocalUserId)))
	
	if HasResellers then
		table.insert(DispatchResults, p1:dispatch(FetchCollectibResellersInstancesModule(p2, CollectibleItemId, nil, CatalogConstantsModule.MaxResellersPerPage)))
		table.insert(DispatchResults, p1:dispatch(FetchCollectibleResaleDataModule(p2, CollectibleItemId)))
	end
	return PromiseModule.all(DispatchResults)
end

local function processSuccessfulResult(p1, p2, Asset, p3, ResponseBody)
	-- upvalues: ConstantsModule (copy), SetBundleInfoFromCatalogItemActionModule (copy), SetAssetInfoFromBundleItemActionModule (copy), BundleInfoModule (copy), v28 (copy), SetAssetInfoFromCatalogItemActionModule (copy), AssetInfoModule (copy), CatalogUtilsModule (copy), FetchAssetResellersModule (copy), CatalogConstantsModule (copy)
	local State = p3:getState()
	
	if Asset == ConstantsModule.ItemType.Bundle then
		p3:dispatch(SetBundleInfoFromCatalogItemActionModule(p2, ResponseBody))
		local List = {}
		
		if ResponseBody.bundledItems then
			for _, bundledItem in ResponseBody.bundledItems do
				local Text = tostring(bundledItem.id)
				
				if bundledItem.Type == ConstantsModule.ItemType.Asset then
					local AssetInfo = State.AvatarExperience.Common.AssetInfos[Text]
					
					if not (if AssetInfo and AssetInfo.receivedFromBundleItemData then true else false) then
						table.insert(List, bundledItem)
					end
				end
			end
			if #List > 0 then
				p3:dispatch(SetAssetInfoFromBundleItemActionModule(List))
			end
		end
		local FromGetCatalogItemDataResult = BundleInfoModule.fromGetCatalogItemData(ResponseBody)
		local CollectibleItemId = FromGetCatalogItemDataResult.collectibleItemId
		local HasResellers = FromGetCatalogItemDataResult.hasResellers
		
		if CollectibleItemId then
			v28(p3, p1, CollectibleItemId, HasResellers)
			
			return
		end
	elseif Asset == ConstantsModule.ItemType.Asset then
		p3:dispatch(SetAssetInfoFromCatalogItemActionModule(p2, ResponseBody))
		local FromGetCatalogItemDataResult = AssetInfoModule.fromGetCatalogItemData(ResponseBody)
		local IsResellable = CatalogUtilsModule.IsResellable(FromGetCatalogItemDataResult)
		local CollectibleItemId = FromGetCatalogItemDataResult.collectibleItemId
		local HasResellers = FromGetCatalogItemDataResult.hasResellers
		
		if CollectibleItemId then
			v28(p3, p1, CollectibleItemId, HasResellers)
			
			return
		end
		if IsResellable then
			p3:dispatch(FetchAssetResellersModule(p1, p2, nil, CatalogConstantsModule.MaxResellersPerPage))
		end
	end
end

return function(p4, p5, p6, Asset, p7)
	-- upvalues: ArgCheckModule (copy), ConstantsModule (copy), PerformFetch (copy), CatalogUtilsModule (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXInventoryDurablesSupport (copy), v28 (copy), FetchAssetResellersModule (copy), CatalogConstantsModule (copy), PromiseModule (copy), WebApiModule (copy), processSuccessfulResult (copy), Logging (copy), LuaAppsPageLoadTimeItemDetailsFVariable (copy)
	ArgCheckModule.isType(p6, "string", "FetchAssetOrBundleInfo request expects itemId")
	ArgCheckModule.isType(Asset, "string", "FetchAssetOrBundleInfo request expects itemType")
	
	return function(p8, _)
		-- upvalues: Asset (copy), ConstantsModule (upval), p6 (copy), PerformFetch (upval), CatalogUtilsModule (upval), FFlagAXMISEnableMultiShopping (upval), FFlagAXInventoryDurablesSupport (upval), p7 (copy), v28 (upval), p4 (copy), FetchAssetResellersModule (upval), CatalogConstantsModule (upval), PromiseModule (upval), WebApiModule (upval), processSuccessfulResult (upval), Logging (upval), p5 (copy), LuaAppsPageLoadTimeItemDetailsFVariable (upval)
		local CurrentTime = tick()
		local State = p8:getState()
		local AssetInfo = nil
		local CollectibleItemId = nil
		
		if Asset == ConstantsModule.ItemType.Asset then
			AssetInfo = State.AvatarExperience.Common.AssetInfos[p6]
		elseif Asset == ConstantsModule.ItemType.Bundle then
			AssetInfo = State.AvatarExperience.Common.BundleInfos[p6]
		end
		CollectibleItemId = AssetInfo and AssetInfo.collectibleItemId
		
		return PerformFetch.Single(CatalogUtilsModule.GetItemDetailsKey(p6, Asset), function(p9)
			-- upvalues: AssetInfo (ref), FFlagAXMISEnableMultiShopping (upval), FFlagAXInventoryDurablesSupport (upval), p7 (upval), CollectibleItemId (ref), v28 (upval), p4 (upval), CatalogUtilsModule (upval), FetchAssetResellersModule (upval), p6 (upval), CatalogConstantsModule (upval), PromiseModule (upval), WebApiModule (upval), Asset (upval), processSuccessfulResult (upval), Logging (upval), p5 (upval), CurrentTime (copy), LuaAppsPageLoadTimeItemDetailsFVariable (upval)
			local NoP17 = if FFlagAXMISEnableMultiShopping or FFlagAXInventoryDurablesSupport then AssetInfo ~= nil and (AssetInfo.receivedCatalogData and not p7) else AssetInfo ~= nil and AssetInfo.receivedCatalogData
			
			return if NoP17 then if CollectibleItemId then v28(p9, p4, CollectibleItemId, AssetInfo.hasResellers) elseif CatalogUtilsModule.IsResellable(AssetInfo) then p9:dispatch(FetchAssetResellersModule(p4, p6, nil, CatalogConstantsModule.MaxResellersPerPage)) else PromiseModule.resolve() else WebApiModule.FetchItemDetail(p4, p6, Asset):andThen(function(Result)
				-- upvalues: processSuccessfulResult (upval), p4 (upval), p6 (upval), Asset (upval), p9 (copy)
				processSuccessfulResult(p4, p6, Asset, p9, Result.responseBody or {})
			end):catch(function(Err)
				-- upvalues: Logging (upval)
				Logging.warn("FetchAssetOrBundleInfo failure: " .. Err)
			end):finally(function()
				-- upvalues: p5 (upval), CurrentTime (upval), LuaAppsPageLoadTimeItemDetailsFVariable (upval)
				if p5 and p5.Diag then
					p5.Diag:reportStats(LuaAppsPageLoadTimeItemDetailsFVariable, (tick() - CurrentTime) * 1000)
				end
			end)
		end)(p8)
	end
end