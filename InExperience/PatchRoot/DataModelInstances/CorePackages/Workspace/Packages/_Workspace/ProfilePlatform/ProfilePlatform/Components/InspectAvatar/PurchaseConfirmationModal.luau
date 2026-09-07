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
local enumsModule = require(profilePlatform.Common.Enums)
local purchaseBulkItemsModule = require(profilePlatform.Networking.PurchaseBulkItems)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local handlePurchaseItemsSuccessModule = require(script.Parent.HandlePurchaseItemsSuccess)
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
	-- upvalues: useNavigation (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), reactModule (ref), avatarSaveContext (ref), robloxAppHooksModule (ref), enumsModule (ref), useLocalization (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), view (ref), text (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), fFlagProfileInspectAndBuyAutoFocusModule (ref), reactFocusNavigationModule (ref), dialog (ref), dialogSize (ref), checkbox (ref), inputSize (ref), orientation (ref), buttonVariant (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var1 = useNavigation()
	local var2 = useProfileAnalyticsContextModule()
	local var3 = useDispatch()
	local var4 = useProfileWrapperContextModule()
	local var5 = reactModule.useContext(avatarSaveContext)
	local params = p1.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local purchasableLineItems = params.purchasableLineItems or {}
	local userId = params.userId or ""
	local purchasedWearIds = params.purchasedWearIds or {}
	local ownedAssetIds = params.ownedAssetIds or {}
	local wearTypeMap = params.wearTypeMap or {}
	local var6 = robloxAppHooksModule.useLocalRobuxBalance()
	local var7 = if var6 ~= nil then params.robuxBalance or 0 else var6
	local var8 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), enumsModule (copy), totalPrice (ref), var7 (ref)
		var1.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = totalPrice, robuxBalance = var7 })
	end, { var1, totalPrice, var7 })
	local var9 = useLocalization({
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
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref)
		return {
			purchaseSuccessSingular = var9.purchaseSuccessSingular,
			purchaseSuccessPlural = var9.purchaseSuccessPlural,
			purchasePartialFailure = var9.purchasePartialFailure
		}
	end, {
		var9.purchaseSuccessSingular,
		var9.purchaseSuccessPlural,
		var9.purchasePartialFailure
	})
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(true)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var1 (ref)
		if var11 then
			return
		end
		var1.goBack()
	end, { var11, var1 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), purchasableLineItems (ref), var12 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var2 (ref), eventNamesModule (copy), var4 (ref), purchaseBulkItemsModule (copy), userId (ref), handlePurchaseItemsSuccessModule (copy), var13 (ref), purchasedWearIds (ref), ownedAssetIds (ref), wearTypeMap (ref), var5 (ref), var3 (ref), var10 (ref), var1 (ref), getIsInsufficientRobuxError (copy), var8 (ref), setCurrentToastMessage (copy), var9 (ref)
		if var11 or #purchasableLineItems == 0 then return end
		var12(true)
		
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarPurchaseConfirmed, { profileSessionId = var4.profileSessionId })
		else
			var2.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
		end
		purchaseBulkItemsModule({ userId = userId, lineItems = purchasableLineItems }):andThen(function(p2)
			-- upvalues: handlePurchaseItemsSuccessModule (copy), var13 (copy), purchasedWearIds (copy), ownedAssetIds (copy), wearTypeMap (copy), var4 (copy), var5 (copy), var3 (copy), var10 (copy), var1 (copy)
			handlePurchaseItemsSuccessModule({
				result = p2,
				isWearAfterPurchaseChecked = var13,
				purchasedWearIds = purchasedWearIds,
				ownedAssetIds = ownedAssetIds,
				wearTypeMap = wearTypeMap,
				profileWrapperContext = var4,
				avatarSaveContext = var5,
				dispatch = var3,
				localized = var10
			})
			var1.goBack()
		end):catch(function(p2)
			-- upvalues: getIsInsufficientRobuxError (copy), var8 (copy), var3 (copy), setCurrentToastMessage (copy), var9 (copy), var1 (copy)
			if getIsInsufficientRobuxError(p2) then
				var8()
				
				return
			end
			var3(setCurrentToastMessage({
				isLocalized = true,
				toastType = "PurchaseMessage",
				toastMessage = var9.purchaseFailed
			}))
			var1.goBack()
		end):finally(function()
			-- upvalues: var12 (copy)
			var12(false)
		end)
	end, {
		var11, purchasableLineItems, userId, purchasedWearIds, ownedAssetIds,
		wearTypeMap, var13, var2, var1, var3, var10, var4, var5, var8,
		var9.purchaseFailed
	})
	local var17 = reactModule.createElement(view, {
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
					Text = var9.totalPrice
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
	local var18 = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function()
		-- upvalues: inputHandlersModule (copy), var15 (ref)
		return inputHandlersModule.onRelease(function(p2)
			-- upvalues: var15 (copy)
			p2:cancel()
			var15()
		end)
	end, { var15 }) else nil
	local var19 = nil
	local var20 = nil
	
	if fFlagProfileInspectAndBuyAutoFocusModule then
		local var21, var22 = reactFocusNavigationModule.useDefaultFocusBehavior()
		var19 = var21
		var20 = var22
	end
	local var23 = reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = var15,
		ref = if fFlagProfileInspectAndBuyAutoFocusModule then var20 else nil,
		hasBackdrop = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var9.buyTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 align-x-left" }, {
				PriceTotal = var17,
				WearCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = var9.wearAfterPurchase,
					size = inputSize.XSmall,
					isChecked = var13,
					onActivated = function()
						-- upvalues: var14 (ref), var13 (ref)
						var14(not var13)
					end,
					isDisabled = var11
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var9.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = var16,
					ref = if fFlagProfileInspectAndBuyAutoFocusModule then var19 else nil
				}
			}
		})
	})
	
	return if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = var18 }
		}
	}, { Dialog = var23 }) else var23
end