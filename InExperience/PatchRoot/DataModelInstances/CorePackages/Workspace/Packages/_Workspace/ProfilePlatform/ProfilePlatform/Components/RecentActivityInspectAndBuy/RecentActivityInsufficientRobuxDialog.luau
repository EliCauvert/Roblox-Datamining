local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local numberLocalization = require(parent.Localization).NumberLocalization
local useOpenRobuxUpsellModule = require(profilePlatform.Components.InspectAvatar.useOpenRobuxUpsell)
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
	-- upvalues: useLocalization (ref), useOpenRobuxUpsellModule (ref), reactModule (ref), dialog (ref), dialogSize (ref), view (ref), AmountLine (ref), orientation (ref), buttonVariant (ref)
	local totalPrice = p1.totalPrice
	local robuxBalance = p1.robuxBalance
	local var1 = useLocalization({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Small,
		onClose = p1.onClose
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
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
							label = var1.currentBalance,
							amount = robuxBalance
						}),
						MissingRobux = reactModule.createElement(AmountLine, {
							layoutOrder = 2,
							isAlert = true,
							label = var1.missingRobux,
							amount = math.max(totalPrice - robuxBalance, 0)
						})
					}),
					OrderTotal = reactModule.createElement(AmountLine, {
						layoutOrder = 2,
						label = var1.orderTotal,
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
					text = var1.buyRobux,
					variant = buttonVariant.Emphasis,
					onActivated = useOpenRobuxUpsellModule(totalPrice, p1.onClose)
				}
			}
		})
	})
end