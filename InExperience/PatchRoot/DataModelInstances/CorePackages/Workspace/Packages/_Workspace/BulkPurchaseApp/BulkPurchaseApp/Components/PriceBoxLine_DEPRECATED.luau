local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)
local priceDEPRECATEDModule = require(script.Parent.Price_DEPRECATED)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(p1)
	-- upvalues: useDesignTokens (ref), priceBoxLineVariantEnumModule (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), priceDEPRECATEDModule (ref)
	local var1 = useDesignTokens()
	local var2 = if p1.variant == priceBoxLineVariantEnumModule.Danger then {
		LineHeight = var1.Typography.BodyLarge.LineHeight,
		Font = var1.Typography.TitleLarge.Font,
		FontSize = var1.Typography.BodyLarge.FontSize,
		LetterSpacing = var1.Typography.BodyLarge.LetterSpacing
	} else var1.Typography.BodyLarge
	local default = var1.Color.Content.Default
	
	if p1.variant == priceBoxLineVariantEnumModule.Highlight then
		default = var1.Color.Content.Emphasis
	elseif p1.variant == priceBoxLineVariantEnumModule.Danger then
		default = var1.Color.System.Alert
	end
	return reactModule.createElement(lineItemLayoutModule, {
		LayoutOrder = p1.LayoutOrder,
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = var2, colorStyle = default, text = p1.text }),
		endSlot = reactModule.createElement(priceDEPRECATEDModule, {
			colorStyle = default,
			fontStyle = var2,
			amount = p1.amount
		})
	})
end