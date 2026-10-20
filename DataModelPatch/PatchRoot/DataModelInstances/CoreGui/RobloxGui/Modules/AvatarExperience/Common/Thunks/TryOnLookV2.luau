local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LocalizationService = game:GetService("LocalizationService")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local ModelsUtilsModule = require(Modules.AvatarExperience.Common.Models.ModelsUtils)
local AvatarWidgetBlockyUtilsModule = require(Modules.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils)
local AddLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.AddLookDetails)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local SetLookDetailsPeekViewSelectedTabFunction = AvatarExperienceRoduxModule.Actions.SetLookDetailsPeekViewSelectedTab
local TryOnLooksOutfitFunction = AvatarExperienceRoduxModule.Actions.TryOnLooksOutfit
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local ClearTryOnsFunction = AvatarExperienceRoduxModule.Actions.ClearTryOns
local SetFullViewModule = require(Modules.AvatarExperience.Common.Actions.SetFullView)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local FetchAssetOrBundleInfoBatchedModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfoBatched)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local GetFFlagEnableLookFavoritingModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableLookFavoriting)
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local FFlagEnableLookDetailsDeepLinkModule = require(Modules.LuaApp.Flags.FFlagEnableLookDetailsDeepLink)
local GetFFlagAXFixDeepLinkRelatedIssuesModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixDeepLinkRelatedIssues)
local RemoveTryOnLookV2MutedError = game:DefineFastFlag("RemoveTryOnLookV2MutedError", false)
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagParseHeadShapeFromAPIResponse = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchLookDetailInfoKey .. Text
end

local function translateString(p1, p2)
	-- upvalues: LocalizationService (copy), Localization (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	
	return NewLocalization:Format(p1, p2)
end

local function handleErrorCases(p1, p2, LookId, p3)
	-- upvalues: RemoveTryOnLookV2MutedError (copy), MutedErrorModule (copy), ClearTryOnsFunction (copy), NavigateWithLockFunction (copy), NavigationUtilsModule (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	if not RemoveTryOnLookV2MutedError then
		MutedErrorModule(tostring(p3) .. tostring(LookId))
	end
	p1:dispatch(ClearTryOnsFunction())
	
	if p2 ~= nil then
		p1:dispatch(NavigateWithLockFunction(function()
			-- upvalues: NavigationUtilsModule (upval), p2 (copy)
			NavigationUtilsModule.closeTryOnManager(p2)
		end))
	end
	p1:dispatch(SetCurrentToastMessageModule({
		isLocalized = false,
		toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
		toastType = ToastTypeModule.NetworkingError
	}))
end

local function processAssetItem(p1)
	-- upvalues: WidgetConstants (copy), UtilsModule (copy)
	assert(p1.id ~= nil and p1.assetType ~= nil, "Asset is missing required fields")
	
	return {
		itemId = p1.id,
		itemType = WidgetConstants.ContentType.Asset,
		itemSubType = tostring(p1.assetType),
		tryOnItemOrder = p1.tryOnItemOrder,
		isNotSelectable = not UtilsModule.isItemSelectable(p1),
		order = if p1.meta then p1.meta.order else nil
	}
end

local function processAssetItemInBundle(p1)
	-- upvalues: WidgetConstants (copy), FFlagParseHeadShapeFromAPIResponse (copy)
	assert(p1.id ~= nil and p1.assetType ~= nil, "Asset is missing required fields")
	
	return {
		itemId = tostring(p1.id),
		itemType = WidgetConstants.ContentType.Asset,
		itemSubType = tostring(p1.assetType),
		tryOnItemOrder = p1.tryOnItemOrder,
		headShape = if FFlagParseHeadShapeFromAPIResponse and p1.meta then p1.meta.headShape else nil
	}
end

local function processBundleItem(p1)
	-- upvalues: processAssetItemInBundle (copy), WidgetConstants (copy), UtilsModule (copy)
	assert(p1.id ~= nil and p1.bundleType ~= nil, "Bundle is missing required fields")
	local Count = 0
	local Items = {}
	
	for TryOnItemOrder, value in p1.assetsInBundle do
		if value.isIncluded then
			value.tryOnItemOrder = TryOnItemOrder
			Count += 1
			table.insert(Items, (processAssetItemInBundle(value)))
		end
	end
	return {
		itemId = p1.id,
		itemType = WidgetConstants.ContentType.Bundle,
		itemSubType = tostring(p1.bundleType),
		items = Items,
		numberOfAssetsIncluded = if Count > 0 then Count else nil,
		tryOnItemOrder = p1.tryOnItemOrder,
		isNotSelectable = not UtilsModule.isItemSelectable(p1)
	}
end

local GetLookDetailsV2 = nil
GetLookDetailsV2 = if GetFFlagEnableLookFavoritingModule() then function(p2, p3)
	-- upvalues: WebApiModule (copy), PromiseModule (copy)
	local list = {
		WebApiModule.GetLookDetailsV2(p2, p3),
		(WebApiModule.HasFavoritedLook(p2, p3))
	}
	
	return PromiseModule.allSettled(list):andThen(function(Entry)
		-- upvalues: PromiseModule (upval), list (copy), p3 (copy)
		if Entry[1] ~= PromiseModule.Status.Resolved then
			return PromiseModule.reject("Failed to fetch look details")
		end
		local v1 = list[1]:expect()
		local IsFavorited = false
		
		if Entry[2] == PromiseModule.Status.Resolved then
			IsFavorited = list[2]:expect().responseBody.isFavorited
		else
			warn("HasFavoritedLook API call failed for lookId:", p3)
		end
		if v1.responseBody.look then
			v1.responseBody.look.isFavorited = IsFavorited
		end
		return v1
	end)
end else WebApiModule.GetLookDetailsV2

return function(p2, p3, AnalyticsInfo, LookId, Full, p4, p5)
	-- upvalues: GetFFlagAXFixDeepLinkRelatedIssuesModule (copy), SetFullViewModule (copy), AvatarScreen (copy), FullView (copy), SetLookDetailsPeekViewSelectedTabFunction (copy), PerformFetch (copy), CatalogConstantsModule (copy), GetLookDetailsV2 (ref), FFlagAXCatalogMakeupSupport (copy), ConstantsModule (copy), ModelsUtilsModule (copy), WidgetConstants (copy), AvatarWidgetBlockyUtilsModule (copy), translateString (copy), FFlagAXMISEnableMultiShopping (copy), FetchAssetOrBundleInfoBatchedModule (copy), AddLookDetailsModule (copy), GetFFlagEnableLookFavoritingModule (copy), PromiseModule (copy), processAssetItem (copy), processBundleItem (copy), FFlagEnableLookDetailsDeepLinkModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), UtilsModule (copy), UtilsModule1 (copy), TryOnLooksOutfitFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), NavigationUtilsModule (copy), NavigateWithLockFunction (copy), Logging (copy), handleErrorCases (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy)
	return function(p6)
		-- upvalues: GetFFlagAXFixDeepLinkRelatedIssuesModule (upval), SetFullViewModule (upval), AvatarScreen (upval), FullView (upval), p4 (copy), SetLookDetailsPeekViewSelectedTabFunction (upval), PerformFetch (upval), LookId (copy), CatalogConstantsModule (upval), GetLookDetailsV2 (upval), p2 (copy), FFlagAXCatalogMakeupSupport (upval), ConstantsModule (upval), ModelsUtilsModule (upval), WidgetConstants (upval), AvatarWidgetBlockyUtilsModule (upval), translateString (upval), FFlagAXMISEnableMultiShopping (upval), FetchAssetOrBundleInfoBatchedModule (upval), AnalyticsInfo (copy), AddLookDetailsModule (upval), GetFFlagEnableLookFavoritingModule (upval), p5 (copy), PromiseModule (upval), processAssetItem (upval), processBundleItem (upval), FFlagEnableLookDetailsDeepLinkModule (upval), Full (copy), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), UtilsModule (upval), UtilsModule1 (upval), TryOnLooksOutfitFunction (upval), p3 (copy), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), NavigationUtilsModule (upval), NavigateWithLockFunction (upval), Logging (upval), handleErrorCases (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		if GetFFlagAXFixDeepLinkRelatedIssuesModule() then
			p6:dispatch(SetFullViewModule(AvatarScreen.Catalog, FullView.None))
		end
		if p4 then
			p6:dispatch(SetLookDetailsPeekViewSelectedTabFunction(p4))
		end
		return PerformFetch.Single(CatalogConstantsModule.FetchLookDetailInfoKey .. LookId, function(p7)
			-- upvalues: GetLookDetailsV2 (upval), p2 (upval), LookId (upval), FFlagAXCatalogMakeupSupport (upval), ConstantsModule (upval), ModelsUtilsModule (upval), WidgetConstants (upval), AvatarWidgetBlockyUtilsModule (upval), translateString (upval), FFlagAXMISEnableMultiShopping (upval), FetchAssetOrBundleInfoBatchedModule (upval), AnalyticsInfo (upval), AddLookDetailsModule (upval), GetFFlagEnableLookFavoritingModule (upval), p5 (upval), PromiseModule (upval), processAssetItem (upval), processBundleItem (upval), FFlagEnableLookDetailsDeepLinkModule (upval), Full (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), UtilsModule (upval), UtilsModule1 (upval), TryOnLooksOutfitFunction (upval), p3 (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreen (upval), NavigationUtilsModule (upval), NavigateWithLockFunction (upval), Logging (upval), GetFFlagAXFixDeepLinkRelatedIssuesModule (upval), handleErrorCases (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
			return GetLookDetailsV2(p2, LookId):andThen(function(Result)
				-- upvalues: FFlagAXCatalogMakeupSupport (upval), ConstantsModule (upval), ModelsUtilsModule (upval), WidgetConstants (upval), AvatarWidgetBlockyUtilsModule (upval), translateString (upval), FFlagAXMISEnableMultiShopping (upval), p7 (copy), FetchAssetOrBundleInfoBatchedModule (upval), p2 (upval), AnalyticsInfo (upval), AddLookDetailsModule (upval), LookId (upval), GetFFlagEnableLookFavoritingModule (upval), p5 (upval), PromiseModule (upval), processAssetItem (upval), processBundleItem (upval), FFlagEnableLookDetailsDeepLinkModule (upval), Full (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), UtilsModule (upval), UtilsModule1 (upval), TryOnLooksOutfitFunction (upval), p3 (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), AvatarScreen (upval), NavigationUtilsModule (upval), NavigateWithLockFunction (upval), Logging (upval), GetFFlagAXFixDeepLinkRelatedIssuesModule (upval), handleErrorCases (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
				local Look = Result.responseBody.look
				local Discounts = nil
				
				if Look then
					local IsLookTypeMatch = if FFlagAXCatalogMakeupSupport then Look.lookType == ConstantsModule.LookType.Makeup else nil
					local List = {}
					local List1 = {}
					
					for TryOnItemOrder, item in Look.items do
						item.id = tostring(item.id)
						local _, RestrictionInfo2 = ModelsUtilsModule.CreateRestrictionInfo(item.itemRestrictions)
						item.itemRestrictionsMap = RestrictionInfo2
						item.tryOnItemOrder = TryOnItemOrder
						
						if item.itemType == WidgetConstants.ContentType.Asset then
							if item.timedOptions then
								table.insert(item.timedOptions, { days = 0, selected = true, price = item.priceInRobux })
							end
							table.insert(List, item)
						elseif item.itemType == WidgetConstants.ContentType.Bundle then
							table.insert(List1, item)
						else
							warn("TryOnLookV2 - Unknown item type: " .. item.itemType)
						end
						if item.discountInformation and Discounts == nil then
							Discounts = item.discountInformation.discounts
						end
					end
					local BlockyLookDetailItem = if FFlagAXCatalogMakeupSupport and IsLookTypeMatch then nil else AvatarWidgetBlockyUtilsModule.buildBlockyLookDetailItem(List1, translateString)
					
					if BlockyLookDetailItem then
						table.insert(List1, BlockyLookDetailItem)
						AvatarWidgetBlockyUtilsModule.adjustTryOnItemOrderForBlockyBundle(List, List1, Look.items)
					end
					if FFlagAXMISEnableMultiShopping then
						local Copy = table.clone(Look.items)
						
						if BlockyLookDetailItem then
							table.insert(Copy, BlockyLookDetailItem)
						end
						p7:dispatch(FetchAssetOrBundleInfoBatchedModule(p2, AnalyticsInfo, Copy))
					end
					p7:dispatch(AddLookDetailsModule(LookId, Look.totalPrice, nil, List, List1, Look.lookType, Look.totalValue, Look.curator, Look.description, Look.moderationStatus, Look.name, Look.displayProperties, if GetFFlagEnableLookFavoritingModule() then Look.favoriteCount else nil, if GetFFlagEnableLookFavoritingModule() then Look.isFavorited else nil, Discounts))
					
					if p5 then
						return PromiseModule.resolve()
					end
					local AssetItemIdTypeAndSubtype = {}
					
					for _, value1 in List do
						table.insert(AssetItemIdTypeAndSubtype, (processAssetItem(value1)))
					end
					local BundleItemIdTypeAndSubtype = {}
					
					for _, value2 in List1 do
						table.insert(BundleItemIdTypeAndSubtype, (processBundleItem(value2)))
					end
					if FFlagEnableLookDetailsDeepLinkModule then
						if FFlagAXMISEnableMultiShopping then
							if Full then
								p7:dispatch(SetTryOnManagerPeekViewStateFunction(Full))
							end
						else
							p7:dispatch(SetTryOnManagerPeekViewStateFunction(if Full then Full else PeekViewState.SuperBrief))
						end
					else
						p7:dispatch(SetTryOnManagerPeekViewStateFunction(PeekViewState.SuperBrief))
					end
					local ConvertBodyColor3HexesToColor3sResult = if FFlagAXCatalogMakeupSupport and IsLookTypeMatch then nil elseif Look.avatarProperties then UtilsModule.convertBodyColor3HexesToColor3s(Look.avatarProperties.bodyColor3s) else nil
					local BodyPartColorRangeIds = nil
					
					if ConvertBodyColor3HexesToColor3sResult then
						BodyPartColorRangeIds = {}
						local DefaultBodyColorRanges = p7:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges
						
						for i, value in ConvertBodyColor3HexesToColor3sResult do
							local _
							BodyPartColorRangeIds[i], _ = UtilsModule1.findRangeAndSliderValueForColor3(value, DefaultBodyColorRanges)
						end
					end
					local Scale = nil
					
					if (not FFlagAXCatalogMakeupSupport or not IsLookTypeMatch) and Look.avatarProperties then
						Scale = Look.avatarProperties.scale
					end
					p7:dispatch(TryOnLooksOutfitFunction({
						assetItemIdTypeAndSubtype = AssetItemIdTypeAndSubtype,
						bundleItemIdTypeAndSubtype = BundleItemIdTypeAndSubtype,
						lookId = LookId,
						analyticsInfo = AnalyticsInfo,
						lookType = Look.lookType,
						bodyColor3s = ConvertBodyColor3HexesToColor3sResult,
						bodyPartColorRangeIds = BodyPartColorRangeIds,
						scale = Scale
					}))
					
					if p3 ~= nil then
						if FFlagAXMISEnableMultiShopping then
							local State = p7:getState()
							local RouteName = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false).routeName elseif FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(State).routeName else State.Navigation.currentRoute.routeName
							
							if RouteName == AvatarScreen.Checkout then
								NavigationUtilsModule.closeFocusedScreen(p3)
							elseif RouteName == AvatarScreen.MySharedAvatars or Full == PeekViewState.Full then
								p7:dispatch(NavigateWithLockFunction(function()
									-- upvalues: NavigationUtilsModule (upval), p3 (upval), AvatarScreen (upval)
									NavigationUtilsModule.closeFiltersAndItemDetails(p3)
									NavigationUtilsModule.closeTryOnManager(p3, { AvatarScreen.TryOnManager })
									p3.navigate(AvatarScreen.LookDetails)
								end))
							end
						else
							p7:dispatch(NavigateWithLockFunction(function()
								-- upvalues: NavigationUtilsModule (upval), p3 (upval), AvatarScreen (upval)
								NavigationUtilsModule.closeFiltersAndItemDetails(p3)
								NavigationUtilsModule.closeTryOnManager(p3, { AvatarScreen.TryOnManager })
								p3.navigate(AvatarScreen.LookDetails)
							end))
						end
					end
					return PromiseModule.resolve()
				else
					Logging.warn("Unexpectedly received an empty response from Look Details V2")
					
					if GetFFlagAXFixDeepLinkRelatedIssuesModule() then
						handleErrorCases(p7, p3, LookId, "Unexpectedly received an empty response from Look Details V2")
						
						return
					else
						p7:dispatch(SetCurrentToastMessageModule({
							isLocalized = false,
							toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
							toastType = ToastTypeModule.NetworkingError
						}))
					end
				end
			end):catch(function(Err)
				-- upvalues: Logging (upval), GetFFlagAXFixDeepLinkRelatedIssuesModule (upval), handleErrorCases (upval), p7 (copy), p3 (upval), LookId (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), PromiseModule (upval)
				Logging.warn("Failed to fetch Look Details V2")
				
				if GetFFlagAXFixDeepLinkRelatedIssuesModule() then
					handleErrorCases(p7, p3, LookId, "Failed to fetch Look Details V2 with lookId: ")
				else
					p7:dispatch(SetCurrentToastMessageModule({
						isLocalized = false,
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
						toastType = ToastTypeModule.NetworkingError
					}))
				end
				return PromiseModule.reject(Err)
			end)
		end)(p6)
	end
end