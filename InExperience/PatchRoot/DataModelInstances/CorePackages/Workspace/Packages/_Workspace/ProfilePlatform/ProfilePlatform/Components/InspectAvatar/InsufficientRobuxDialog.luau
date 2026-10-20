local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NumberLocalization = require(Parent.Localization).NumberLocalization
local UseOpenRobuxUpsellModule = require(script.Parent.useOpenRobuxUpsell)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local FFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule = require(ProfilePlatform.Flags.FFlagProfileInspectAndBuyRefreshBalanceAfterPurchase)
local FFlagProfileInspectAndBuyAutoFocusModule = require(ProfilePlatform.Flags.FFlagProfileInspectAndBuyAutoFocus)
local FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule = require(ProfilePlatform.Flags.FFlagProfileInspectAndBuyKeepUpsellDialogOpen)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(ProfilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local IconName = FoundationModule.Enums.IconName
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText

local function AmountLine(p1)
	-- upvalues: NumberLocalization (copy), LocalizationService (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), IconName (copy)
	local TextTitleMediumContentAlert: string = if p1.isAlert then "text-title-medium content-alert" else "text-body-medium content-default"
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Label = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill auto-y" }, {
			Text = ReactModule.createElement(Text, {
				Text = p1.label,
				tag = `auto-xy text-align-x-left {TextTitleMediumContentAlert}`
			})
		}),
		Amount = ReactModule.createElement(View, { LayoutOrder = 2, tag = "auto-xy" }, {
			Text = ReactModule.createElement(Text, {
				RichText = true,
				Text = `{GetIconRichTextFunction(IconName.Robux)} {NumberLocalization.localize(p1.amount, LocalizationService.RobloxLocaleId)}`,
				tag = `auto-xy text-align-x-right {TextTitleMediumContentAlert}`
			})
		})
	})
end

return function(p1)
	-- upvalues: UseNavigationFunction (copy), FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), UseProfileAnalyticsContextModule (copy), FFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule (copy), RobloxAppHooksModule (copy), ReactModule (copy), EventNamesModule (copy), UseLocalizationFunction (copy), UseOpenRobuxUpsellModule (copy), FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (copy), FFlagProfileInspectAndBuyAutoFocusModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), Dialog (copy), DialogSize (copy), View (copy), AmountLine (copy), Orientation (copy), ButtonVariant (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseProfileAnalyticsContextModuleResult = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then UseProfileAnalyticsContextModule() else nil
	local Params = p1.navigation.state.params or {}
	local TotalPrice = Params.totalPrice or 0
	local UseLocalRobuxBalanceResult = if FFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule then RobloxAppHooksModule.useLocalRobuxBalance() else nil
	local UseLocalRobuxBalanceResult1 = if FFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule and UseLocalRobuxBalanceResult ~= nil then UseLocalRobuxBalanceResult else Params.robuxBalance or 0
	local Largest = math.max(TotalPrice - UseLocalRobuxBalanceResult1, 0)
	
	if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
		ReactModule.useEffect(function()
			-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), TotalPrice (copy)
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.InspectAvatarInsufficientRobuxShown, { totalPrice = TotalPrice })
		end, { UseProfileAnalyticsContextModuleResult, TotalPrice })
	end
	local UseLocalizationResult = UseLocalizationFunction({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseOpenRobuxUpsellModuleResult = UseOpenRobuxUpsellModule(TotalPrice)
	local UseResult1 = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then ReactModule.useCallback(function()
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), TotalPrice (copy), UseOpenRobuxUpsellModuleResult (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.InspectAvatarBuyRobuxClicked, { totalPrice = TotalPrice })
		UseOpenRobuxUpsellModuleResult()
	end, {
		UseOpenRobuxUpsellModuleResult,
		UseProfileAnalyticsContextModuleResult,
		TotalPrice
	}) else nil
	
	if FFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
		ReactModule.useEffect(function()
			-- upvalues: UseLocalRobuxBalanceResult1 (copy), TotalPrice (copy), UseResult (copy)
			if TotalPrice <= UseLocalRobuxBalanceResult1 then
				UseResult()
			end
		end, { UseLocalRobuxBalanceResult1, TotalPrice, UseResult })
	end
	local v1 = nil
	local v2 = nil
	
	if FFlagProfileInspectAndBuyAutoFocusModule then
		v1, v41 = ReactFocusNavigationModule.useDefaultFocusBehavior()
	end
	return ReactModule.createElement(AppFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseResult (upval)
						p2:cancel()
						UseResult()
					end)
				}
			}
		end, { UseResult })
	}, {
		Dialog = ReactModule.createElement(Dialog.Root, {
			hasBackdrop = true,
			size = DialogSize.Small,
			onClose = UseResult,
			ref = if FFlagProfileInspectAndBuyAutoFocusModule then v2 else nil
		}, {
			Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
			Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				PriceBoxPadding = ReactModule.createElement(View, { tag = "size-full-0 auto-y padding-xxsmall" }, {
					PriceBox = ReactModule.createElement(View, {
						tag = "col gap-large size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium"
					}, {
						BalanceLines = ReactModule.createElement(View, {
							LayoutOrder = 1,
							tag = "col gap-xsmall size-full-0 auto-y"
						}, {
							CurrentBalance = ReactModule.createElement(AmountLine, {
								layoutOrder = 1,
								label = UseLocalizationResult.currentBalance,
								amount = UseLocalRobuxBalanceResult1
							}),
							MissingRobux = ReactModule.createElement(AmountLine, {
								layoutOrder = 2,
								isAlert = true,
								label = UseLocalizationResult.missingRobux,
								amount = Largest
							})
						}),
						OrderTotal = ReactModule.createElement(AmountLine, {
							layoutOrder = 2,
							label = UseLocalizationResult.orderTotal,
							amount = TotalPrice
						})
					})
				})
			}),
			Actions = ReactModule.createElement(Dialog.Actions, {
				LayoutOrder = 3,
				orientation = Orientation.Horizontal,
				actions = {
					{
						text = UseLocalizationResult.buyRobux,
						variant = ButtonVariant.Emphasis,
						ref = if FFlagProfileInspectAndBuyAutoFocusModule then v1 else nil,
						onActivated = if FFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then UseResult1 else UseOpenRobuxUpsellModuleResult
					}
				}
			})
		})
	})
end