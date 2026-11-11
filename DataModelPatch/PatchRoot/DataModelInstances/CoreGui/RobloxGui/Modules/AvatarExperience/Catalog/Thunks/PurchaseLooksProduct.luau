local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAssetOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetAssetOwned)
local SetBundleOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetBundleOwned)
local UpdateLookDetailsAfterSuccessfulPurchaseModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local SendUnifiedEventForDeferredActionFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventForDeferredAction
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local AXAnalyticsInfoCheck = game:DefineFastFlag("AXAnalyticsInfoCheck", false)
local AXUnifiedSubsetOfLook = game:DefineFastFlag("AXUnifiedSubsetOfLook", false)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagAXAvatarSortInDiscoveryUnifiedPurchase = SharedFlagsModule.FFlagAXAvatarSortInDiscoveryUnifiedPurchase
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local IsEconomicRestrictionResponseFunction = require(CorePackages.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse
local config = { HttpError = Enum.HttpError.OK }

local function _(p1, p2)
	-- upvalues: ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2:getState().LocalUserId
	ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p2:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
	end
end

local function v35(p1, AssetPurchaseStatus, Callback, SuccessCount: number, FailureCount: number, List)
	for i, value in AssetPurchaseStatus do
		if value == "Success" or value == "AlreadyOwned" then
			SuccessCount += 1
			p1:dispatch(Callback(i, true))
			
			if value == "Success" then
				table.insert(List, (tonumber(i)))
			end
		else
			FailureCount += 1
		end
	end
	return SuccessCount, FailureCount, List
end

local _ = function(p2): boolean
	local LocalUserId = p2.LocalUserId
	
	return (if p2.Users[LocalUserId] then p2.Users[LocalUserId].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium
end

local _ = function(p2, p3)
	local Look = p2:getState().AvatarExperience.AvatarScene.Looks[p3]
	
	return if Look then Look.lookType else nil
end

local function getPurchaseInfoForLookId(p2, p3)
	-- upvalues: ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy)
	local State = p2:getState()
	local ItemIds = {}
	local ItemIds1 = {}
	local List = {}
	local List1 = {}
	local Total = 0
	local LocalUserId = State.LocalUserId
	local IsPremiumMatch = (if State.Users[LocalUserId] then State.Users[LocalUserId].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium
	local TryOnItems = State.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	local Look = State.AvatarExperience.AvatarScene.Looks[p3]
	
	if TryOnItems == nil or Look == nil then
		return Total, ItemIds, List
	end
	local LookAssetInfo1 = nil
	local PriceInRobux = nil
	for _, tryOnItem in TryOnItems do
		local LookAssetInfo = Look.lookAssetInfos[tostring(tryOnItem.itemId)]
		local LookBundleInfo = Look.lookBundleInfos[tostring(tryOnItem.itemId)]
		assert(LookAssetInfo or LookBundleInfo, "itemInfo should not be nil")
		LookAssetInfo1 = LookAssetInfo or LookBundleInfo
		
		if tryOnItem.itemId ~= tostring(ConstantsModule.BlockyBundleId) then
			if tryOnItem.selectedInTryOnManager and LookAssetInfo1.isPurchasable and LookAssetInfo1.quantityOwned <= 0 then
				local Look1 = p2:getState().AvatarExperience.AvatarScene.Looks[p3]
				repeat
					if (if Look1 then Look1.lookType else nil) ~= ConstantsModule.LookType.Avatar then
						if FFlagAXCatalogMakeupSupport then
							local Look11 = p2:getState().AvatarExperience.AvatarScene.Looks[p3]
							
							if (if Look11 then Look11.lookType else nil) == ConstantsModule.LookType.Makeup then
								PriceInRobux = LookAssetInfo1.priceInRobux
								break
							end
						end
						PriceInRobux = if IsPremiumMatch then LookAssetInfo.premiumPriceInRobux else LookAssetInfo.priceInRobux
					end
				until true
				if tryOnItem.selectedTimedOptionIndex and LookAssetInfo1.timedOptions then
					local TimedOption = LookAssetInfo1.timedOptions[tryOnItem.selectedTimedOptionIndex]
					
					if TimedOption and TimedOption.days then
						table.insert(List1, {
							itemType = tryOnItem.itemType,
							itemId = tryOnItem.itemId,
							days = TimedOption.days
						})
						PriceInRobux = TimedOption.price
					end
				end
				Total += PriceInRobux
				table.insert(List, (tonumber(tryOnItem.itemId)))
			elseif tryOnItem.itemType == ConstantsModule.ItemType.Bundle then
				table.insert(ItemIds1, tryOnItem.itemId)
			elseif tryOnItem.itemType == ConstantsModule.ItemType.Asset then
				table.insert(ItemIds, tryOnItem.itemId)
			end
		end
	end
	return Total, ItemIds, ItemIds1, List, List1
end

local _ = function(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.PurchaseProductKey .. Text
end

return function(p4, Text, TotalRobux, p5)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), getPurchaseInfoForLookId (copy), HttpService (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), ConstantsModule (copy), CryoModule (copy), WidgetConstants (copy), FFlagAXCatalogMakeupSupport (copy), WebApiModule (copy), IsEconomicRestrictionResponseFunction (copy), PromiseModule (copy), v35 (copy), SetAssetOwnedModule (copy), SetBundleOwnedModule (copy), ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy), CatalogUtilsModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreenProperties (copy), AXUnifiedSubsetOfLook (copy), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (copy), AXAnalyticsInfoCheck (copy), SendUnifiedEventForDeferredActionFunction (copy), UnifiedEventLogEnums (copy), CartIdService (copy), UnifiedSelectionListStore (copy), FFlagAXFixPurchaseSurfaceLogging (copy), ItemTypeEnum (copy), UpdateLookDetailsAfterSuccessfulPurchaseModule (copy), config (copy)
	return PerformFetch.Single(CatalogConstantsModule.PurchaseProductKey .. Text, function(p6)
		-- upvalues: getPurchaseInfoForLookId (upval), Text (copy), HttpService (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), ConstantsModule (upval), CryoModule (upval), TotalRobux (copy), p5 (copy), WidgetConstants (upval), FFlagAXCatalogMakeupSupport (upval), WebApiModule (upval), p4 (copy), IsEconomicRestrictionResponseFunction (upval), PromiseModule (upval), v35 (upval), SetAssetOwnedModule (upval), SetBundleOwnedModule (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), CatalogUtilsModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreenProperties (upval), AXUnifiedSubsetOfLook (upval), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (upval), AXAnalyticsInfoCheck (upval), SendUnifiedEventForDeferredActionFunction (upval), UnifiedEventLogEnums (upval), CartIdService (upval), UnifiedSelectionListStore (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ItemTypeEnum (upval), UpdateLookDetailsAfterSuccessfulPurchaseModule (upval), config (upval)
		local _, PurchaseInfoForLookId2, PurchaseInfoForLookId3, PurchaseInfoForLookId4, PurchaseInfoForLookId5 = getPurchaseInfoForLookId(p6, Text)
		local Guid = HttpService:GenerateGUID(false)
		local JoinResult = nil
		local HydratedWidgetData = p6:getState().AvatarExperience.Common.Widgets.HydratedWidgetData
		local MakeupLookAnalyticsInfo = if FFlagAXMISEnableMultiShoppingUnifiedEvents and p6:getState().AvatarExperience.AvatarScene.Looks[Text].lookType == ConstantsModule.LookType.Makeup then p6:getState().AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo else p6:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
		JoinResult = if MakeupLookAnalyticsInfo then CryoModule.Dictionary.join(MakeupLookAnalyticsInfo, {
			totalRobux = TotalRobux,
			assetIds = PurchaseInfoForLookId4,
			lookType = if HydratedWidgetData and HydratedWidgetData[ConstantsModule.ItemType.Look] and HydratedWidgetData[ConstantsModule.ItemType.Look][Text] then HydratedWidgetData[ConstantsModule.ItemType.Look][Text].lookType else nil
		}) else nil
		
		if JoinResult and #PurchaseInfoForLookId4 > 0 then
			p5.widgetInteractionV2(JoinResult, WidgetConstants.ActionType.PURCHASE_ATTEMPT)
		end
		local Look = p6:getState().AvatarExperience.AvatarScene.Looks[Text]
		local PurchaseLookV2Result = nil
		repeat
			if (if Look then Look.lookType else nil) ~= ConstantsModule.LookType.Avatar then
				if FFlagAXCatalogMakeupSupport then
					local Look1 = p6:getState().AvatarExperience.AvatarScene.Looks[Text]
					
					if (if Look1 then Look1.lookType else nil) == ConstantsModule.LookType.Makeup then
						PurchaseLookV2Result = WebApiModule.PurchaseLookV2(p4, Text, Guid, TotalRobux, 0, PurchaseInfoForLookId2, PurchaseInfoForLookId3, if #PurchaseInfoForLookId5 > 0 then PurchaseInfoForLookId5 else nil)
						break
					end
				end
				PurchaseLookV2Result = WebApiModule.PurchaseLook(p4, Text, Guid, TotalRobux, 0, PurchaseInfoForLookId2)
			end
		until true
		return PurchaseLookV2Result:andThen(function(Result)
			-- upvalues: IsEconomicRestrictionResponseFunction (upval), PromiseModule (upval), p6 (copy), Text (upval), ConstantsModule (upval), FFlagAXCatalogMakeupSupport (upval), v35 (upval), SetAssetOwnedModule (upval), SetBundleOwnedModule (upval), p4 (upval), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), JoinResult (ref), CatalogUtilsModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreenProperties (upval), AXUnifiedSubsetOfLook (upval), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (upval), AXAnalyticsInfoCheck (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), CartIdService (upval), TotalRobux (upval), UnifiedSelectionListStore (upval), p5 (upval), WidgetConstants (upval), FFlagAXFixPurchaseSurfaceLogging (upval), ItemTypeEnum (upval), WebApiModule (upval), UpdateLookDetailsAfterSuccessfulPurchaseModule (upval), config (upval)
			local ResponseBody = Result.responseBody
			local IsSuccess: boolean = ResponseBody.purchaseLookStatus == "Success" or ResponseBody.purchaseLookStatus == "PartialSuccess"
			
			if IsEconomicRestrictionResponseFunction(ResponseBody) then
				return PromiseModule.reject(ResponseBody)
			end
			if not IsSuccess or type(ResponseBody) ~= "table" then
				return PromiseModule.reject(config)
			end
			local SuccessCount = 0
			local FailureCount = 0
			local List = {}
			local List1 = {}
			local Look = p6:getState().AvatarExperience.AvatarScene.Looks[Text]
			repeat
				if (if Look then Look.lookType else nil) ~= ConstantsModule.LookType.Avatar then
					if not FFlagAXCatalogMakeupSupport then
						for i, value in ResponseBody.itemPurchaseStatus do
							if value == "Success" or value == "AlreadyOwned" then
								SuccessCount += 1
								p6:dispatch(SetAssetOwnedModule(i, true))
								
								if value == "Success" then
									table.insert(List, (tonumber(i)))
								end
							else
								FailureCount += 1
							end
						end
						break
					else
						local Look1 = p6:getState().AvatarExperience.AvatarScene.Looks[Text]
						
						if (if Look1 then Look1.lookType else nil) ~= ConstantsModule.LookType.Makeup then
						end
					end
				end
				local v1, v2
				v1, v2, List = v35(p6, ResponseBody.assetPurchaseStatus, SetAssetOwnedModule, SuccessCount, FailureCount, List)
				SuccessCount, FailureCount, List1 = v35(p6, ResponseBody.bundlePurchaseStatus, SetBundleOwnedModule, v1, v2, List1)
			until true
			local v3 = p4
			local LocalUserId = p6:getState().LocalUserId
			ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
			
			if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
				p6:dispatch(ApiFetchEconomyCurrencyModule(v3, LocalUserId, true))
			end
			local Query = nil
			local v4 = nil
			local v5 = nil
			local v6 = nil
			local v7 = nil
			local State = p6:getState()
			
			if JoinResult then
				Query = JoinResult.query
			else
				Query, v4, v5, v6, v90 = CatalogUtilsModule.getAvatarsTabAnalyticsInfo(State)
			end
			pcall(function()
				-- upvalues: FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), p6 (upval), AvatarScreenProperties (upval), AXUnifiedSubsetOfLook (upval), JoinResult (upval), List (ref), List1 (ref), FFlagAXAvatarSortInDiscoveryUnifiedPurchase (upval), AXAnalyticsInfoCheck (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), UnifiedEventLogEnums (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), CartIdService (upval), Text (upval), Query (ref), TotalRobux (upval)
				local Name = nil
				
				if FFlagSignalsNavP3gAvatarExperience then
					local CurrentRoute = GetLegacyNavigationStoreFunction(false).getCurrentRoute(false)
					
					if CurrentRoute and CurrentRoute.params and CurrentRoute.params.fromAvatarRoute then
						Name = CurrentRoute.params.fromAvatarRoute.opaque.name
					elseif CurrentRoute and CurrentRoute.params and CurrentRoute.params.extraProps then
						Name = CurrentRoute.params.extraProps.routeName
					end
				elseif FFlagUseNavigationSelectors then
					local SelectCurrentRoactNavigationRouteResult = Selectors.selectCurrentRoactNavigationRoute(p6:getState())
					
					if SelectCurrentRoactNavigationRouteResult.params and SelectCurrentRoactNavigationRouteResult.params.fromAvatarRoute then
						Name = SelectCurrentRoactNavigationRouteResult.params.fromAvatarRoute.opaque.name
					elseif SelectCurrentRoactNavigationRouteResult.params and SelectCurrentRoactNavigationRouteResult.params.extraProps then
						Name = SelectCurrentRoactNavigationRouteResult.params.extraProps.routeName
					end
				else
					local CurrentRoute = p6:getState().Navigation and p6:getState().Navigation.currentRoute
					
					if CurrentRoute and CurrentRoute.params and CurrentRoute.params.fromAvatarRoute then
						Name = CurrentRoute.params.fromAvatarRoute.opaque.name
					elseif CurrentRoute.params and CurrentRoute.params.extraProps then
						Name = CurrentRoute.params.extraProps.routeName
					end
				end
				local AvatarScreenProperty = AvatarScreenProperties[Name]
				local NoJoinResult = if AXUnifiedSubsetOfLook then JoinResult == nil else nil
				local Joined: string? = nil
				local Joined1: string? = nil
				
				if AXUnifiedSubsetOfLook and #List > 0 then
					Joined = table.concat(List, ",")
				end
				if AXUnifiedSubsetOfLook and #List1 > 0 then
					Joined1 = table.concat(List1, ",")
				end
				local Surface = nil
				if FFlagAXAvatarSortInDiscoveryUnifiedPurchase then
					Surface = if AXAnalyticsInfoCheck then if JoinResult then JoinResult.surface else nil else JoinResult.surface
					
					if not Surface and AvatarScreenProperty and AvatarScreenProperty.analyticsData then
						Surface = AvatarScreenProperty.analyticsData.unifiedLoggingSurface
					end
				else
					Surface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
				end
				SendUnifiedEventForDeferredActionFunction(CryoModule.Dictionary.join(p6:getState().AvatarExperience.AnalyticsMetadata, {
					action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
					cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
					itemId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then Text else nil,
					itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
					keyword = Query,
					surface = Surface,
					organicAssetIds = if AXUnifiedSubsetOfLook and NoJoinResult then Joined else nil,
					organicBundleIds = if AXUnifiedSubsetOfLook and NoJoinResult then Joined1 else nil,
					organicItemPrice = if AXUnifiedSubsetOfLook and NoJoinResult then TotalRobux else nil,
					assetIds = if AXUnifiedSubsetOfLook and not NoJoinResult then Joined else nil,
					bundleIds = if AXUnifiedSubsetOfLook and not NoJoinResult then Joined1 else nil,
					widgetItemPrice = if AXUnifiedSubsetOfLook and not NoJoinResult then TotalRobux else nil
				}))
			end)
			
			if FFlagAXMISEnableMultiShoppingUnifiedEvents then
				CartIdService.refreshCartId()
				UnifiedSelectionListStore.clearSelectionList()
			end
			local JoinResult1 = CryoModule.Dictionary.join(ResponseBody, { successCount = SuccessCount, failureCount = FailureCount })
			
			if JoinResult then
				JoinResult = CryoModule.Dictionary.join(JoinResult, { assetIds = List })
				
				if #List > 0 or #List1 > 0 then
					p5.widgetInteractionV2(JoinResult, WidgetConstants.ActionType.PURCHASE_SUCCESS)
				end
			elseif not JoinResult then
				local Param = nil
				
				if FFlagAXFixPurchaseSurfaceLogging then
					if FFlagSignalsNavP3gAvatarExperience then
						local CurrentRoute = GetLegacyNavigationStoreFunction(false).getCurrentRoute(false)
						
						if CurrentRoute and CurrentRoute.params then
							Param = CurrentRoute.params[ConstantsModule.NavigationParams.fromSurface]
						end
					elseif FFlagUseNavigationSelectors then
						local SelectCurrentRoactNavigationRouteResult = Selectors.selectCurrentRoactNavigationRoute(p6:getState())
						
						if SelectCurrentRoactNavigationRouteResult and SelectCurrentRoactNavigationRouteResult.params then
							Param = SelectCurrentRoactNavigationRouteResult.params[ConstantsModule.NavigationParams.fromSurface]
						end
					elseif p6:getState().Navigation then
						Param = p6:getState().Navigation.getParam(ConstantsModule.NavigationParams.fromSurface)
					end
				end
				p5.avatarShopBuyItem(Text, ItemTypeEnum.Look, TotalRobux, v7, v6, Query, v4, v5, p6:getState().AvatarExperience.AnalyticsMetadata, Param)
			end
			if #List > 0 or #List1 > 0 then
				WebApiModule.GetLookDetailsV2(p4, Text):andThen(function(Result)
					-- upvalues: p6 (upval), UpdateLookDetailsAfterSuccessfulPurchaseModule (upval), Text (upval), List (ref), List1 (ref)
					local Look = Result.responseBody.look
					
					if Look then
						local Flag = true
						
						for _, item in Look.items do
							if not item.quantityOwned or item.quantityOwned == 0 then
								Flag = false
								break
							end
						end
						p6:dispatch(UpdateLookDetailsAfterSuccessfulPurchaseModule(Text, List, List1, Flag))
					end
				end)
			end
			return PromiseModule.resolve(JoinResult1)
		end, function(p7)
			-- upvalues: config (upval), PromiseModule (upval)
			if type(p7) ~= "table" or p7.HttpError == nil then
				p7 = config
			end
			return PromiseModule.reject(p7)
		end)
	end)
end