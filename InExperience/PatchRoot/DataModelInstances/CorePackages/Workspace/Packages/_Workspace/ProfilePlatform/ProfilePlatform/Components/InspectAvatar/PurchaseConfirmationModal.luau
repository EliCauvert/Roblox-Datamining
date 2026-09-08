local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local numberLocalization = require(parent.Localization).NumberLocalization
local avatarSaveContext = require(parent.AvatarExperienceSave).Context.AvatarSaveContext
local getIsInsufficientRobuxError = require(parent.AvatarExperienceCommon).Utils.getIsInsufficientRobuxError
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local marketplaceUnifiedAction = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedAction
local enumsModule = require(profilePlatform.Common.Enums)
local purchaseBulkItemsModule = require(profilePlatform.Networking.PurchaseBulkItems)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local handlePurchaseItemsSuccessModule = require(script.Parent.HandlePurchaseItemsSuccess)
local sendProfilePurchaseEventsModule = require(profilePlatform.Analytics.sendProfilePurchaseEvents)
local fFlagProfileUnifiedPurchaseLoggingModule = require(profilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)
local fFlagSocialEnableProfileInspectAndBuyAnalytics = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav = require(parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav
local fFlagProfileInspectAndBuyAutoFocusModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyAutoFocus)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local view = foundationModule.View
local text = foundationModule.Text
local checkbox = foundationModule.Checkbox
local dialog = foundationModule.Dialog
local inputSize = foundationModule.Enums.InputSize
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local iconName = foundationModule.Enums.IconName
local getIconRichText = foundationModule.Utility.getIconRichText

return function(p1)
	-- upvalues: useNavigation (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), reactModule (ref), avatarSaveContext (ref), fFlagProfileUnifiedPurchaseLoggingModule (ref), robloxAppHooksModule (ref), enumsModule (ref), useLocalization (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), sendProfilePurchaseEventsModule (ref), marketplaceUnifiedAction (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), view (ref), text (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), fFlagProfileInspectAndBuyAutoFocusModule (ref), reactFocusNavigationModule (ref), dialog (ref), dialogSize (ref), checkbox (ref), inputSize (ref), orientation (ref), buttonVariant (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var1 = useNavigation()
	local var2 = useProfileAnalyticsContextModule()
	local var3 = useDispatch()
	local var4 = useProfileWrapperContextModule()
	local var5 = reactModule.useContext(avatarSaveContext)
	local params = p1.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local purchasableLineItems = params.purchasableLineItems or {}
	local var6 = if fFlagProfileUnifiedPurchaseLoggingModule then params.purchasedItems else nil
	local userId = params.userId or ""
	local purchasedWearIds = params.purchasedWearIds or {}
	local ownedAssetIds = params.ownedAssetIds or {}
	local wearTypeMap = params.wearTypeMap or {}
	local var7 = robloxAppHooksModule.useLocalRobuxBalance()
	local var8 = if var7 ~= nil then params.robuxBalance or 0 else var7
	local var9 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), enumsModule (copy), totalPrice (ref), var8 (ref)
		var1.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = totalPrice, robuxBalance = var8 })
	end, { var1, totalPrice, var8 })
	local var10 = useLocalization({
		buyTitle = "IAPExperience.PurchasePrompt.Header.BuyAvatar",
		buyAction = "IAPExperience.PurchasePrompt.Action.Buy",
		totalPrice = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		wearAfterPurchase = "Feature.Catalog.Label.WearAvatarAfterPurchase",
		purchasePartialFailure = "Feature.Avatar.Heading.LooksPurchasePartialSuccess",
		purchaseFailed = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseSuccessSingular = {
			"Feature.Avatar.Message.LooksPurchaseSuccessSingular",
			numItems = 1
		},
		purchaseSuccessPlural = {
			"Feature.Avatar.Message.LooksPurchaseSuccessPlural",
			numItems = #purchasableLineItems
		}
	})
	local var11 = reactModule.useMemo(function()
		-- upvalues: var10 (ref)
		return {
			purchaseSuccessSingular = var10.purchaseSuccessSingular,
			purchaseSuccessPlural = var10.purchaseSuccessPlural,
			purchasePartialFailure = var10.purchasePartialFailure
		}
	end, {
		var10.purchaseSuccessSingular,
		var10.purchaseSuccessPlural,
		var10.purchasePartialFailure
	})
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(true)
	local var16 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var1 (ref)
		if var12 then
			return
		end
		var1.goBack()
	end, { var12, var1 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), purchasableLineItems (ref), var13 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var2 (ref), eventNamesModule (copy), var4 (ref), fFlagProfileUnifiedPurchaseLoggingModule (copy), sendProfilePurchaseEventsModule (copy), marketplaceUnifiedAction (copy), var6 (ref), purchaseBulkItemsModule (copy), userId (ref), handlePurchaseItemsSuccessModule (copy), var14 (ref), purchasedWearIds (ref), ownedAssetIds (ref), wearTypeMap (ref), var5 (ref), var3 (ref), var11 (ref), var1 (ref), getIsInsufficientRobuxError (copy), var9 (ref), setCurrentToastMessage (copy), var10 (ref)
		if var12 or #purchasableLineItems == 0 then return end
		var13(true)
		
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarPurchaseConfirmed, { profileSessionId = var4.profileSessionId })
		else
			var2.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
		end
		if fFlagProfileUnifiedPurchaseLoggingModule then
			sendProfilePurchaseEventsModule(marketplaceUnifiedAction.PURCHASE_ATTEMPT, var6 or {}, var4.profileType)
		end
		purchaseBulkItemsModule({ userId = userId, lineItems = purchasableLineItems }):andThen(function(p2)
			-- upvalues: handlePurchaseItemsSuccessModule (copy), var14 (copy), purchasedWearIds (copy), ownedAssetIds (copy), wearTypeMap (copy), fFlagProfileUnifiedPurchaseLoggingModule (copy), var6 (copy), var4 (copy), var5 (copy), var3 (copy), var11 (copy), var1 (copy)
			handlePurchaseItemsSuccessModule({
				result = p2,
				isWearAfterPurchaseChecked = var14,
				purchasedWearIds = purchasedWearIds,
				ownedAssetIds = ownedAssetIds,
				wearTypeMap = wearTypeMap,
				purchasedItems = if fFlagProfileUnifiedPurchaseLoggingModule then var6 else nil,
				profileWrapperContext = var4,
				avatarSaveContext = var5,
				dispatch = var3,
				localized = var11
			})
			var1.goBack()
		end):catch(function(p2)
			-- upvalues: getIsInsufficientRobuxError (copy), var9 (copy), var3 (copy), setCurrentToastMessage (copy), var10 (copy), var1 (copy)
			if getIsInsufficientRobuxError(p2) then
				var9()
				
				return
			end
			var3(setCurrentToastMessage({
				isLocalized = true,
				toastType = "PurchaseMessage",
				toastMessage = var10.purchaseFailed
			}))
			var1.goBack()
		end):finally(function()
			-- upvalues: var13 (copy)
			var13(false)
		end)
	end, {
		var12, purchasableLineItems, userId, purchasedWearIds, ownedAssetIds,
		wearTypeMap, var14, var2, var1, var3, var11, var4, var5, var9,
		var10.purchaseFailed,
		if fFlagProfileUnifiedPurchaseLoggingModule then var6 else nil
	})
	local var18 = reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
	}, {
		BorderContainer = reactModule.createElement(view, {
			tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
		}, {
			LeftSide = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				Label = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall",
					Text = var10.totalPrice
				})
			}),
			RightSide = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				Price = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
					RichText = true,
					Text = reactModule.useMemo(function()
						-- upvalues: numberLocalization (copy), totalPrice (ref), localizationService (copy), getIconRichText (copy), iconName (copy)
						return `{getIconRichText(iconName.Robux)} {numberLocalization.localize(totalPrice, localizationService.RobloxLocaleId)}`
					end, { totalPrice, localizationService.RobloxLocaleId })
				})
			})
		})
	})
	local var19 = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function()
		-- upvalues: inputHandlersModule (copy), var16 (ref)
		return inputHandlersModule.onRelease(function(p2)
			-- upvalues: var16 (copy)
			p2:cancel()
			var16()
		end)
	end, { var16 }) else nil
	local var20 = nil
	local var21 = nil
	
	if fFlagProfileInspectAndBuyAutoFocusModule then
		local var22, var23 = reactFocusNavigationModule.useDefaultFocusBehavior()
		var20 = var22
		var21 = var23
	end
	local var24 = reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = var16,
		ref = if fFlagProfileInspectAndBuyAutoFocusModule then var21 else nil,
		hasBackdrop = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var10.buyTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 align-x-left" }, {
				PriceTotal = var18,
				WearCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = var10.wearAfterPurchase,
					size = inputSize.XSmall,
					isChecked = var14,
					onActivated = function()
						-- upvalues: var15 (ref), var14 (ref)
						var15(not var14)
					end,
					isDisabled = var12
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var10.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = var17,
					ref = if fFlagProfileInspectAndBuyAutoFocusModule then var20 else nil
				}
			}
		})
	})
	
	return if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = var19 }
		}
	}, { Dialog = var24 }) else var24
end