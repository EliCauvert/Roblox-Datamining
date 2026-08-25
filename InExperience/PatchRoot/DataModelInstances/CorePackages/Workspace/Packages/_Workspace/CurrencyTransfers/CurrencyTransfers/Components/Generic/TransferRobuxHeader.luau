local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local getIconRichText = foundationModule.Utility.getIconRichText
local enums = foundationModule.Enums
local localizationService = game:GetService("LocalizationService")
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)
local getFFlagCurrencyTransferFixHeaderTouchPaddingModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixHeaderTouchPadding)

return function(p0)
	-- upvalues: reactModule (ref), formatNumberModule (ref), localizationService (ref), getIconRichText (ref), enums (ref), getFFlagCurrencyTransferFixHeaderTouchPaddingModule (ref), userInputService (ref), view (ref), text (ref)
	return reactModule.createElement(view, { tag = "auto-xy align-y-center align-x-start row" }, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				RichText = true,
				Text = `{getIconRichText(enums.IconName.RobloxPlus)} {p0.titleText}`
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = if getFFlagCurrencyTransferFixHeaderTouchPaddingModule() and userInputService.TouchEnabled then "row align-y-center align-x-right gap-large padding-right-large" else "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-large content-emphasis text-align-x-right",
				RichText = true,
				Text = reactModule.useMemo(function()
					-- upvalues: formatNumberModule (copy), localizationService (copy), p0 (ref), getIconRichText (copy), enums (copy)
					return `{getIconRichText(enums.IconName.Robux)} {formatNumberModule(localizationService.RobloxLocaleId, p0.robuxBalanceAmount or 0)}`
				end, {
					p0.robuxBalanceAmount,
					localizationService.RobloxLocaleId
				})
			})
		})
	})
end