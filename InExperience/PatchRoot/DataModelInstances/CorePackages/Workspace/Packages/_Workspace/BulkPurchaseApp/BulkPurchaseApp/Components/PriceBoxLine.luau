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

return function(p0) --[[ line: 22 | named "PriceBoxLine" ]]
	-- upvalues: useTokens (ref), priceBoxLineVariantEnumModule (ref), reactModule (ref), priceBoxLineLayoutModule (ref), text (ref), view (ref), priceModule (ref)
	local var6 = useTokens()
	local t = {
		LineHeight = var6.Typography.BodyLarge.LineHeight,
		FontSize = var6.Typography.BodyLarge.FontSize,
		Font = if p0.variant == priceBoxLineVariantEnumModule.Danger then var6.Typography.TitleLarge.Font else var6.Typography.BodyLarge.Font
	}
	local default = var6.Color.Content.Default
	
	if p0.variant == priceBoxLineVariantEnumModule.Highlight then
		default = var6.Color.Content.Emphasis
	elseif p0.variant == priceBoxLineVariantEnumModule.Danger then
		default = var6.Color.System.Alert
	end
	return reactModule.createElement(priceBoxLineLayoutModule, {
		LayoutOrder = p0.LayoutOrder,
		startSlot = reactModule.createElement(text, {
			tag = "auto-xy",
			fontStyle = t,
			textStyle = default,
			Text = p0.text
		}),
		endSlot = if p0.originalPrice then reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, {
			OriginalPrice = reactModule.createElement(priceModule, {
				strikethrough = true,
				LayoutOrder = 1,
				textStyle = default,
				fontStyle = t,
				amount = p0.originalPrice
			}),
			CurrentPrice = reactModule.createElement(priceModule, {
				LayoutOrder = 2,
				textStyle = default,
				fontStyle = t,
				amount = p0.amount
			})
		}) else reactModule.createElement(priceModule, { textStyle = default, fontStyle = t, amount = p0.amount })
	})
end