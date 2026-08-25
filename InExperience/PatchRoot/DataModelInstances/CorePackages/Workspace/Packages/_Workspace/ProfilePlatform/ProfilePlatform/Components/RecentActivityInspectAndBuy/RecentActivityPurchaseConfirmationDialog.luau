local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local numberLocalization = require(parent.Localization).NumberLocalization
local view = foundationModule.View
local text = foundationModule.Text
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local iconName = foundationModule.Enums.IconName
local getIconRichText = foundationModule.Utility.getIconRichText

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), numberLocalization (ref), localizationService (ref), getIconRichText (ref), iconName (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), orientation (ref), buttonVariant (ref)
	local var3 = useLocalization({
		buyTitle = "IAPExperience.PurchasePrompt.Header.BuyAvatar",
		buyAction = "IAPExperience.PurchasePrompt.Action.Buy",
		totalPrice = "IAPExperience.PurchasePrompt.Label.TotalPriceV2"
	})
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		disablePortal = false,
		size = dialogSize.Small,
		onClose = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			if p0.isPurchasing then
				return
			end
			p0.onCancel()
		end, { p0.isPurchasing, p0.onCancel })
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var3.buyTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			PriceTotal = reactModule.createElement(view, {
				tag = "size-full-1300 padding-bottom-large padding-left-xxsmall padding-right-xxsmall padding-top-small"
			}, {
				BorderContainer = reactModule.createElement(view, {
					tag = "row align-x-center align-y-center auto-xy padding-x-large padding-y-xsmall stroke-default radius-medium"
				}, {
					LeftSide = reactModule.createElement(view, {
						LayoutOrder = 1,
						tag = "row align-y-center gap-small padding-y-xsmall",
						Size = UDim2.new(0.5, 0, 1, 0)
					}, {
						Label = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-xy padding-y-xsmall text-title-medium text-align-x-left content-default",
							Text = var3.totalPrice
						})
					}),
					RightSide = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-x-right align-y-center gap-large padding-y-xsmall",
						Size = UDim2.new(0.5, 0, 1, 0)
					}, {
						Price = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-xy padding-y-xsmall text-title-medium text-align-x-right content-emphasis",
							RichText = true,
							Text = reactModule.useMemo(function()
								-- upvalues: numberLocalization (copy), p0 (ref), localizationService (copy), getIconRichText (copy), iconName (copy)
								return `{getIconRichText(iconName.Robux)} {numberLocalization.localize(p0.totalPrice, localizationService.RobloxLocaleId)}`
							end, { p0.totalPrice, localizationService.RobloxLocaleId })
						})
					})
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Horizontal,
			actions = {
				{
					text = var3.buyAction,
					variant = buttonVariant.Emphasis,
					onActivated = p0.onConfirm
				}
			}
		})
	})
end