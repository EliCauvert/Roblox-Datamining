local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local numberLocalization = require(parent.Localization).NumberLocalization
local useOpenRobuxUpsellModule = require(script.Parent.useOpenRobuxUpsell)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefreshBalanceAfterPurchase)
local fFlagProfileInspectAndBuyAutoFocusModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyAutoFocus)
local fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyKeepUpsellDialogOpen)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local view = foundationModule.View
local text = foundationModule.Text
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local iconName = foundationModule.Enums.IconName
local getIconRichText = foundationModule.Utility.getIconRichText

local function AmountLine(p0)
	-- upvalues: numberLocalization (ref), localizationService (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref)
	local var16 = if p0.isAlert then "text-title-medium content-alert" else "text-body-medium content-default"
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Label = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, {
			Text = reactModule.createElement(text, {
				Text = p0.label,
				tag = `auto-xy text-align-x-left {var16}`
			})
		}),
		Amount = reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
			Text = reactModule.createElement(text, {
				RichText = true,
				Text = `{getIconRichText(iconName.Robux)} {numberLocalization.localize(p0.amount, localizationService.RobloxLocaleId)}`,
				tag = `auto-xy text-align-x-right {var16}`
			})
		})
	})
end

return function(p1)
	-- upvalues: useNavigation (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), useProfileAnalyticsContextModule (ref), fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule (ref), robloxAppHooksModule (ref), reactModule (ref), eventNamesModule (ref), useLocalization (ref), useOpenRobuxUpsellModule (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (ref), fFlagProfileInspectAndBuyAutoFocusModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), AmountLine (ref), orientation (ref), buttonVariant (ref)
	local var17 = useNavigation()
	local var18 = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then useProfileAnalyticsContextModule() else nil
	local params = p1.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local var21 = if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule then robloxAppHooksModule.useLocalRobuxBalance() else nil
	local var22 = if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule and var21 ~= nil then var21 else params.robuxBalance or 0
	local maxValue = math.max(totalPrice - var22, 0)
	
	if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
		reactModule.useEffect(function()
			-- upvalues: var18 (ref), eventNamesModule (copy), totalPrice (ref)
			var18.fireAnalyticsEvent(eventNamesModule.InspectAvatarInsufficientRobuxShown, { totalPrice = totalPrice })
		end, { var18, totalPrice })
	end
	local var24 = useLocalization({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17.goBack()
	end, { var17 })
	local var26 = useOpenRobuxUpsellModule(totalPrice)
	local var27 = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then reactModule.useCallback(function()
		-- upvalues: var18 (ref), eventNamesModule (copy), totalPrice (ref), var26 (ref)
		var18.fireAnalyticsEvent(eventNamesModule.InspectAvatarBuyRobuxClicked, { totalPrice = totalPrice })
		var26()
	end, { var26, var18, totalPrice }) else nil
	
	if fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
		reactModule.useEffect(function()
			-- upvalues: var22 (ref), totalPrice (ref), var25 (ref)
			if totalPrice <= var22 then
				var25()
			end
		end, { var22, totalPrice, var25 })
	end
	local var28 = nil
	local var29 = nil
	
	if fFlagProfileInspectAndBuyAutoFocusModule then
		local var30, var31 = reactFocusNavigationModule.useDefaultFocusBehavior()
		var28 = var30
		var29 = var31
	end
	return reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var25 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var25 (copy)
						p2:cancel()
						var25()
					end)
				}
			}
		end, { var25 })
	}, {
		Dialog = reactModule.createElement(dialog.Root, {
			hasBackdrop = true,
			size = dialogSize.Small,
			onClose = var25,
			ref = if fFlagProfileInspectAndBuyAutoFocusModule then var29 else nil
		}, {
			Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var24.title }),
			Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
				PriceBoxPadding = reactModule.createElement(view, { tag = "size-full-0 auto-y padding-xxsmall" }, {
					PriceBox = reactModule.createElement(view, {
						tag = "col gap-large size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium"
					}, {
						BalanceLines = reactModule.createElement(view, {
							LayoutOrder = 1,
							tag = "col gap-xsmall size-full-0 auto-y"
						}, {
							CurrentBalance = reactModule.createElement(AmountLine, {
								layoutOrder = 1,
								label = var24.currentBalance,
								amount = var22
							}),
							MissingRobux = reactModule.createElement(AmountLine, {
								layoutOrder = 2,
								isAlert = true,
								label = var24.missingRobux,
								amount = maxValue
							})
						}),
						OrderTotal = reactModule.createElement(AmountLine, {
							layoutOrder = 2,
							label = var24.orderTotal,
							amount = totalPrice
						})
					})
				})
			}),
			Actions = reactModule.createElement(dialog.Actions, {
				LayoutOrder = 3,
				orientation = orientation.Horizontal,
				actions = {
					{
						text = var24.buyRobux,
						variant = buttonVariant.Emphasis,
						ref = if fFlagProfileInspectAndBuyAutoFocusModule then var28 else nil,
						onActivated = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then var27 else var26
					}
				}
			})
		})
	})
end