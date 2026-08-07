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

return function(p0) --[[ line: 56 | named "PurchaseConfirmationModal" ]]
	-- upvalues: useNavigation (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), reactModule (ref), avatarSaveContext (ref), robloxAppHooksModule (ref), enumsModule (ref), useLocalization (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), view (ref), text (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), dialog (ref), dialogSize (ref), checkbox (ref), inputSize (ref), orientation (ref), buttonVariant (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var13 = useNavigation()
	local var14 = useProfileAnalyticsContextModule()
	local var15 = useDispatch()
	local var16 = useProfileWrapperContextModule()
	local var17 = reactModule.useContext(avatarSaveContext)
	local params = p0.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local purchasableLineItems = params.purchasableLineItems or {}
	local userId = params.userId or ""
	local purchasedWearIds = params.purchasedWearIds or {}
	local ownedAssetIds = params.ownedAssetIds or {}
	local wearTypeMap = params.wearTypeMap or {}
	local var25 = robloxAppHooksModule.useLocalRobuxBalance()
	local var26 = if var25 ~= nil then params.robuxBalance or 0 else var25
	local var27 = reactModule.useCallback(function() --[[ line: 73 ]]
		-- upvalues: var13 (ref), enumsModule (copy), totalPrice (ref), var26 (ref)
		var13.navigate(enumsModule.Screens.InsufficientRobuxDialog, { totalPrice = totalPrice, robuxBalance = var26 })
	end, { var13, totalPrice, var26 })
	local var28 = useLocalization({
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
	local var29 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: var28 (ref)
		return {
			purchaseSuccessSingular = var28.purchaseSuccessSingular,
			purchaseSuccessPlural = var28.purchaseSuccessPlural,
			purchasePartialFailure = var28.purchasePartialFailure
		}
	end, {
		var28.purchaseSuccessSingular,
		var28.purchaseSuccessPlural,
		var28.purchasePartialFailure
	})
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(true)
	local var34 = reactModule.useCallback(function() --[[ line: 109 ]]
		-- upvalues: var30 (ref), var13 (ref)
		if var30 then
			return
		end
		var13.goBack()
	end, { var30, var13 })
	local var35 = reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = var34,
		hasBackdrop = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var28.buyTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Body = reactModule.createElement(view, { tag = "col gap-medium auto-y size-full-0 align-x-left" }, {
				PriceTotal = reactModule.createElement(view, {
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
								Text = var28.totalPrice
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
								Text = reactModule.useMemo(function() --[[ line: 187 ]]
									-- upvalues: numberLocalization (copy), totalPrice (ref), localizationService (copy), getIconRichText (copy), iconName (copy)
									return `{getIconRichText(iconName.Robux)} {numberLocalization.localize(totalPrice, localizationService.RobloxLocaleId)}`
								end, { totalPrice, localizationService.RobloxLocaleId })
							})
						})
					})
				}),
				WearCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = var28.wearAfterPurchase,
					size = inputSize.XSmall,
					isChecked = var32,
					onActivated = function() --[[ line: 255 ]]
						-- upvalues: var33 (ref), var32 (ref)
						var33(not var32)
					end,
					isDisabled = var30
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var28.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 117 ]]
						-- upvalues: var30 (ref), purchasableLineItems (ref), var31 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var14 (ref), eventNamesModule (copy), var16 (ref), purchaseBulkItemsModule (copy), userId (ref), handlePurchaseItemsSuccessModule (copy), var32 (ref), purchasedWearIds (ref), ownedAssetIds (ref), wearTypeMap (ref), var17 (ref), var15 (ref), var29 (ref), var13 (ref), getIsInsufficientRobuxError (copy), var27 (ref), setCurrentToastMessage (copy), var28 (ref)
						if var30 or #purchasableLineItems == 0 then return end
						var31(true)
						
						if fFlagSocialEnableProfileInspectAndBuyAnalytics then
							var14.fireAnalyticsEvent(eventNamesModule.InspectAvatarPurchaseConfirmed, { profileSessionId = var16.profileSessionId })
						else
							var14.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
						end
						purchaseBulkItemsModule({ userId = userId, lineItems = purchasableLineItems }):andThen(function(p2) --[[ line: 138 ]]
							-- upvalues: handlePurchaseItemsSuccessModule (copy), var32 (copy), purchasedWearIds (copy), ownedAssetIds (copy), wearTypeMap (copy), var16 (copy), var17 (copy), var15 (copy), var29 (copy), var13 (copy)
							handlePurchaseItemsSuccessModule({
								result = p2,
								isWearAfterPurchaseChecked = var32,
								purchasedWearIds = purchasedWearIds,
								ownedAssetIds = ownedAssetIds,
								wearTypeMap = wearTypeMap,
								profileWrapperContext = var16,
								avatarSaveContext = var17,
								dispatch = var15,
								localized = var29
							})
							var13.goBack()
						end):catch(function(p1) --[[ line: 152 ]]
							-- upvalues: getIsInsufficientRobuxError (copy), var27 (copy), var15 (copy), setCurrentToastMessage (copy), var28 (copy), var13 (copy)
							if getIsInsufficientRobuxError(p1) then
								var27()
								
								return
							end
							var15(setCurrentToastMessage({
								isLocalized = true,
								toastType = "PurchaseMessage",
								toastMessage = var28.purchaseFailed
							}))
							var13.goBack()
						end):finally(function() --[[ line: 164 ]]
							-- upvalues: var31 (copy)
							var31(false)
						end)
					end, {
						var30, purchasableLineItems, userId, purchasedWearIds, ownedAssetIds,
						wearTypeMap, var32, var14, var13, var15, var29, var16, var17, var27,
						var28.purchaseFailed
					})
				}
			}
		})
	})
	
	return if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[focusNavigationEventNameEnum.NavigateBack] = {
				handler = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function() --[[ line: 226 ]]
					-- upvalues: inputHandlersModule (copy), var34 (ref)
					return inputHandlersModule.onRelease(function(p3) --[[ line: 227 ]]
						-- upvalues: var34 (copy)
						p3:cancel()
						var34()
					end)
				end, { var34 }) else nil
			}
		}
	}, { Dialog = var35 }) else var35
end