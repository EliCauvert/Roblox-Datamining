local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local styledTextLabel = require(parent.UIBlox).App.Text.StyledTextLabel
local lineItemLayoutModule = require(script.Parent.LineItemLayout)

return function(p0) --[[ line: 19 | named "ItemListHeader" ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), lineItemLayoutModule (ref), styledTextLabel (ref)
	local var2 = useDesignTokens()
	local t = {
		LineHeight = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.BodyLarge.LineHeight else var2.Semantic.Typography.Body.LineHeight,
		Font = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.TitleLarge.Font else var2.Semantic.Typography.Subheader.Font,
		FontSize = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.BodyLarge.FontSize else var2.Semantic.Typography.Body.FontSize,
		LetterSpacing = if fFlagRenameDeprecatedUIBloxTokens then var2.Typography.BodyLarge.LetterSpacing else var2.Semantic.Typography.Body.LetterSpacing
	}
	local var4 = if fFlagRenameDeprecatedUIBloxTokens then var2.Color.Content.Emphasis else var2.Semantic.Color.Text.Emphasis
	
	return reactModule.createElement(lineItemLayoutModule, {
		startSlot = reactModule.createElement(styledTextLabel, { fontStyle = t, colorStyle = var4, text = p0.heading }),
		endSlot = reactModule.createElement(styledTextLabel, { fontStyle = t, colorStyle = var4, text = p0.itemCount }),
		LayoutOrder = p0.LayoutOrder
	})
end