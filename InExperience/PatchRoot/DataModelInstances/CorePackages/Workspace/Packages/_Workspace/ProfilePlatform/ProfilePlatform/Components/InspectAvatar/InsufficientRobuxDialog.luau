local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalization = require(parent.Localization).Hooks.useLocalization
local numberLocalization = require(parent.Localization).NumberLocalization
local useOpenRobuxUpsellModule = require(script.Parent.useOpenRobuxUpsell)
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

local function AmountLine(p0) --[[ line: 31 ]]
	-- upvalues: numberLocalization (ref), localizationService (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), iconName (ref)
	local var7 = if p0.isAlert then "text-title-medium content-alert" else "text-body-medium content-default"
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Label = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill auto-y" }, {
			Text = reactModule.createElement(text, {
				Text = p0.label,
				tag = `auto-xy text-align-x-left {var7}`
			})
		}),
		Amount = reactModule.createElement(view, { LayoutOrder = 2, tag = "auto-xy" }, {
			Text = reactModule.createElement(text, {
				RichText = true,
				Text = `{getIconRichText(iconName.Robux)} {numberLocalization.localize(p0.amount, localizationService.RobloxLocaleId)}`,
				tag = `auto-xy text-align-x-right {var7}`
			})
		})
	})
end

return function(p1) --[[ line: 70 | named "InsufficientRobuxDialog" ]]
	-- upvalues: useNavigation (ref), useLocalization (ref), reactModule (ref), useOpenRobuxUpsellModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), AmountLine (ref), orientation (ref), buttonVariant (ref)
	local var8 = useNavigation()
	local params = p1.navigation.state.params or {}
	local totalPrice = params.totalPrice or 0
	local robuxBalance = params.robuxBalance or 0
	local maxValue = math.max(totalPrice - robuxBalance, 0)
	local var13 = useLocalization({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	local var14 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: var8 (ref)
		var8.goBack()
	end, { var8 })
	
	return reactModule.createElement(appFocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay,
		customEventHandlers = reactModule.useMemo(function() --[[ line: 91 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var14 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2) --[[ line: 94 ]]
						-- upvalues: var14 (copy)
						p2:cancel()
						var14()
					end)
				}
			}
		end, { var14 })
	}, {
		Dialog = reactModule.createElement(dialog.Root, {
			hasBackdrop = true,
			size = dialogSize.Small,
			onClose = var14
		}, {
			Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var13.title }),
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
								label = var13.currentBalance,
								amount = robuxBalance
							}),
							MissingRobux = reactModule.createElement(AmountLine, {
								layoutOrder = 2,
								isAlert = true,
								label = var13.missingRobux,
								amount = maxValue
							})
						}),
						OrderTotal = reactModule.createElement(AmountLine, {
							layoutOrder = 2,
							label = var13.orderTotal,
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
						text = var13.buyRobux,
						variant = buttonVariant.Emphasis,
						onActivated = useOpenRobuxUpsellModule(totalPrice)
					}
				}
			})
		})
	})
end