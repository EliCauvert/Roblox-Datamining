local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local Enums = FoundationModule.Enums
local LocalizationService = game:GetService("LocalizationService")
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)
local GetFFlagCurrencyTransferFixHeaderTouchPaddingModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixHeaderTouchPadding)

return function(p1) --[[ Line: 27 | Named "TransferRobuxHeader" ]]
	-- upvalues: ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), GetIconRichTextFunction (copy), Enums (copy), GetFFlagCurrencyTransferFixHeaderTouchPaddingModule (copy), UserInputService (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, { tag = "auto-xy align-y-center align-x-start row" }, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-default text-align-x-left",
				RichText = true,
				Text = `{GetIconRichTextFunction(Enums.IconName.RobloxPlus)} {p1.titleText}`
			})
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = if GetFFlagCurrencyTransferFixHeaderTouchPaddingModule() and UserInputService.TouchEnabled then "row align-y-center align-x-right gap-large padding-right-large" else "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-label-large content-emphasis text-align-x-right",
				RichText = true,
				Text = ReactModule.useMemo(function(): string --[[ Line: 28 ]]
					-- upvalues: FormatNumberModule (upval), LocalizationService (upval), p1 (copy), GetIconRichTextFunction (upval), Enums (upval)
					return `{GetIconRichTextFunction(Enums.IconName.Robux)} {FormatNumberModule(LocalizationService.RobloxLocaleId, p1.robuxBalanceAmount or 0)}`
				end, {
					p1.robuxBalanceAmount,
					LocalizationService.RobloxLocaleId
				})
			})
		})
	})
end