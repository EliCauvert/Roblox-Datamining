local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)
local priceDEPRECATEDModule = require(script.Parent.Price_DEPRECATED)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(p0) --[[ line: 21 | named "PriceBoxLine_DEPRECATED" ]]
	-- upvalues: useDesignTokens (ref), priceBoxLineVariantEnumModule (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), priceDEPRECATEDModule (ref)
	local var5 = useDesignTokens()
	local var6 = if p0.variant == priceBoxLineVariantEnumModule.Danger then {
		LineHeight = var5.Typography.BodyLarge.LineHeight,
		Font = var5.Typography.TitleLarge.Font,
		FontSize = var5.Typography.BodyLarge.FontSize,
		LetterSpacing = var5.Typography.BodyLarge.LetterSpacing
	} else var5.Typography.BodyLarge
	local default = var5.Color.Content.Default
	
	if p0.variant == priceBoxLineVariantEnumModule.Highlight then
		default = var5.Color.Content.Emphasis
	elseif p0.variant == priceBoxLineVariantEnumModule.Danger then
		default = var5.Color.System.Alert
	end
	return reactModule.createElement(lineItemLayoutModule, {
		LayoutOrder = p0.LayoutOrder,
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = var6, colorStyle = default, text = p0.text }),
		endSlot = reactModule.createElement(priceDEPRECATEDModule, {
			colorStyle = default,
			fontStyle = var6,
			amount = p0.amount
		})
	})
end