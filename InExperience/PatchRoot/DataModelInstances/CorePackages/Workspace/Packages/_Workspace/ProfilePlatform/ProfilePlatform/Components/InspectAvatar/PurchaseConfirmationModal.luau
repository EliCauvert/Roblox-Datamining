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

return function(p0) --[[ line: 58 | named "PurchaseConfirmationModal" ]]
	-- upvalues: useNavigation (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), reactModule (ref), avatarSaveContext (ref), robloxAppHooksModule (ref), enumsModule (ref), useLocalization (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), view (ref), text (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), fFlagProfileInspectAndBuyAutoFocusModule (ref), reactFocusNavigationModule (ref), dialog (ref), dialogSize (ref), checkbox (ref), inputSize (ref), orientation (ref), buttonVariant (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var15 = useNavigation()
	local var16 = useProfileAnalyticsContextModule()
	local var17 = useDispatch()
	local var18 = useProfileWrapperContextModule()
	local var19 = reactModule.useContext(avatarSaveContext)
	local params = p0.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local purchasableLineItems = params.purchasableLineItems or {}
	local userId = params.userId or ""
	local purchasedWearIds = params.purchasedWearIds or {}
	local ownedAssetIds = params.ownedAssetIds or {}
	local wearTypeMap = params.wearTypeMap or {}
	local var27 = robloxAppHooksModule.useLocalRobuxBalance()
	local var28 = if var27 ~= nil then params.robuxBalance or 0 else var27
	local var29 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: var15 (ref), enumsModule (copy), totalPrice (ref), var28 (ref)
		var15.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = totalPrice, robuxBalance = var28 })
	end, { var15, totalPrice, var28 })
	local var30 = useLocalization({
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
	local var31 = reactModule.useMemo(function() --[[ line: 96 ]]
		-- upvalues: var30 (ref)
		return {
			purchaseSuccessSingular = var30.purchaseSuccessSingular,
			purchaseSuccessPlural = var30.purchaseSuccessPlural,
			purchasePartialFailure = var30.purchasePartialFailure
		}
	end, {
		var30.purchaseSuccessSingular,
		var30.purchaseSuccessPlural,
		var30.purchasePartialFailure
	})
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(true)
	local var36 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var32 (ref), var15 (ref)
		if var32 then
			return
		end
		var15.goBack()
	end, { var32, var15 })
	local var37 = reactModule.useCallback(function() --[[ line: 119 ]]
		-- upvalues: var32 (ref), purchasableLineItems (ref), var33 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var16 (ref), eventNamesModule (copy), var18 (ref), purchaseBulkItemsModule (copy), userId (ref), handlePurchaseItemsSuccessModule (copy), var34 (ref), purchasedWearIds (ref), ownedAssetIds (ref), wearTypeMap (ref), var19 (ref), var17 (ref), var31 (ref), var15 (ref), getIsInsufficientRobuxError (copy), var29 (ref), setCurrentToastMessage (copy), var30 (ref)
		if var32 or #purchasableLineItems == 0 then return end
		var33(true)
		
		if fFlagSocialEnableProfileInspectAndBuyAnalytics then
			var16.fireAnalyticsEvent(eventNamesModule.InspectAvatarPurchaseConfirmed, { profileSessionId = var18.profileSessionId })
		else
			var16.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
		end
		purchaseBulkItemsModule({ userId = userId, lineItems = purchasableLineItems }):andThen(function(p2) --[[ line: 140 ]]
			-- upvalues: handlePurchaseItemsSuccessModule (copy), var34 (copy), purchasedWearIds (copy), ownedAssetIds (copy), wearTypeMap (copy), var18 (copy), var19 (copy), var17 (copy), var31 (copy), var15 (copy)
			handlePurchaseItemsSuccessModule({
				result = p2,
				isWearAfterPurchaseChecked = var34,
				purchasedWearIds = purchasedWearIds,
				ownedAssetIds = ownedAssetIds,
				wearTypeMap = wearTypeMap,
				profileWrapperContext = var18,
				avatarSaveContext = var19,
				dispatch = var17,
				localized = var31
			})
			var15.goBack()
		end):catch(function(p1) --[[ line: 154 ]]
			-- upvalues: getIsInsufficientRobuxError (copy), var29 (copy), var17 (copy), setCurrentToastMessage (copy), var30 (copy), var15 (copy)
			if getIsInsufficientRobuxError(p1) then
				var29()
				
				return
			end
			var17(setCurrentToastMessage({
				isLocalized = true,
				toastType = "PurchaseMessage",
				toastMessage = var30.purchaseFailed
			}))
			var15.goBack()
		end):finally(function() --[[ line: 166 ]]
			-- upvalues: var33 (copy)
			var33(false)
		end)
	end, {
		var32, purchasableLineItems, userId, purchasedWearIds, ownedAssetIds,
		wearTypeMap, var34, var16, var15, var17, var31, var18, var19, var29,
		var30.purchaseFailed
	})
	local var38 = reactModule.createElement(view, {
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
					Text = var30.totalPrice
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
					Text = reactModule.useMemo(function() --[[ line: 189 ]]
						-- upvalues: numberLocalization (copy), totalPrice (ref), localizationService (copy), getIconRichText (copy), iconName (copy)
						return `{getIconRichText(iconName.Robux)} {numberLocalization.localize(totalPrice, localizationService.RobloxLocaleId)}`
					end, { totalPrice, localizationService.RobloxLocaleId })
				})
			})
		})
	})
	local var39 = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function() --[[ line: 228 ]]
		-- upvalues: inputHandlersModule (copy), var36 (ref)
		return inputHandlersModule.onRelease(function(p3) --[[ line: 229 ]]
			-- upvalues: var36 (copy)
			p3:cancel()
			var36()
		end)
	end, { var36 }) else nil
	local var40 = nil
	local var41 = nil
	
	if fFlagProfileInspectAndBuyAutoFocusModule then
		local var42, var43 = reactFocusNavigationModule.useDefaultFocusBehavior()
		var40 = var42
		var41 = var43
	end
	local var44 = reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = var36,
		ref = if fFlagProfileInspectAndBuyAutoFocusModule then var41 else nil,
		hasBackdrop = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var30.buyTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 align-x-left" }, {
				PriceTotal = var38,
				WearCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = var30.wearAfterPurchase,
					size = inputSize.XSmall,
					isChecked = var34,
					onActivated = function() --[[ line: 263 ]]
						-- upvalues: var35 (ref), var34 (ref)
						var35(not var34)
					end,
					isDisabled = var32
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var30.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = var37,
					ref = if fFlagProfileInspectAndBuyAutoFocusModule then var40 else nil
				}
			}
		})
	})
	
	return if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = var39 }
		}
	}, { Dialog = var44 }) else var44
end