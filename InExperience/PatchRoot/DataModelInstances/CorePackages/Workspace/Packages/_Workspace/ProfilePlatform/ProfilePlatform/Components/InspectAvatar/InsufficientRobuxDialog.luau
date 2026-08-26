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

local function AmountLine(p1)
	-- upvalues: numberLocalization (ref), localizationService (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref)
	local var1 = if p1.isAlert then "text-title-medium content-alert" else "text-body-medium content-default"
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Label = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, {
			Text = reactModule.createElement(text, {
				Text = p1.label,
				tag = `auto-xy text-align-x-left {var1}`
			})
		}),
		Amount = reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
			Text = reactModule.createElement(text, {
				RichText = true,
				Text = `{getIconRichText(iconName.Robux)} {numberLocalization.localize(p1.amount, localizationService.RobloxLocaleId)}`,
				tag = `auto-xy text-align-x-right {var1}`
			})
		})
	})
end

return function(p1)
	-- upvalues: useNavigation (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), useProfileAnalyticsContextModule (ref), fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule (ref), robloxAppHooksModule (ref), reactModule (ref), eventNamesModule (ref), useLocalization (ref), useOpenRobuxUpsellModule (ref), fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule (ref), fFlagProfileInspectAndBuyAutoFocusModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), AmountLine (ref), orientation (ref), buttonVariant (ref)
	local var1 = useNavigation()
	local var2 = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then useProfileAnalyticsContextModule() else nil
	local params = p1.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local var3 = if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule then robloxAppHooksModule.useLocalRobuxBalance() else nil
	local var4 = if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule and var3 ~= nil then var3 else params.robuxBalance or 0
	local maxValue = math.max(totalPrice - var4, 0)
	
	if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), eventNamesModule (copy), totalPrice (ref)
			var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarInsufficientRobuxShown, { totalPrice = totalPrice })
		end, { var2, totalPrice })
	end
	local var5 = useLocalization({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		var1.goBack()
	end, { var1 })
	local var7 = useOpenRobuxUpsellModule(totalPrice)
	local var8 = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then reactModule.useCallback(function()
		-- upvalues: var2 (ref), eventNamesModule (copy), totalPrice (ref), var7 (ref)
		var2.fireAnalyticsEvent(eventNamesModule.InspectAvatarBuyRobuxClicked, { totalPrice = totalPrice })
		var7()
	end, { var7, var2, totalPrice }) else nil
	
	if fFlagProfileInspectAndBuyKeepUpsellDialogOpenModule then
		reactModule.useEffect(function()
			-- upvalues: var4 (ref), totalPrice (ref), var6 (ref)
			if totalPrice <= var4 then
				var6()
			end
		end, { var4, totalPrice, var6 })
	end
	local var9 = nil
	local var10 = nil
	
	if fFlagProfileInspectAndBuyAutoFocusModule then
		local var11, var12 = reactFocusNavigationModule.useDefaultFocusBehavior()
		var9 = var11
		var10 = var12
	end
	return reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var6 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var6 (copy)
						p2:cancel()
						var6()
					end)
				}
			}
		end, { var6 })
	}, {
		Dialog = reactModule.createElement(dialog.Root, {
			hasBackdrop = true,
			size = dialogSize.Small,
			onClose = var6,
			ref = if fFlagProfileInspectAndBuyAutoFocusModule then var10 else nil
		}, {
			Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var5.title }),
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
								label = var5.currentBalance,
								amount = var4
							}),
							MissingRobux = reactModule.createElement(AmountLine, {
								layoutOrder = 2,
								isAlert = true,
								label = var5.missingRobux,
								amount = maxValue
							})
						}),
						OrderTotal = reactModule.createElement(AmountLine, {
							layoutOrder = 2,
							label = var5.orderTotal,
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
						text = var5.buyRobux,
						variant = buttonVariant.Emphasis,
						ref = if fFlagProfileInspectAndBuyAutoFocusModule then var9 else nil,
						onActivated = if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then var8 else var7
					}
				}
			})
		})
	})
end