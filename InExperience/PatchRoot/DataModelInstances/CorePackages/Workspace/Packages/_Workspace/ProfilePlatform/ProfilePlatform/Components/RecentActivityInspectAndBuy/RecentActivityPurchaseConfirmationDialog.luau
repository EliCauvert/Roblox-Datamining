local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local LocalizationService = game:GetService("LocalizationService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local NumberLocalization = require(Parent.Localization).NumberLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local IconName = FoundationModule.Enums.IconName
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), NumberLocalization (copy), LocalizationService (copy), GetIconRichTextFunction (copy), IconName (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		buyTitle = "IAPExperience.PurchasePrompt.Header.BuyAvatar",
		buyAction = "IAPExperience.PurchasePrompt.Action.Buy",
		totalPrice = "IAPExperience.PurchasePrompt.Label.TotalPriceV2"
	})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = DialogSize.Small,
		onClose = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			if not p1.isPurchasing then
				p1.onCancel()
				
				return
			end
		end, { p1.isPurchasing, p1.onCancel })
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.buyTitle }),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			PriceTotal = ReactModule.createElement(View, {
				tag = "size-full-1300 padding-bottom-large padding-left-xxsmall padding-right-xxsmall padding-top-small"
			}, {
				BorderContainer = ReactModule.createElement(View, {
					tag = "row align-x-center align-y-center auto-xy padding-x-large padding-y-xsmall stroke-default radius-medium"
				}, {
					LeftSide = ReactModule.createElement(View, {
						LayoutOrder = 1,
						tag = "row align-y-center gap-small padding-y-xsmall",
						Size = UDim2.new(0.5, 0, 1, 0)
					}, {
						Label = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy padding-y-xsmall text-title-medium text-align-x-left content-default",
							Text = UseLocalizationResult.totalPrice
						})
					}),
					RightSide = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-x-right align-y-center gap-large padding-y-xsmall",
						Size = UDim2.new(0.5, 0, 1, 0)
					}, {
						Price = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy padding-y-xsmall text-title-medium text-align-x-right content-emphasis",
							RichText = true,
							Text = ReactModule.useMemo(function(): string
								-- upvalues: NumberLocalization (upval), p1 (copy), LocalizationService (upval), GetIconRichTextFunction (upval), IconName (upval)
								return `{GetIconRichTextFunction(IconName.Robux)} {NumberLocalization.localize(p1.totalPrice, LocalizationService.RobloxLocaleId)}`
							end, { p1.totalPrice, LocalizationService.RobloxLocaleId })
						})
					})
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
					onActivated = p1.onConfirm
				}
			}
		})
	})
end