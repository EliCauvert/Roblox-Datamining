local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NumberLocalization = require(Parent.Localization).NumberLocalization
local AvatarSaveContext = require(Parent.AvatarExperienceSave).Context.AvatarSaveContext
local PurchaseBulkItemsModule = require(ProfilePlatform.Networking.PurchaseBulkItems)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local HandlePurchaseItemsSuccessModule = require(script.Parent.HandlePurchaseItemsSuccess)
local FFlagSocialEnableProfileInspectAndBuyAnalytics = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyAnalytics
local FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav = require(Parent.SharedFlags).FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Checkbox = FoundationModule.Checkbox
local Dialog = FoundationModule.Dialog
local InputSize = FoundationModule.Enums.InputSize
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local IconName = FoundationModule.Enums.IconName
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseProfileAnalyticsContextModule (copy), UseDispatchFunction (copy), UseProfileWrapperContextModule (copy), ReactModule (copy), AvatarSaveContext (copy), UseLocalizationFunction (copy), FFlagSocialEnableProfileInspectAndBuyAnalytics (copy), EventNamesModule (copy), PurchaseBulkItemsModule (copy), HandlePurchaseItemsSuccessModule (copy), NumberLocalization (copy), LocalizationService (copy), GetIconRichTextFunction (copy), IconName (copy), View (copy), Text (copy), FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav (copy), InputHandlersModule (copy), Dialog (copy), DialogSize (copy), Checkbox (copy), InputSize (copy), Orientation (copy), ButtonVariant (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseContextResult = ReactModule.useContext(AvatarSaveContext)
	local Params = p1.navigation.state.params or {}
	local TotalPrice = Params.totalPrice or 0
	local PurchasableLineItems = Params.purchasableLineItems or {}
	local UserId = Params.userId or ""
	local PurchasedWearIds = Params.purchasedWearIds or {}
	local OwnedAssetIds = Params.ownedAssetIds or {}
	local WearTypeMap = Params.wearTypeMap or {}
	local UseLocalizationResult = UseLocalizationFunction({
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
			numItems = #PurchasableLineItems
		}
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			purchaseSuccessSingular = UseLocalizationResult.purchaseSuccessSingular,
			purchaseSuccessPlural = UseLocalizationResult.purchaseSuccessPlural,
			purchasePartialFailure = UseLocalizationResult.purchasePartialFailure
		}
	end, {
		UseLocalizationResult.purchaseSuccessSingular,
		UseLocalizationResult.purchaseSuccessPlural,
		UseLocalizationResult.purchasePartialFailure
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseNavigationResult (copy)
		if not UseStateResult then
			UseNavigationResult.goBack()
			
			return
		end
	end, { UseStateResult, UseNavigationResult })
	local UseMemoResult1 = if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.useMemo(function()
		-- upvalues: InputHandlersModule (upval), UseResult (copy)
		return InputHandlersModule.onRelease(function(p2)
			-- upvalues: UseResult (upval)
			p2:cancel()
			UseResult()
		end)
	end, { UseResult }) else nil
	local Element = ReactModule.createElement(Dialog.Root, {
		size = DialogSize.Small,
		onClose = UseResult,
		hasBackdrop = if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then true else nil
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.buyTitle }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Body = ReactModule.createElement(View, { tag = "col gap-medium auto-y size-full-0 align-x-left" }, {
				PriceTotal = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
				}, {
					BorderContainer = ReactModule.createElement(View, {
						tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
					}, {
						LeftSide = ReactModule.createElement(View, {
							LayoutOrder = 1,
							tag = "row align-y-center gap-small padding-y-xsmall",
							Size = UDim2.new(0.5, 0, 1, 0)
						}, {
							Label = ReactModule.createElement(Text, {
								LayoutOrder = 1,
								tag = "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall",
								Text = UseLocalizationResult.totalPrice
							})
						}),
						RightSide = ReactModule.createElement(View, {
							LayoutOrder = 2,
							tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
							Size = UDim2.new(0.5, 0, 1, 0)
						}, {
							Price = ReactModule.createElement(Text, {
								LayoutOrder = 1,
								tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
								RichText = true,
								Text = ReactModule.useMemo(function(): string
									-- upvalues: NumberLocalization (upval), TotalPrice (copy), LocalizationService (upval), GetIconRichTextFunction (upval), IconName (upval)
									return `{GetIconRichTextFunction(IconName.Robux)} {NumberLocalization.localize(TotalPrice, LocalizationService.RobloxLocaleId)}`
								end, { TotalPrice, LocalizationService.RobloxLocaleId })
							})
						})
					})
				}),
				WearCheckbox = ReactModule.createElement(Checkbox, {
					LayoutOrder = 2,
					label = UseLocalizationResult.wearAfterPurchase,
					size = InputSize.XSmall,
					isChecked = UseStateResult1,
					onActivated = function()
						-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
						UseStateResult2_1(not UseStateResult1)
					end,
					isDisabled = UseStateResult
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Horizontal,
			actions = {
				{
					text = UseLocalizationResult.buyAction,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseStateResult (copy), PurchasableLineItems (copy), UseStateResult2 (copy), FFlagSocialEnableProfileInspectAndBuyAnalytics (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseProfileWrapperContextModuleResult (copy), PurchaseBulkItemsModule (upval), UserId (copy), HandlePurchaseItemsSuccessModule (upval), UseStateResult1 (copy), PurchasedWearIds (copy), OwnedAssetIds (copy), WearTypeMap (copy), UseContextResult (copy), UseDispatchResult (copy), UseMemoResult (copy), UseNavigationResult (copy)
						if UseStateResult or #PurchasableLineItems == 0 then return end
						UseStateResult2(true)
						
						if FFlagSocialEnableProfileInspectAndBuyAnalytics then
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.InspectAvatarPurchaseConfirmed, {
								profileSessionId = UseProfileWrapperContextModuleResult.profileSessionId
							})
						else
							UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, { btnContext = "InspectAvatarBuyAll" })
						end
						PurchaseBulkItemsModule({ userId = UserId, lineItems = PurchasableLineItems }):andThen(function(Result)
							-- upvalues: HandlePurchaseItemsSuccessModule (upval), UseStateResult1 (upval), PurchasedWearIds (upval), OwnedAssetIds (upval), WearTypeMap (upval), UseProfileWrapperContextModuleResult (upval), UseContextResult (upval), UseDispatchResult (upval), UseMemoResult (upval)
							HandlePurchaseItemsSuccessModule({
								result = Result,
								isWearAfterPurchaseChecked = UseStateResult1,
								purchasedWearIds = PurchasedWearIds,
								ownedAssetIds = OwnedAssetIds,
								wearTypeMap = WearTypeMap,
								profileWrapperContext = UseProfileWrapperContextModuleResult,
								avatarSaveContext = UseContextResult,
								dispatch = UseDispatchResult,
								localized = UseMemoResult
							})
						end):finally(function()
							-- upvalues: UseStateResult2 (upval), UseNavigationResult (upval)
							UseStateResult2(false)
							UseNavigationResult.goBack()
						end)
					end, {
						UseStateResult, PurchasableLineItems, UserId, PurchasedWearIds, OwnedAssetIds,
						WearTypeMap, UseStateResult1, UseProfileAnalyticsContextModuleResult,
						UseNavigationResult, UseDispatchResult, UseMemoResult,
						UseProfileWrapperContextModuleResult, UseContextResult
					})
				}
			}
		})
	})
	
	return if FFlagSocialEnableProfileInspectAndBuyConsoleFocusNav then ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = {
			[FocusNavigationEventNameEnum.NavigateBack] = { handler = UseMemoResult1 }
		}
	}, { Dialog = Element }) else Element
end