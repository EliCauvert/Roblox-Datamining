local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)
local priceDEPRECATEDModule = require(script.Parent.Price_DEPRECATED)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)

return function(p0) --[[ line: 23 | named "PriceBoxLine_DEPRECATED" ]]
	-- upvalues: useDesignTokens (ref), priceBoxLineVariantEnumModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref), priceDEPRECATEDModule (ref)
	local var5 = useDesignTokens()
	local var6 = if p0.variant == priceBoxLineVariantEnumModule.Danger then {
		LineHeight = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.BodyLarge.LineHeight else var5.Semantic.Typography.Body.LineHeight,
		Font = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.TitleLarge.Font else var5.Semantic.Typography.Subheader.Font,
		FontSize = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.BodyLarge.FontSize else var5.Semantic.Typography.Body.FontSize,
		LetterSpacing = if fFlagRenameDeprecatedUIBloxTokens then var5.Typography.BodyLarge.LetterSpacing else var5.Semantic.Typography.Body.LetterSpacing
	} elseif fFlagRenameDeprecatedUIBloxTokens then var5.Typography.BodyLarge else var5.Semantic.Typography.Body
	local var7 = if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Default else var5.Semantic.Color.Text.Default
	
	if p0.variant == priceBoxLineVariantEnumModule.Highlight then
		var7 = if fFlagRenameDeprecatedUIBloxTokens then var5.Color.Content.Emphasis else var5.Semantic.Color.Text.Emphasis
	elseif p0.variant == priceBoxLineVariantEnumModule.Danger then
		var7 = if fFlagRenameDeprecatedUIBloxTokens then var5.Color.System.Alert else var5.Semantic.Color.Common.Alert
	end
	return reactModule.createElement(lineItemLayoutModule, {
		LayoutOrder = p0.LayoutOrder,
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = var6, colorStyle = var7, text = p0.text }),
		endSlot = reactModule.createElement(priceDEPRECATEDModule, { colorStyle = var7, fontStyle = var6, amount = p0.amount })
	})
end