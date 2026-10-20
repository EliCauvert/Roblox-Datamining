local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local SetTimeoutFunction = require(CorePackages.Packages.LuauPolyfill).setTimeout
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CreateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateOutfit)
local SaveAsMakeupLookThunkFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Thunks.SaveAsMakeupLookThunk
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
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
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local GetUseSelectorDeepEqualsFunction = AvatarExperienceCommonModule.Utils.getUseSelectorDeepEquals
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local AvatarLastEquippedStateStore = AvatarExperienceCommonModule.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore
local UseAvatarSaveContextFunction = require(CorePackages.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext
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
local FFlagAXOutfitPageRevamp = AvatarExperienceFlagsModule.FFlagAXOutfitPageRevamp
local AXDisableCharacterSaveToast = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXDisableCharacterSaveToast", false)
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local IsEconomicRestrictionResponseFunction = IAPExperienceModule.Utility.isEconomicRestrictionResponse
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes

local function _(p1)
	-- upvalues: NavigationUtilsModule (copy)
	NavigationUtilsModule.closeOverlay(p1)
end

local function formatItemForWearAfterPurchase(ItemId, p1, Purchased)
	-- upvalues: ConstantsModule (copy)
	local IsItemTypeMatch = p1.itemType == ConstantsModule.ItemType.Bundle
	
	return {
		owned = true,
		assetId = if IsItemTypeMatch then nil else ItemId,
		assetIsWearable = not IsItemTypeMatch,
		assetType = if IsItemTypeMatch then ConstantsModule.ItemType.Bundle else nil,
		bundleId = if IsItemTypeMatch then ItemId else nil,
		itemSubType = p1.itemSubType,
		overrideOrder = p1.order,
		overrideAdjustments = {
			position = p1.position,
			rotation = p1.rotation,
			scale = p1.scale
		},
		purchased = Purchased,
		tryOnBundleInfo = if IsItemTypeMatch then p1.bundleInfo else nil
	}
end

local function processItem(List, p1, p2, p3, Asset, Makeup)
	-- upvalues: SupportAlreadyOwnedItemPurchaseStatus (copy), ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy), GetTryOnItemReducerKeyFunction (copy), formatItemForWearAfterPurchase (copy)
	local TryOnItemReducerKey = if Asset == nil or Makeup ~= ConstantsModule.LookType.Avatar and (not FFlagAXCatalogMakeupSupport or Makeup ~= ConstantsModule.LookType.Makeup) then p2 else GetTryOnItemReducerKeyFunction(p2, Asset)
	
	if (p3 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and p3 == "AlreadyOwned") and p1[TryOnItemReducerKey] ~= nil then
		table.insert(List, (formatItemForWearAfterPurchase(p2, p1[TryOnItemReducerKey], true)))
	end
	return List
end

local function ShowToasts(p1, Callback: (any) -> (), p2)
	-- upvalues: ToastTypeModule (copy), SetCurrentToastMessageModule (copy)
	local SuccessCount: number = p1.successCount
	local FailureCount: number = p1.failureCount
	
	if SuccessCount > 0 and FailureCount <= 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = if SuccessCount == 1 then p2:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", { numItems = SuccessCount }) else p2:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", { numItems = SuccessCount }),
			toastType = ToastTypeModule.PurchaseMessage
		}))
		
		return
	end
	if SuccessCount > 0 and FailureCount > 0 then
		Callback(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = p2:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"),
			toastSubMessage = p2:Format(if SuccessCount == 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" elseif SuccessCount == 1 and FailureCount > 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" elseif SuccessCount > 1 and FailureCount == 1 then "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" else "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP", {
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
			toastMessage = p2:Format("Feature.Avatar.Heading.LooksPurchaseFailed"),
			toastSubMessage = p2:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"),
			toastType = ToastTypeModule.NetworkingError
		}))
		
		return
	end
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseRoactServiceModule (copy), RoactNetworkingModule (copy), UseDispatchFunction (copy), RoactLocalizationModule (copy), AnalyticsModule (copy), AnalyticsModule1 (copy), UseTriggerFeedbackFunction (copy), ReactModule (copy), UseAvatarSaveContextFunction (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), CharacterManagerUtilsModule (copy), GetFFlagEnableSavePurchasedLooksWithLookNameModule (copy), UseLocalizationModule (copy), ConstantsModule (copy), FFlagAXCatalogMakeupSupport (copy), ToastTypeModule (copy), SetCurrentToastMessageModule (copy), formatItemForWearAfterPurchase (copy), processItem (copy), SupportAlreadyOwnedItemPurchaseStatus (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (copy), AvatarLastEquippedStateStore (copy), WearAfterOutfitPurchaseModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), AXDefaultCharacterName (copy), UtilsModule (copy), FFlagAXOutfitPageRevamp (copy), SaveAsMakeupLookThunkFunction (copy), AXDisableCharacterSaveToast (copy), CreateOutfitModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), NavigationUtilsModule (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy), PurchaseLooksProductModule (copy), ShowToasts (copy), SetTimeoutFunction (copy), FIntAXLookOutfitCreationDelayMs (copy), SendAXCounterV2Function (copy), MutedErrorModule (copy), IsEconomicRestrictionResponseFunction (copy), PurchasePromptInteractiveAlertModule (copy)
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
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		return p2.AvatarExperience.AvatarEditor.OutfitInfos
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult4 = UseSelectorFunction(function(p2)
		-- upvalues: CharacterManagerUtilsModule (upval)
		return CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(p2)
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult5 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		local Look = p2.AvatarExperience.AvatarScene.Looks[p1.lookId]
		
		return if Look then Look.lookType else nil
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult6 = if GetFFlagEnableSavePurchasedLooksWithLookNameModule() then UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		local Look = p2.AvatarExperience.AvatarScene.Looks[p1.lookId]
		
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
		buyButtonText = if UseSelectorResult5 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Title.BuyAvatar" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Title.BuyMakeup" else "Feature.Avatar.Title.BuyOutfit",
		buyLookQuestion = if UseSelectorResult5 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Label.BuyAvatarQuestion" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Label.BuyMakeupQuestion" else "Feature.Avatar.Label.BuyLookQuestion",
		buyLookTitle = if UseSelectorResult5 == ConstantsModule.LookType.Avatar then "Feature.Avatar.Title.BuyAvatar" elseif FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then "Feature.Avatar.Title.BuyMakeup" else "Feature.Avatar.Title.BuyOutfit"
	})
	
	local function ToggleWearAfterPurchase()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
		UseStateResult2_1(not UseStateResult1)
	end
	
	local function ToggleSaveAsCharacter()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult3 (copy)
		UseStateResult2_2(not UseStateResult3)
	end
	
	local function v73(p2)
		-- upvalues: UseLocalizationModuleResult (copy), ToastTypeModule (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		if p2 then
			UseDispatchResult(SetCurrentToastMessageModule({
				isLocalized = true,
				toastMessage = UseLocalizationModuleResult.characterSavedHeading,
				toastSubMessage = UseLocalizationModuleResult.characterSavedMsg,
				toastType = ToastTypeModule.SuccessConfirmation
			}))
			
			return
		end
	end
	
	local function v74()
		-- upvalues: UseLocalizationModuleResult (copy), ToastTypeModule (upval), UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
		UseDispatchResult(SetCurrentToastMessageModule({
			isLocalized = true,
			toastMessage = UseLocalizationModuleResult.makeupLookSavedHeading,
			toastSubMessage = UseLocalizationModuleResult.makeupLookSavedMsg,
			toastType = ToastTypeModule.SuccessConfirmation
		}))
	end
	
	local function handleWearAfterPurchase(p2)
		-- upvalues: UseStateResult1 (copy), p1 (copy), formatItemForWearAfterPurchase (upval), UseSelectorResult5 (copy), ConstantsModule (upval), FFlagAXCatalogMakeupSupport (upval), processItem (upval), UseSelectorResult (copy), SupportAlreadyOwnedItemPurchaseStatus (upval), UseAvatarSaveContextResult (copy), FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup (upval), AvatarLastEquippedStateStore (upval), UseDispatchResult (copy), WearAfterOutfitPurchaseModule (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval)
		if not UseStateResult1 then return end
		local List1 = {}
		
		for _, ownedTryOnItem in p1.ownedTryOnItems do
			table.insert(List1, (formatItemForWearAfterPurchase(ownedTryOnItem.itemId, ownedTryOnItem, false)))
		end
		if UseSelectorResult5 == ConstantsModule.LookType.Avatar or FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then
			for i, value in p2.assetPurchaseStatus do
				List1 = processItem(List1, UseSelectorResult, i, value, ConstantsModule.ItemType.Asset, UseSelectorResult5)
			end
			for i1, value1 in p2.bundlePurchaseStatus do
				List1 = processItem(List1, UseSelectorResult, i1, value1, ConstantsModule.ItemType.Bundle, UseSelectorResult5)
			end
		else
			for i2, value2 in p2.itemPurchaseStatus do
				local List = List1
				
				if (value2 == "Success" or SupportAlreadyOwnedItemPurchaseStatus and value2 == "AlreadyOwned") and UseSelectorResult[i2] ~= nil then
					table.insert(List, (formatItemForWearAfterPurchase(i2, UseSelectorResult[i2], true)))
				end
				List1 = List
			end
		end
		if p1.isTryOnFromOutsideAX and UseAvatarSaveContextResult and UseAvatarSaveContextResult.autoSaveNextNewSaveData then
			UseAvatarSaveContextResult.autoSaveNextNewSaveData()
		end
		if FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup then
			AvatarLastEquippedStateStore.setShouldRevertLastEquippedState(false)
		end
		UseDispatchResult(WearAfterOutfitPurchaseModule(List1, p1.navigation, nil, UseSelectorResult5))
		
		if GetFFlagAXEnableSlotBasedEditorModule() and not p1.isTryOnFromOutsideAX then
			UseDispatchResult(SetTryOnManagerPeekViewStateFunction(PeekViewState.Closed))
		end
	end
	
	local function handleSaveAsCharacter()
		-- upvalues: UseStateResult3 (copy), UseSelectorResult5 (copy), ConstantsModule (upval), FFlagAXCatalogMakeupSupport (upval), GetFFlagEnableSavePurchasedLooksWithLookNameModule (upval), UseSelectorResult6 (ref), AXDefaultCharacterName (upval), UtilsModule (upval), UseSelectorResult2 (copy), UseSelectorResult3 (copy), FFlagAXOutfitPageRevamp (upval), UseDispatchResult (copy), SaveAsMakeupLookThunkFunction (upval), UseRoactServiceModuleResult (copy), UseSelectorResult (copy), AXDisableCharacterSaveToast (upval), v74 (copy), CreateOutfitModule (upval), UseRoactServiceModuleResult2 (copy), v73 (copy), UseSelectorResult4 (copy)
		if not UseStateResult3 then return end
		local v1 = nil
		
		if UseSelectorResult5 == ConstantsModule.LookType.Avatar or FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then
			v1 = if GetFFlagEnableSavePurchasedLooksWithLookNameModule() and UseSelectorResult6 then UseSelectorResult6 else AXDefaultCharacterName
		else
			for i = 1, 1000 do
				v1 = "Outfit" .. i
				
				if not UtilsModule.isDuplicateOutfitName(UseSelectorResult2, UseSelectorResult3, v1, if FFlagAXOutfitPageRevamp then if UseSelectorResult5 == ConstantsModule.LookType.Makeup then ConstantsModule.OutfitTypes.Makeup else ConstantsModule.OutfitTypes.Avatar else nil) then break end
			end
		end
		local function v87(): boolean
			return true
		end
		
		if FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then
			UseDispatchResult(SaveAsMakeupLookThunkFunction(UseRoactServiceModuleResult, v1, UseSelectorResult, if AXDisableCharacterSaveToast then nil else v74))
			
			return
		else
			UseDispatchResult(CreateOutfitModule(v1, UseRoactServiceModuleResult2, v87, if AXDisableCharacterSaveToast then nil else v73, UseSelectorResult4))
		end
	end
	
	local function v77(p3)
		-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), NavigationUtilsModule (upval), p1 (copy), UseDispatchResult (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
		local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p3)
		local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p3)
		Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
			surface = EconomicRestrictionsSurface.AvatarExperienceLook,
			failureReason = ParseEconomicRestrictionsFailureReasonResult
		})
		NavigationUtilsModule.closeOverlay(p1.navigation)
		
		return UseDispatchResult(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
	end
	
	local function OnConfirm()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseTriggerFeedbackResult (copy), UseDispatchResult (copy), PurchaseLooksProductModule (upval), UseRoactServiceModuleResult (copy), p1 (copy), UseRoactServiceModuleResult3 (copy), ShowToasts (upval), UseRoactServiceModuleResult1 (copy), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult5 (copy), ConstantsModule (upval), handleSaveAsCharacter (copy), handleWearAfterPurchase (copy), SetTimeoutFunction (upval), FIntAXLookOutfitCreationDelayMs (upval), NavigationUtilsModule (upval), SendAXCounterV2Function (upval), MutedErrorModule (upval), v77 (copy), IsEconomicRestrictionResponseFunction (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
		if not UseStateResult then
			UseStateResult2(true)
			UseTriggerFeedbackResult("MakePurchase", "Press")
			UseDispatchResult(PurchaseLooksProductModule(UseRoactServiceModuleResult, p1.lookId, p1.priceInRobux, UseRoactServiceModuleResult3)):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), ShowToasts (upval), UseDispatchResult (upval), UseRoactServiceModuleResult1 (upval), FFlagAXCatalogMakeupSupport (upval), UseSelectorResult5 (upval), ConstantsModule (upval), handleSaveAsCharacter (upval), handleWearAfterPurchase (upval), SetTimeoutFunction (upval), FIntAXLookOutfitCreationDelayMs (upval), p1 (upval), NavigationUtilsModule (upval)
				UseStateResult2(false)
				ShowToasts(Result, UseDispatchResult, UseRoactServiceModuleResult1)
				
				if FFlagAXCatalogMakeupSupport and UseSelectorResult5 == ConstantsModule.LookType.Makeup then
					handleSaveAsCharacter()
				end
				handleWearAfterPurchase(Result)
				
				if UseSelectorResult5 == ConstantsModule.LookType.Avatar then
					SetTimeoutFunction(handleSaveAsCharacter, FIntAXLookOutfitCreationDelayMs)
				elseif UseSelectorResult5 ~= ConstantsModule.LookType.Makeup then
					handleSaveAsCharacter()
				end
				NavigationUtilsModule.closeOverlay(p1.navigation)
			end, function(p3)
				-- upvalues: SendAXCounterV2Function (upval), ConstantsModule (upval), p1 (upval), MutedErrorModule (upval), v77 (upval), IsEconomicRestrictionResponseFunction (upval), UseStateResult2 (upval), UseDispatchResult (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), NavigationUtilsModule (upval)
				SendAXCounterV2Function(ConstantsModule.Counter.Errors.PurchaseLooksProductError, { lookId = p1.lookId })
				MutedErrorModule("PurchaseLooksProduct error", p3)
				
				if v77 and IsEconomicRestrictionResponseFunction(p3) then
					v77(p3)
					
					return
				else
					UseStateResult2(false)
					UseDispatchResult(SetCurrentToastMessageModule({
						isLocalized = false,
						toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
						toastType = ToastTypeModule.NetworkingError
					}))
					NavigationUtilsModule.closeOverlay(p1.navigation)
				end
			end)
			
			return
		end
	end
	
	local function OnCancel()
		-- upvalues: UseStateResult (copy), NavigationUtilsModule (upval), p1 (copy)
		if not UseStateResult then
			NavigationUtilsModule.closeOverlay(p1.navigation)
			
			return
		end
	end
	local GetButtonText = nil
	local GetLookTitle = nil
	local GetLookQuestion = nil
	
	if p1.priceInRobux == 0 then
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
		priceInRobux = p1.priceInRobux,
		showWearAfterPurchase = p1.showWearAfterPurchase,
		showSaveAsCharacter = p1.showSaveAsCharacter,
		isWearAfterPurchaseChecked = UseStateResult1,
		isSaveAsCharacterChecked = UseStateResult3,
		toggleWearAfterPurchase = ToggleWearAfterPurchase,
		toggleSaveAsCharacter = ToggleSaveAsCharacter,
		saveIfWearAfterPurchase = p1.isTryOnFromOutsideAX,
		lookType = UseSelectorResult5,
		analyticsInfo = UseSelectorResult1,
		titleText = GetLookTitle,
		bodyText = GetLookQuestion,
		confirmButtonText = GetButtonText,
		onConfirm = OnConfirm,
		onCancel = OnCancel,
		isLoading = UseStateResult,
		defaultChildRef = p1.defaultChildRef
	})
end))))