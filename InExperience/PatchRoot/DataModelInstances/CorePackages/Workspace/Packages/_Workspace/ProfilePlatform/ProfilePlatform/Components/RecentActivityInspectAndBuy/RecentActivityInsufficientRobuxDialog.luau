local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NumberLocalization = require(Parent.Localization).NumberLocalization
local UseOpenRobuxUpsellModule = require(ProfilePlatform.Components.InspectAvatar.useOpenRobuxUpsell)
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
	-- upvalues: UseLocalizationFunction (copy), UseOpenRobuxUpsellModule (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), AmountLine (copy), Orientation (copy), ButtonVariant (copy)
	local TotalPrice = p1.totalPrice
	local RobuxBalance = p1.robuxBalance
	local Largest = math.max(TotalPrice - RobuxBalance, 0)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "IAPExperience.InsufficientRobux.Title.InsufficientRobux",
		currentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance",
		missingRobux = "IAPExperience.InsufficientRobux.Text.MissingRobux",
		orderTotal = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		buyRobux = "IAPExperience.InsufficientRobux.Action.BuyRobux"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Small,
		onClose = p1.onClose
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
							amount = RobuxBalance
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
					onActivated = UseOpenRobuxUpsellModule(TotalPrice, p1.onClose)
				}
			}
		})
	})
end