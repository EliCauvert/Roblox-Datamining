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

return function(p0) --[[ line: 50 | named "PurchaseConfirmationModal" ]]
	-- upvalues: useNavigation (ref), useProfileAnalyticsContextModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), reactModule (ref), avatarSaveContext (ref), useLocalization (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (ref), eventNamesModule (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), view (ref), text (ref), fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (ref), inputHandlersModule (ref), dialog (ref), dialogSize (ref), checkbox (ref), inputSize (ref), orientation (ref), buttonVariant (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref)
	local var11 = useNavigation()
	local var12 = useProfileAnalyticsContextModule()
	local var13 = useDispatch()
	local var14 = useProfileWrapperContextModule()
	local var15 = reactModule.useContext(avatarSaveContext)
	local params = p0.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local purchasableLineItems = params.purchasableLineItems or {}
	local userId = params.userId or ""
	local purchasedWearIds = params.purchasedWearIds or {}
	local ownedAssetIds = params.ownedAssetIds or {}
	local wearTypeMap = params.wearTypeMap or {}
	local var23 = useLocalization({
		buyTitle = "IAPExperience.PurchasePrompt.Header.BuyAvatar",
		buyAction = "IAPExperience.PurchasePrompt.Action.Buy",
		totalPrice = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		wearAfterPurchase = "Feature.Catalog.Label.WearAvatarAfterPurchase",
		purchasePartialFailure = "Feature.Avatar.Heading.LooksPurchasePartialSuccess",
		purchaseSuccessSingular = {
			"Feature.Avatar.Message.LooksPurchaseSuccessSingular",
			numItems = 1
		},
		purchaseSuccessPlural = {
			"Feature.Avatar.Message.LooksPurchaseSuccessPlural",
			numItems = #purchasableLineItems
		}
	})
	local var24 = reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var23 (ref)
		return {
			purchaseSuccessSingular = var23.purchaseSuccessSingular,
			purchaseSuccessPlural = var23.purchaseSuccessPlural,
			purchasePartialFailure = var23.purchasePartialFailure
		}
	end, {
		var23.purchaseSuccessSingular,
		var23.purchaseSuccessPlural,
		var23.purchasePartialFailure
	})
	local var25, var26 = reactModule.useState(false)
	local var27, var28 = reactModule.useState(true)
	local var29 = reactModule.useCallback(function() --[[ line: 93 ]]
		-- upvalues: var25 (ref), var11 (ref)
		if var25 then
			return
		end
		var11.goBack()
	end, { var25, var11 })
	local var30 = reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = var29,
		hasBackdrop = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var23.buyTitle }),
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
								Text = var23.totalPrice
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
								Text = reactModule.useMemo(function() --[[ line: 154 ]]
									-- upvalues: numberLocalization (copy), totalPrice (ref), localizationService (copy), getIconRichText (copy), iconName (copy)
									return `{getIconRichText(iconName.Robux)} {numberLocalization.localize(totalPrice, localizationService.RobloxLocaleId)}`
								end, { totalPrice, localizationService.RobloxLocaleId })
							})
						})
					})
				}),
				WearCheckbox = reactModule.createElement(checkbox, {
					LayoutOrder = 2,
					label = var23.wearAfterPurchase,
					size = inputSize.XSmall,
					isChecked = var27,
					onActivated = function() --[[ line: 222 ]]
						-- upvalues: var28 (ref), var27 (ref)
						var28(not var27)
					end,
					isDisabled = var25
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var23.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 101 ]]
						-- upvalues: var25 (ref), purchasableLineItems (ref), var26 (ref), fFlagSocialEnableProfileInspectAndBuyAnalytics (copy), var12 (ref), eventNamesModule (copy), var14 (ref), purchaseBulkItemsModule (copy), userId (ref), handlePurchaseItemsSuccessModule (copy), var27 (ref), purchasedWearIds (ref), ownedAssetIds (ref), wearTypeMap (ref), var15 (ref), var13 (ref), var24 (ref), var11 (ref)
						if var25 or #purchasableLineItems == 0 then return end
						var26(true)
						
						if fFlagSocialEnableProfileInspectAndBuyAnalytics then
							var12.fireAnalyticsEvent(eventNamesModule.InspectAvatarPurchaseConfirmed, { profileSessionId = var14.profileSessionId })
						else
							var12.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
						end
						purchaseBulkItemsModule({ userId = userId, lineItems = purchasableLineItems }):andThen(function(p1) --[[ line: 120 ]]
							-- upvalues: handlePurchaseItemsSuccessModule (copy), var27 (copy), purchasedWearIds (copy), ownedAssetIds (copy), wearTypeMap (copy), var14 (copy), var15 (copy), var13 (copy), var24 (copy)
							handlePurchaseItemsSuccessModule({
								result = p1,
								isWearAfterPurchaseChecked = var27,
								purchasedWearIds = purchasedWearIds,
								ownedAssetIds = ownedAssetIds,
								wearTypeMap = wearTypeMap,
								profileWrapperContext = var14,
								avatarSaveContext = var15,
								dispatch = var13,
								localized = var24
							})
						end):finally(function() --[[ line: 132 ]]
							-- upvalues: var26 (copy), var11 (copy)
							var26(false)
							var11.goBack()
						end)
					end, {
						var25, purchasableLineItems, userId, purchasedWearIds, ownedAssetIds,
						wearTypeMap, var27, var12, var11, var13, var24, var14, var15
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
				handler = if fFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then reactModule.useMemo(function() --[[ line: 193 ]]
					-- upvalues: inputHandlersModule (copy), var29 (ref)
					return inputHandlersModule.onRelease(function(p2) --[[ line: 194 ]]
						-- upvalues: var29 (copy)
						p2:cancel()
						var29()
					end)
				end, { var29 }) else nil
			}
		}
	}, { Dialog = var30 }) else var30
end