local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local priceBoxLineLayoutModule = require(script.Parent.PriceBoxLineLayout)
local priceModule = require(script.Parent.Price)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(p1)
	-- upvalues: useTokens (ref), priceBoxLineVariantEnumModule (ref), reactModule (ref), priceBoxLineLayoutModule (ref), text (ref), view (ref), priceModule (ref)
	local var1 = useTokens()
	local t = {
		LineHeight = var1.Typography.BodyLarge.LineHeight,
		FontSize = var1.Typography.BodyLarge.FontSize,
		Font = if p1.variant == priceBoxLineVariantEnumModule.Danger then var1.Typography.TitleLarge.Font else var1.Typography.BodyLarge.Font
	}
	local default = var1.Color.Content.Default
	
	if p1.variant == priceBoxLineVariantEnumModule.Highlight then
		default = var1.Color.Content.Emphasis
	elseif p1.variant == priceBoxLineVariantEnumModule.Danger then
		default = var1.Color.System.Alert
	end
	return reactModule.createElement(priceBoxLineLayoutModule, {
		LayoutOrder = p1.LayoutOrder,
		startSlot = reactModule.createElement(text, {
			tag = "auto-xy",
			fontStyle = t,
			textStyle = default,
			Text = p1.text
		}),
		endSlot = if p1.originalPrice then reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, {
			OriginalPrice = reactModule.createElement(priceModule, {
				strikethrough = true,
				LayoutOrder = 1,
				textStyle = default,
				fontStyle = t,
				amount = p1.originalPrice
			}),
			CurrentPrice = reactModule.createElement(priceModule, {
				LayoutOrder = 2,
				textStyle = default,
				fontStyle = t,
				amount = p1.amount
			})
		}) else reactModule.createElement(priceModule, { textStyle = default, fontStyle = t, amount = p1.amount })
	})
end