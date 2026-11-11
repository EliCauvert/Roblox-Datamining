local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local SetTimeoutFunction = require(CorePackages.Packages.LuauPolyfill).setTimeout
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local AXLookOutfitCreationDelayMs1 = game:DefineFastInt("AXLookOutfitCreationDelayMs1", 5000)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local SetAssetOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetAssetOwned)
local SetBundleOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetBundleOwned)
local CreateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateOutfit)
local UpdateLookDetailsAfterSuccessfulPurchaseModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase)
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local SendUnifiedEventForDeferredActionFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local AXDefaultCharacterName = game:DefineFastString("AXDefaultCharacterName", "Avatar")
local Enums = require(CorePackages.Workspace.Packages.PurchasePromptLite).Enums
local PurchaseLookStatusEnum = Enums.PurchaseLookStatusEnum
local PurchaseLookItemStatusEnum = Enums.PurchaseLookItemStatusEnum
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local WidgetConstants = AvatarExperienceCatalogModule.WidgetConstants
local AXUnifiedSubsetOfLook = game:DefineFastFlag("AXUnifiedSubsetOfLook", false)
local ItemTypeEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local WearAfterOutfitPurchaseModule = require(Modules.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local GetFFlagEnableSavePurchasedLooksWithLookNameModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local SaveAsMakeupLookThunkFunction = AvatarExperienceCatalogModule.Thunks.SaveAsMakeupLookThunk
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType = AvatarExperienceFlagsModule.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType
local FFlagAXFixPurchaseSurfaceLogging = SharedFlagsModule.FFlagAXFixPurchaseSurfaceLogging
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local AXFixBlockyBundleWearAfterPurchase = game:DefineFastFlag("AXFixBlockyBundleWearAfterPurchase", false)
local FFlagSkipCompletionModalForMarketplace = SharedFlagsModule.FFlagSkipCompletionModalForMarketplace
local ShowLooksPurchaseToastsModule = require(Modules.AvatarExperience.Catalog.showLooksPurchaseToasts)

local function _(p1, p2)
	-- upvalues: ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy)
	local LocalUserId = p2:getState().LocalUserId
	ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
	
	if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
		p2:dispatch(ApiFetchEconomyCurrencyModule(p1, LocalUserId, true))
	end
end

local config = { HttpError = Enum.HttpError.OK }

local function v50(p1, AssetPurchaseStatus, Callback, p2: number, p3: number, List)
	-- upvalues: PurchaseLookItemStatusEnum (copy)
	for i, Success in AssetPurchaseStatus do
		if Success == PurchaseLookItemStatusEnum.Success or Success == PurchaseLookItemStatusEnum.AlreadyOwned then
			p2 += 1
			p1:dispatch(Callback(i, true))
			
			if Success == PurchaseLookItemStatusEnum.Success then
				table.insert(List, (tonumber(i)))
			end
		else
			p3 += 1
		end
	end
	return p2, p3, List
end

local function formatItemForWearAfterPurchase(ItemId, p4, Purchased)
	-- upvalues: ConstantsModule (copy), AXFixBlockyBundleWearAfterPurchase (copy)
	local IsItemTypeMatch = p4.itemType == ConstantsModule.ItemType.Bundle
	
	return if AXFixBlockyBundleWearAfterPurchase and IsItemTypeMatch and ItemId == tostring(ConstantsModule.BlockyBundleId) then nil else {
		owned = true,
		assetId = if IsItemTypeMatch then nil else ItemId,
		assetIsWearable = not IsItemTypeMatch,
		assetType = if IsItemTypeMatch then ConstantsModule.ItemType.Bundle else nil,
		bundleId = if IsItemTypeMatch then ItemId else nil,
		itemSubType = p4.itemSubType,
		overrideOrder = p4.order,
		overrideAdjustments = {
			position = p4.position,
			rotation = p4.rotation,
			scale = p4.scale
		},
		purchased = Purchased,
		tryOnBundleInfo = if IsItemTypeMatch then p4.bundleInfo else nil
	}
end

local function processItem(List, p4, p5, p6, Asset)
	-- upvalues: GetTryOnItemReducerKeyFunction (copy), AXFixBlockyBundleWearAfterPurchase (copy), formatItemForWearAfterPurchase (copy)
	local TryOnItemReducerKey = if Asset == nil then p5 else GetTryOnItemReducerKeyFunction(p5, Asset)
	
	if (p6 == "Success" or p6 == "AlreadyOwned") and p4[TryOnItemReducerKey] ~= nil then
		if AXFixBlockyBundleWearAfterPurchase then
			local FormatItemForWearAfterPurchaseResult = formatItemForWearAfterPurchase(p5, p4[TryOnItemReducerKey], true)
			
			if FormatItemForWearAfterPurchaseResult then
				table.insert(List, FormatItemForWearAfterPurchaseResult)
				
				return List
			end
		else
			table.insert(List, (formatItemForWearAfterPurchase(p5, p4[TryOnItemReducerKey], true)))
		end
	end
	return List
end

local function handleWearAfterPurchase(JoinResult, p4, p5, p6, List, p7, p8)
	-- upvalues: AXFixBlockyBundleWearAfterPurchase (copy), formatItemForWearAfterPurchase (copy), processItem (copy), ConstantsModule (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), WearAfterOutfitPurchaseModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy)
	local List1 = {}
	
	for _, value in List do
		if AXFixBlockyBundleWearAfterPurchase then
			local FormatItemForWearAfterPurchaseResult = formatItemForWearAfterPurchase(value.itemId, value, false)
			
			if FormatItemForWearAfterPurchaseResult then
				table.insert(List1, FormatItemForWearAfterPurchaseResult)
			end
		else
			table.insert(List1, (formatItemForWearAfterPurchase(value.itemId, value, false)))
		end
	end
	for i, value1 in JoinResult.assetPurchaseStatus do
		List1 = processItem(List1, p6, i, value1, ConstantsModule.ItemType.Asset)
	end
	for i1, value2 in JoinResult.bundlePurchaseStatus do
		List1 = processItem(List1, p6, i1, value2, ConstantsModule.ItemType.Bundle)
	end
	if p7 and p8 and p8.autoSaveNextNewSaveData then
		p8.autoSaveNextNewSaveData()
	end
	if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
		AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
	end
	p4:dispatch(WearAfterOutfitPurchaseModule(List1, p5, nil, ConstantsModule.LookType.Avatar))
	
	if GetFFlagAXEnableSlotBasedEditorModule() and not p7 then
		p4:dispatch(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
	end
end

local function handleSaveAsCharacter(p9, p10, p11, p12, p13)
	-- upvalues: CharacterManagerUtilsModule (copy), GetFFlagEnableSavePurchasedLooksWithLookNameModule (copy), AXDefaultCharacterName (copy), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (copy), ConstantsModule (copy), SaveAsMakeupLookThunkFunction (copy), CreateOutfitModule (copy)
	local State = p9:getState()
	local Look = State.AvatarExperience.AvatarScene.Looks[p10]
	local Name = if Look and Look.name then Look.name else nil
	local CombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(State)
	local Name1 = if GetFFlagEnableSavePurchasedLooksWithLookNameModule() and Name then Name else AXDefaultCharacterName
	
	if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType and Look and Look.lookType == ConstantsModule.LookType.Makeup then
		p9:dispatch(SaveAsMakeupLookThunkFunction(p12, Name1, p13))
		
		return
	else
		p9:dispatch((CreateOutfitModule(Name1, p11, function(): boolean
			return true
		end, nil, CombinedHumanoidDescriptionFromEquippedAndOutfitTryOn)))
	end
end

return function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
	-- upvalues: PurchaseLookStatusEnum (copy), v50 (copy), SetAssetOwnedModule (copy), SetBundleOwnedModule (copy), ArgCheckModule (copy), ApiFetchEconomyCurrencyModule (copy), CatalogUtilsModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreenProperties (copy), AXUnifiedSubsetOfLook (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), ConstantsModule (copy), SendUnifiedEventForDeferredActionFunction (copy), CryoModule (copy), UnifiedEventLogEnums (copy), CartIdService (copy), MutedErrorFunction (copy), UnifiedSelectionListStore (copy), FFlagSkipCompletionModalForMarketplace (copy), ShowLooksPurchaseToastsModule (copy), WidgetConstants (copy), ItemTypeEnum (copy), FFlagAXFixPurchaseSurfaceLogging (copy), WebApiModule (copy), UpdateLookDetailsAfterSuccessfulPurchaseModule (copy), handleWearAfterPurchase (copy), handleSaveAsCharacter (copy), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (copy), SetTimeoutFunction (copy), AXLookOutfitCreationDelayMs1 (copy), PromiseModule (copy), config (copy)
	return function(p23)
		-- upvalues: p9 (copy), PurchaseLookStatusEnum (upval), v50 (upval), SetAssetOwnedModule (upval), SetBundleOwnedModule (upval), p11 (copy), ArgCheckModule (upval), ApiFetchEconomyCurrencyModule (upval), p18 (ref), CatalogUtilsModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), p22 (copy), AvatarScreenProperties (upval), AXUnifiedSubsetOfLook (upval), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), p12 (copy), ConstantsModule (upval), p10 (copy), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), UnifiedEventLogEnums (upval), CartIdService (upval), p13 (copy), MutedErrorFunction (upval), UnifiedSelectionListStore (upval), FFlagSkipCompletionModalForMarketplace (upval), ShowLooksPurchaseToastsModule (upval), p20 (copy), WidgetConstants (upval), ItemTypeEnum (upval), FFlagAXFixPurchaseSurfaceLogging (upval), p19 (copy), WebApiModule (upval), UpdateLookDetailsAfterSuccessfulPurchaseModule (upval), handleWearAfterPurchase (upval), p14 (copy), p15 (copy), p17 (copy), p16 (copy), handleSaveAsCharacter (upval), p21 (copy), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (upval), SetTimeoutFunction (upval), AXLookOutfitCreationDelayMs1 (upval), PromiseModule (upval), config (upval)
		if p9.purchaseLookStatus ~= PurchaseLookStatusEnum.Success and p9.purchaseLookStatus ~= PurchaseLookStatusEnum.PartialSuccess or type(p9) ~= "table" then
			return PromiseModule.reject(config)
		end
		local t = {}
		local v1, v2, AssetIds = v50(p23, p9.assetPurchaseStatus, SetAssetOwnedModule, 0, 0, {})
		local SuccessCount, FailureCount, List = v50(p23, p9.bundlePurchaseStatus, SetBundleOwnedModule, v1, v2, t)
		local v3 = p11
		local LocalUserId = p23:getState().LocalUserId
		ArgCheckModule.isNonEmptyString(LocalUserId, "Thunk.PurchaseProduct.updateRobux.localUserId")
		
		if typeof(LocalUserId) == "string" and LocalUserId ~= "" then
			p23:dispatch(ApiFetchEconomyCurrencyModule(v3, LocalUserId, true))
		end
		local Query = nil
		local v4 = nil
		local v5 = nil
		local v6 = nil
		local v7 = nil
		local State = p23:getState()
		
		if p18 then
			Query = p18.query
		else
			Query, v4, v5, v6, v79 = CatalogUtilsModule.getAvatarsTabAnalyticsInfo(State)
		end
		local Success, Result = pcall(function()
			-- upvalues: FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), p23 (copy), p22 (upval), AvatarScreenProperties (upval), AXUnifiedSubsetOfLook (upval), p18 (upval), AssetIds (ref), List (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (upval), State (copy), p12 (upval), ConstantsModule (upval), p10 (upval), SendUnifiedEventForDeferredActionFunction (upval), CryoModule (upval), UnifiedEventLogEnums (upval), CartIdService (upval), Query (ref), p13 (upval)
			local CurrentRoute = if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(p23:getState()) else p23:getState().Navigation and p23:getState().Navigation.currentRoute
			local AvatarScreenProperty = AvatarScreenProperties[if p22 and p22.current and p22.opaque then p22.opaque.name elseif CurrentRoute.params and CurrentRoute.params.extraProps then CurrentRoute.params.extraProps.routeName else nil]
			local v8 = if AXUnifiedSubsetOfLook then p18 == nil else nil
			local Joined: string? = nil
			local Joined1: string? = nil
			
			if AXUnifiedSubsetOfLook and #AssetIds > 0 then
				Joined = table.concat(AssetIds, ",")
			end
			if AXUnifiedSubsetOfLook and #List > 0 then
				Joined1 = table.concat(List, ",")
			end
			local v9 = if p10[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] then p10[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] else false
			local v10 = if p10[ConstantsModule.SaveAsCharacterPostPurchaseActionKey] then p10[ConstantsModule.SaveAsCharacterPostPurchaseActionKey] else false
			local MakeupLookAnalyticsInfo = (if FFlagAXMISEnableMultiShoppingUnifiedEvents and State.AvatarExperience.AvatarScene.Looks[p12].lookType == ConstantsModule.LookType.Makeup then p23:getState().AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo else p23:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo) or { widgetType = nil }
			SendUnifiedEventForDeferredActionFunction(CryoModule.Dictionary.join(p23:getState().AvatarExperience.AnalyticsMetadata, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS,
				cartId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then CartIdService.getCartId() else nil,
				itemId = if FFlagAXMISEnableMultiShoppingUnifiedEvents then p12 else nil,
				itemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType.LOOK,
				keyword = Query,
				surface = if p18 and p18.surface then p18.surface elseif AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil,
				organicAssetIds = if AXUnifiedSubsetOfLook and v8 then Joined else nil,
				organicBundleIds = if AXUnifiedSubsetOfLook and v8 then Joined1 else nil,
				organicItemPrice = if AXUnifiedSubsetOfLook and v8 then p13 else nil,
				assetIds = if AXUnifiedSubsetOfLook and not v8 then Joined else nil,
				bundleIds = if AXUnifiedSubsetOfLook and not v8 then Joined1 else nil,
				widgetItemPrice = if AXUnifiedSubsetOfLook and not v8 then p13 else nil,
				widgetItemWearAfterPurchase = if MakeupLookAnalyticsInfo.widgetType then v9 else nil,
				organicItemWearAfterPurchase = if MakeupLookAnalyticsInfo.widgetType then nil else v9,
				widgetItemSaveToMyAvatars = if MakeupLookAnalyticsInfo.widgetType then v10 else nil,
				organicItemSaveToMyAvatars = if MakeupLookAnalyticsInfo.widgetType then nil else v10
			}))
		end)
		
		if not Success then
			MutedErrorFunction(Result)
		end
		if FFlagAXMISEnableMultiShoppingUnifiedEvents then
			CartIdService.refreshCartId()
			UnifiedSelectionListStore.clearSelectionList()
		end
		local JoinResult = CryoModule.Dictionary.join(p9, { successCount = SuccessCount, failureCount = FailureCount })
		
		if FFlagSkipCompletionModalForMarketplace then
			ShowLooksPurchaseToastsModule({ successCount = SuccessCount, failureCount = FailureCount }, function(p24)
				-- upvalues: p23 (copy)
				return p23:dispatch(p24)
			end)
		end
		if p18 then
			p18 = CryoModule.Dictionary.join(p18, { assetIds = AssetIds })
			
			if #AssetIds > 0 or #List > 0 then
				p20.widgetInteractionV2(p18, WidgetConstants.ActionType.PURCHASE_SUCCESS)
			end
		elseif not p18 then
			p20.avatarShopBuyItem(p12, ItemTypeEnum.Look, p13, v7, v6, Query, v4, v5, p23:getState().AvatarExperience.AnalyticsMetadata, if FFlagAXFixPurchaseSurfaceLogging and p19 then p19.getParam(ConstantsModule.NavigationParams.fromSurface) else nil)
		end
		if #AssetIds > 0 or #List > 0 then
			WebApiModule.GetLookDetailsV2(p11, p12):andThen(function(Result)
				-- upvalues: p23 (copy), UpdateLookDetailsAfterSuccessfulPurchaseModule (upval), p12 (upval), AssetIds (ref), List (ref)
				local Look = Result.responseBody.look
				
				if Look then
					local Flag = true
					
					for _, item in Look.items do
						if not item.quantityOwned or item.quantityOwned == 0 then
							Flag = false
							break
						end
					end
					p23:dispatch(UpdateLookDetailsAfterSuccessfulPurchaseModule(p12, AssetIds, List, Flag))
				end
			end)
		end
		if p10[ConstantsModule.WearAfterPurchasePostPurchaseActionKey] then
			handleWearAfterPurchase(JoinResult, p23, p19, p14, p15, p17, p16)
		end
		if p10[ConstantsModule.SaveAsCharacterPostPurchaseActionKey] then
			local function handleSaveAsCharacterWrapper()
				-- upvalues: handleSaveAsCharacter (upval), p23 (copy), p12 (upval), p21 (upval), FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType (upval), p11 (upval), p14 (upval)
				handleSaveAsCharacter(p23, p12, p21, if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then p11 else nil, if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then p14 else nil)
			end
			
			if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then
				local Look = p23:getState().AvatarExperience.AvatarScene.Looks[p12]
				
				if Look and Look.lookType == ConstantsModule.LookType.Makeup then
					handleSaveAsCharacter(p23, p12, p21, if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then p11 else nil, if FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType then p14 else nil)
				else
					SetTimeoutFunction(handleSaveAsCharacterWrapper, AXLookOutfitCreationDelayMs1)
				end
			else
				SetTimeoutFunction(handleSaveAsCharacterWrapper, AXLookOutfitCreationDelayMs1)
			end
		end
		return PromiseModule.resolve(JoinResult)
	end
end