local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local SetTimeoutFunction = require(CorePackages.Packages.LuauPolyfill).setTimeout
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local CreateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateOutfit)
local SaveAsMakeupLookThunkFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Thunks.SaveAsMakeupLookThunk
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local PurchasePromptInteractiveAlertModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert)
local PurchaseLooksProductModule = require(Modules.AvatarExperience.Catalog.Thunks.PurchaseLooksProduct)
local WearAfterOutfitPurchaseModule = require(Modules.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local SetTryOnManagerPeekViewStateFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local IsEconomicRestrictionResponseFunction = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local UseTriggerFeedbackFunction = require(CorePackages.Workspace.Packages.InteractionFeedback).useTriggerFeedback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local AXDefaultCharacterName = game:DefineFastString("AXDefaultCharacterName", "Avatar")
local FIntAXLookOutfitCreationDelayMs = AvatarExperienceFlagsModule.FIntAXLookOutfitCreationDelayMs
local SupportAlreadyOwnedItemPurchaseStatus = game:DefineFastFlag("SupportAlreadyOwnedItemPurchaseStatus", false)
local GetFFlagEnableSavePurchasedLooksWithLookNameModule = require(Modules.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup = AvatarExperienceFlagsModule.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local AXDisableCharacterSaveToast = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXDisableCharacterSaveToast", false)

local function _(p1)
	-- upvalues: NavigationUtilsModule (copy)
	NavigationUtilsModule.closeOverlay(p1)
end

local function formatItemForWearAfterPurchaseMIS(Id, p1, Purchased)
	-- upvalues: ConstantsModule (copy)
	local IsItemTypeMatch = p1.itemType == ConstantsModule.ItemType.Bundle
	local t = {}
	
	if IsItemTypeMatch then
		for _, value in p1.assetsInBundle do
			if value.isIncluded then
				t[tostring(value.id)] = {
					assetType = tostring(value.assetType),
					order = value.order
				}
			end
		end
	end
	return {
		owned = true,
		assetId = if IsItemTypeMatch then nil else Id,
		assetIsWearable = not IsItemTypeMatch,
		assetType = if IsItemTypeMatch then ConstantsModule.ItemType.Bundle else nil,
		bundleId = if IsItemTypeMatch then Id else nil,
		itemSubType = if IsItemTypeMatch then tostring(p1.bundleType) else tostring(p1.assetType),
		purchased = Purchased,
		tryOnBundleInfo = if IsItemTypeMatch then t else nil
	}
end

local function formatItemForWearAfterPurchaseLegacy(ItemId, p2, Purchased)
	-- upvalues: ConstantsModule (copy)
	local IsItemTypeMatch = p2.itemType == ConstantsModule.ItemType.Bundle
	
	return {
		owned = true,
		assetId = if IsItemTypeMatch then nil else ItemId,
		assetIsWearable = not IsItemTypeMatch,
		assetType = if IsItemTypeMatch then ConstantsModule.ItemType.Bundle else nil,
		bundleId = if IsItemTypeMatch then ItemId else nil,
		itemSubType = p2.itemSubType,
		overrideOrder = p2.order,
		overrideAdjustments = {
			position = p2.position,
			rotation = p2.rotation,
			scale = p2.scale
		},
		purchased = Purchased,
		tryOnBundleInfo = if IsItemTypeMatch then p2.bundleInfo else nil
	}
end

local _ = function(List, p2, p3, p4, _)
	-- upvalues: SupportAlreadyOwnedItemPurchaseStatus (copy), formatItemForWearAfterPurchaseMIS (copy)
	if (p4 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and p4 == "AlreadyOwned") and p2[p3] ~= nil then
		table.insert(List, (formatItemForWearAfterPurchaseMIS(p3, p2[p3], true)))
	end
	return List
end

local function processItemLegacy(List, p2, p3, p4, Asset, Makeup)
	-- upvalues: SupportAlreadyOwnedItemPurchaseStatus (copy), ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy), GetTryOnItemReducerKeyFunction (copy), formatItemForWearAfterPurchaseLegacy (copy)
	local TryOnItemReducerKey = if Asset == nil or Makeup ~= ConstantsModule.LookType.Avatar and (not FFlagAXCatalogMakeupSupport or Makeup ~= ConstantsModule.LookType.Makeup) then p3 else GetTryOnItemReducerKeyFunction(p3, Asset)
	
	if (p4 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and p4 == "AlreadyOwned") and p2[TryOnItemReducerKey] ~= nil then
		table.insert(List, (formatItemForWearAfterPurchaseLegacy(p3, p2[TryOnItemReducerKey], true)))
	end
	return List
end

local function ShowToasts(p2, Callback: (any) -> (), p3)
	-- upvalues: ToastTypeModule (copy), SetCurrentToastMessageModule (copy)
	local SuccessCount: number = p2.successCount
	local FailureCount: number = p2.failureCount
	
	if SuccessCount > 0 and FailureCount <= 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = if SuccessCount == 1 then p3:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", { numItems = SuccessCount }) else p3:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", { numItems = SuccessCount }),
			toastType = ToastTypeModule.PurchaseMessage
		}))
		
		return
	end
	if SuccessCount > 0 and FailureCount > 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = p3:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"),
			toastSubMessage = p3:Format(if SuccessCount == 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" elseif SuccessCount == 1 and FailureCount > 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" elseif SuccessCount > 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" else "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP", {
				numSuccessItems = SuccessCount,
				numFailureItems = FailureCount
			}),
			toastType = ToastTypeModule.NetworkingError
		}))
		
		return
	end
	if SuccessCount <= 0 and FailureCount > 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = p3:Format("Feature.Avatar.Heading.LooksPurchaseFailed"),
			toastSubMessage = p3:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"),
			toastType = ToastTypeModule.NetworkingError
		}))
		
		return
	end
end

local function selectTryOnItems(p2)
	return p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

local function selectLookAnalyticsInfo(p2)
	return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
end

local v1 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then function(p2)
	return p2.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
end else nil

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p2)
	-- upvalues: UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), RoactLocalizationModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseTriggerFeedbackFunction (copy), ReactModule (copy), UseAvatarSaveContextFunction (copy), UseSelectorFunction (copy), selectLookAnalyticsInfo (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), v1 (ref), selectTryOnItems (copy), CharacterManagerUtilsModule (copy), GetFFlagEnableSavePurchasedLooksWithLookNameModule (copy), UseLocalizationModule (copy), ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy), ToastTypeModule (copy), SetCurrentToastMessageModule (copy), formatItemForWearAfterPurchaseLegacy (copy), processItemLegacy (copy), formatItemForWearAfterPurchaseMIS (copy), SupportAlreadyOwnedItemPurchaseStatus (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), WearAfterOutfitPurchaseModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), AXDefaultCharacterName (copy), SaveAsMakeupLookThunkFunction (copy), AXDisableCharacterSaveToast (copy), CreateOutfitModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), NavigationUtilsModule (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy), PurchaseLooksProductModule (copy), ShowToasts (copy), SetTimeoutFunction (copy), FIntAXLookOutfitCreationDelayMs (copy), SendAXCounterV2Function (copy), MutedErrorModule (copy), IsEconomicRestrictionResponseFunction (copy), PurchasePromptInteractiveAlertModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactLocalizationModule)
	local UseRoactServiceModuleResult2 = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult3 = UseRoactServiceModule(AnalyticsModule1)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseAvatarSaveContextResult = UseAvatarSaveContextFunction()
	local UseSelectorResult = UseSelectorFunction(selectLookAnalyticsInfo, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = if FFlagAXMISEnableMultiShoppingUnifiedEvents then UseSelectorFunction(v1, GetUseSelectorDeepEqualsFunction()) else nil
	local UseSelectorResult2 = UseSelectorFunction(selectTryOnItems, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p3)
		-- upvalues: CharacterManagerUtilsModule (upval)
		return CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(p3)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(function(p3)
		-- upvalues: p2 (copy)
		local Look = p3.AvatarExperience.AvatarScene.Looks[p2.lookId]
		
		return if Look then Look.lookType else nil
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult5 = if GetFFlagEnableSavePurchasedLooksWithLookNameModule() then UseSelectorFunction(function(p3)
		-- upvalues: p2 (copy)
		local Look = p3.AvatarExperience.AvatarScene.Looks[p2.lookId]
		
		return if Look and Look.name then Look.name else nil
	end, GetUseSelectorDeepEqualsFunction()) else nil
	local UseLocalizationModuleResult = UseLocalizationModule({
		getButtonText = "Feature.Catalog.Label.Get",
		getLookQuestion = "Feature.Avatar.Label.GetLookQuestion",
		getLookTitle = "Feature.Avatar.Title.GetOutfit",
		characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved",
		characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved",
		makeupLookSavedHeading = "Feature.Avatar.Heading.MakeupLookSaved",
		makeupLookSavedMsg = "Feature.Avatar.Message.MakeupLookSaved",
		buyButtonText = if UseSelectorResult4 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Title.BuyAvatar" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult4 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Title.BuyMakeup" else "Feature.Avatar.Title.BuyOutfit",
		buyLookQuestion = if UseSelectorResult4 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Label.BuyAvatarQuestion" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult4 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Label.BuyMakeupQuestion" else "Feature.Avatar.Label.BuyLookQuestion",
		buyLookTitle = if UseSelectorResult4 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Title.BuyAvatar" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult4 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Title.BuyMakeup" else "Feature.Avatar.Title.BuyOutfit"
	})
	
	local function ToggleWearAfterPurchase()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
		UseStateResult2_1(not UseStateResult1)
	end
	
	local function ToggleSaveAsCharacter()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult3 (copy)
		UseStateResult2_2(not UseStateResult3)
	end
	
	local function v78(p3)
		-- upvalues: UseLocalizationModuleResult (copy), ToastTypeModule (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		if p3 then
			UseDispatchResult(SetCurrentToastMessageModule({
				isLocalized = true,
				toastMessage = UseLocalizationModuleResult.characterSavedHeading,
				toastSubMessage = UseLocalizationModuleResult.characterSavedMsg,
				toastType = ToastTypeModule.SuccessConfirmation
			}))
			
			return
		end
	end
	
	local function v79()
		-- upvalues: UseLocalizationModuleResult (copy), ToastTypeModule (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = UseLocalizationModuleResult.makeupLookSavedHeading,
			toastSubMessage = UseLocalizationModuleResult.makeupLookSavedMsg,
			toastType = ToastTypeModule.SuccessConfirmation
		}))
	end
	
	local function handleWearAfterPurchase(p3)
		-- upvalues: UseStateResult1 (copy), p2 (copy), formatItemForWearAfterPurchaseLegacy (upval), UseSelectorResult2 (copy), processItemLegacy (upval), ConstantsModule (upval), UseSelectorResult4 (copy), formatItemForWearAfterPurchaseMIS (upval), SupportAlreadyOwnedItemPurchaseStatus (upval), UseAvatarSaveContextResult (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), UseDispatchResult (copy), WearAfterOutfitPurchaseModule (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval)
		if not UseStateResult1 then return end
		local List2 = {}
		
		if p2.isTryOnFromOutsideAX then
			if p2.ownedTryOnItems then
				for _, ownedTryOnItem in p2.ownedTryOnItems do
					table.insert(List2, (formatItemForWearAfterPurchaseLegacy(ownedTryOnItem.itemId, ownedTryOnItem, false)))
				end
			end
			if UseSelectorResult2 then
				for i, value in p3.assetPurchaseStatus do
					List2 = processItemLegacy(List2, UseSelectorResult2, i, value, ConstantsModule.ItemType.Asset, UseSelectorResult4)
				end
				for i1, value1 in p3.bundlePurchaseStatus do
					List2 = processItemLegacy(List2, UseSelectorResult2, i1, value1, ConstantsModule.ItemType.Bundle, UseSelectorResult4)
				end
			end
		else
			if p2.ownedItemsInLook then
				for _, value2 in p2.ownedItemsInLook do
					table.insert(List2, (formatItemForWearAfterPurchaseMIS(value2.id, value2, false)))
				end
			end
			if p2.allLookItems then
				for i2, value3 in p3.assetPurchaseStatus do
					local List = List2
					local AllLookItems = p2.allLookItems
					local _ = ConstantsModule.ItemType.Asset
					
					if (value3 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and value3 == "AlreadyOwned") and AllLookItems[i2] ~= nil then
						table.insert(List, (formatItemForWearAfterPurchaseMIS(i2, AllLookItems[i2], true)))
					end
					List2 = List
				end
				for i3, value4 in p3.bundlePurchaseStatus do
					local List1 = List2
					local AllLookItems = p2.allLookItems
					local _ = ConstantsModule.ItemType.Bundle
					
					if (value4 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and value4 == "AlreadyOwned") and AllLookItems[i3] ~= nil then
						table.insert(List1, (formatItemForWearAfterPurchaseMIS(i3, AllLookItems[i3], true)))
					end
					List2 = List1
				end
			end
		end
		if p2.isTryOnFromOutsideAX and UseAvatarSaveContextResult and UseAvatarSaveContextResult.autoSaveNextNewSaveData then
			UseAvatarSaveContextResult.autoSaveNextNewSaveData()
		end
		if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end
		UseDispatchResult(WearAfterOutfitPurchaseModule(List2, p2.navigation, nil, UseSelectorResult4))
		
		if GetFFlagAXEnableSlotBasedEditorModule() and not p2.isTryOnFromOutsideAX then
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		end
	end
	
	local function handleSaveAsCharacter()
		-- upvalues: UseStateResult3 (copy), GetFFlagEnableSavePurchasedLooksWithLookNameModule (upval), UseSelectorResult5 (ref), AXDefaultCharacterName (upval), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult4 (copy), ConstantsModule (upval), UseDispatchResult (copy), SaveAsMakeupLookThunkFunction (upval), UseRoactServiceModuleResult (copy), UseSelectorResult2 (copy), AXDisableCharacterSaveToast (upval), v79 (copy), CreateOutfitModule (upval), UseRoactServiceModuleResult2 (copy), v78 (copy), UseSelectorResult3 (copy)
		if not UseStateResult3 then return end
		local UseSelectorResult = if GetFFlagEnableSavePurchasedLooksWithLookNameModule() and UseSelectorResult5 then UseSelectorResult5 else AXDefaultCharacterName
		
		local function v95(): boolean
			return true
		end
		
		if FFlagAXCatalogMakeupSupport and UseSelectorResult4 == ConstantsModule.LookType.Makeup then
			UseDispatchResult(SaveAsMakeupLookThunkFunction(UseRoactServiceModuleResult, UseSelectorResult, UseSelectorResult2, if AXDisableCharacterSaveToast then nil else v79))
			
			return
		else
			UseDispatchResult(CreateOutfitModule(UseSelectorResult, UseRoactServiceModuleResult2, v95, if AXDisableCharacterSaveToast then nil else v78, UseSelectorResult3))
		end
	end
	
	local Callback = if p2.isTryOnFromOutsideAX then function(p4)
		-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), NavigationUtilsModule (upval), p2 (copy), UseDispatchResult (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
		local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p4)
		local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p4)
		Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
			surface = EconomicRestrictionsSurface.AvatarExperienceLook,
			failureReason = ParseEconomicRestrictionsFailureReasonResult
		})
		NavigationUtilsModule.closeOverlay(p2.navigation)
		
		return UseDispatchResult(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
	end else nil
	
	local function OnConfirm()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseTriggerFeedbackResult (copy), UseDispatchResult (copy), PurchaseLooksProductModule (upval), UseRoactServiceModuleResult (copy), p2 (copy), UseRoactServiceModuleResult3 (copy), ShowToasts (upval), UseRoactServiceModuleResult1 (copy), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult4 (copy), ConstantsModule (upval), handleSaveAsCharacter (copy), handleWearAfterPurchase (copy), SetTimeoutFunction (upval), FIntAXLookOutfitCreationDelayMs (upval), NavigationUtilsModule (upval), SendAXCounterV2Function (upval), MutedErrorModule (upval), Callback (copy), IsEconomicRestrictionResponseFunction (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		if not UseStateResult then
			UseStateResult2(true)
			UseTriggerFeedbackResult("MakePurchase", "Press")
			UseDispatchResult(PurchaseLooksProductModule(UseRoactServiceModuleResult, p2.lookId, p2.priceInRobux, UseRoactServiceModuleResult3)):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), ShowToasts (upval), UseDispatchResult (upval), UseRoactServiceModuleResult1 (upval), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult4 (upval), ConstantsModule (upval), handleSaveAsCharacter (upval), handleWearAfterPurchase (upval), SetTimeoutFunction (upval), FIntAXLookOutfitCreationDelayMs (upval), p2 (upval), NavigationUtilsModule (upval)
				UseStateResult2(false)
				ShowToasts(Result, UseDispatchResult, UseRoactServiceModuleResult1)
				
				if FFlagAXCatalogMakeupSupport and UseSelectorResult4 == ConstantsModule.LookType.Makeup then
					handleSaveAsCharacter()
				end
				handleWearAfterPurchase(Result)
				
				if UseSelectorResult4 == ConstantsModule.LookType.Avatar then
					SetTimeoutFunction(handleSaveAsCharacter, FIntAXLookOutfitCreationDelayMs)
				end
				NavigationUtilsModule.closeOverlay(p2.navigation)
			end, function(p4)
				-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), p2 (upval), MutedErrorModule (upval), Callback (upval), IsEconomicRestrictionResponseFunction (upval), UseStateResult2 (upval), UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), NavigationUtilsModule (upval)
				SendAXCounterV2Function(ConstantsModule.Counter.Errors.PurchaseLooksProductError, {
					promptType = "PurchaseLookPromptMIS",
					lookId = p2.lookId,
					isTryOnFromOutsideAX = tostring(p2.isTryOnFromOutsideAX)
				})
				MutedErrorModule("PurchaseLooksProductMIS error", p4)
				
				if Callback and IsEconomicRestrictionResponseFunction(p4) then
					Callback(p4)
					
					return
				else
					UseStateResult2(false)
					UseDispatchResult(SetCurrentToastMessageModule({
						isLocalized = false,
						toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
						toastType = ToastTypeModule.NetworkingError
					}))
					NavigationUtilsModule.closeOverlay(p2.navigation)
				end
			end)
			
			return
		end
	end
	
	local function OnCancel()
		-- upvalues: UseStateResult (copy), NavigationUtilsModule (upval), p2 (copy)
		if not UseStateResult then
			NavigationUtilsModule.closeOverlay(p2.navigation)
			
			return
		end
	end
	local GetLookTitle = nil
	local GetLookQuestion = nil
	local GetButtonText = nil
	
	if p2.priceInRobux == 0 then
		GetLookTitle = UseLocalizationModuleResult.getLookTitle
		GetLookQuestion = UseLocalizationModuleResult.getLookQuestion
		GetButtonText = UseLocalizationModuleResult.getButtonText
	else
		GetLookTitle = UseLocalizationModuleResult.buyLookTitle
		GetLookQuestion = UseLocalizationModuleResult.buyLookQuestion
		GetButtonText = UseLocalizationModuleResult.buyButtonText
	end
	return ReactModule.createElement(PurchasePromptInteractiveAlertModule, {
		isPurchasingOutfit = true,
		priceInRobux = p2.priceInRobux,
		showWearAfterPurchase = p2.showWearAfterPurchase,
		showSaveAsCharacter = p2.showSaveAsCharacter,
		isWearAfterPurchaseChecked = UseStateResult1,
		isSaveAsCharacterChecked = UseStateResult3,
		toggleWearAfterPurchase = ToggleWearAfterPurchase,
		toggleSaveAsCharacter = ToggleSaveAsCharacter,
		saveIfWearAfterPurchase = p2.isTryOnFromOutsideAX,
		lookType = UseSelectorResult4,
		analyticsInfo = if FFlagAXMISEnableMultiShoppingUnifiedEvents and UseSelectorResult4 == ConstantsModule.LookType.Makeup then UseSelectorResult1 else UseSelectorResult,
		titleText = GetLookTitle,
		bodyText = GetLookQuestion,
		confirmButtonText = GetButtonText,
		onConfirm = OnConfirm,
		onCancel = OnCancel,
		isLoading = UseStateResult,
		defaultChildRef = p2.defaultChildRef
	})
end))))