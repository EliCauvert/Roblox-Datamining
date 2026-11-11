local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local PriceBoxLineLayoutModule = require(script.Parent.PriceBoxLineLayout)
local PriceModule = require(script.Parent.Price)
local PriceBoxLineVariantEnumModule = require(BulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), PriceBoxLineVariantEnumModule (copy), ReactModule (copy), PriceBoxLineLayoutModule (copy), Text (copy), View (copy), PriceModule (copy)
	local UseTokensResult = UseTokensFunction()
	local FontStyle = {
		LineHeight = UseTokensResult.Typography.BodyLarge.LineHeight,
		FontSize = UseTokensResult.Typography.BodyLarge.FontSize,
		Font = if Frame.variant == PriceBoxLineVariantEnumModule.Danger then UseTokensResult.Typography.TitleLarge.Font else UseTokensResult.Typography.BodyLarge.Font
	}
	local Emphasis = if Frame.variant == PriceBoxLineVariantEnumModule.Highlight then UseTokensResult.Color.Content.Emphasis elseif Frame.variant == PriceBoxLineVariantEnumModule.Danger then UseTokensResult.Color.System.Alert else UseTokensResult.Color.Content.Default
	
	return ReactModule.createElement(PriceBoxLineLayoutModule, {
		LayoutOrder = Frame.LayoutOrder,
		startSlot = ReactModule.createElement(Text, {
			tag = "auto-xy",
			fontStyle = FontStyle,
			textStyle = Emphasis,
			Text = Frame.text
		}),
		endSlot = if Frame.originalPrice then ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
			OriginalPrice = ReactModule.createElement(PriceModule, {
				strikethrough = true,
				LayoutOrder = 1,
				textStyle = Emphasis,
				fontStyle = FontStyle,
				amount = Frame.originalPrice
			}),
			CurrentPrice = ReactModule.createElement(PriceModule, {
				LayoutOrder = 2,
				textStyle = Emphasis,
				fontStyle = FontStyle,
				amount = Frame.amount
			})
		}) else ReactModule.createElement(PriceModule, {
			textStyle = Emphasis,
			fontStyle = FontStyle,
			amount = Frame.amount
		})
	})
end